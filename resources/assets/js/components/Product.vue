<template>
    <div v-if="inFilter" class="col-lg-4 col-sm-6 product-cart">
        <div class="cart-wrapper">
            <div class="cart-header">
                <a :href="baseUrl+'/shop/' + product.id">
                    <h4 class="header">{{product.name}}</h4>
                </a>
                <p>Категорія: {{product.catalogs.name}}</p>
            </div>
            <div class="effect" @click="slide">
                <span class="glyphicon glyphicon-triangle-bottom" :class="{'up':!active}"></span>
            </div>

            <div class="thumbnail">
                <a :href="baseUrl+'/shop/' + product.id">
                    <div class="img-wrapper">
                        <vue-slide-up-down :active="active">
                            <img class="center-block" :alt="'product id '+product.id"
                                 :src="baseUrl+'/images/'+product.image" :class="{'is-displayed':active}">
                        </vue-slide-up-down>
                        <vue-slide-up-down :active="!active">
                            <p class="product-shop-desc" :class="{'is-displayed':!active}">Опис:<br>{{product.description}}</p>
                        </vue-slide-up-down>
                    </div>
                </a>
            </div>
            <p>Цiна: {{product.price}}
                <button type="button" class="btn btn-link add-to-cart" @click="addToCart(product.id)">
                    Додати в кошик
                </button>
            </p>
        </div>
    </div>

</template>

<script>
    import VueSlideUpDown from 'vue-slide-up-down'
    import axios from 'axios'

    export default {
        name: 'Product',
        components: {VueSlideUpDown},
        props: ['product'],
        data() {
            return {
                baseUrl: '',
                csrf: '',
                active: true,
                filters: {},
                fl: true
            }
        },
        computed: {
            inFilter() {
                if (this.fl === true) {}
                let toReturn = true;

                //filters are not defined
                if (Object.keys(this.filters).length === 0) {
                    return true;
                }

                // else if
                // The product has no one property
                if (this.product.properties.length === 0) {
                    return false
                }

                // The product hasn't property in filter
                Object.keys(this.filters).forEach(key => {
                    if (typeof this.product.properties.find(pr => +pr.property_id === +key) === 'undefined') {
                        toReturn = false;
                    }
                })

                if (!toReturn)
                    return false;

                this.product.properties.forEach(property => {
                    if (typeof this.filters[property.property_id] !== 'undefined') {
                        if (typeof this.filters[property.property_id].checked !== 'undefined') {
                            if (typeof this.filters[property.property_id].checked.find(el => (el.name === property.value && el.value)) === 'undefined') {
                                toReturn = false;
                            } else {
                                toReturn = true;
                            }
                        }

                        if (toReturn && this.filters[property.property_id].min) {
                            toReturn = +property.value >= +this.filters[property.property_id].min
                        }
                        if (toReturn && this.filters[property.property_id].max) {
                            toReturn = +property.value <= +this.filters[property.property_id].max
                        }

                    } else {
                        toReturn = false;
                    }
                })
                return toReturn;
            }
        },
        methods: {
            slide () {
                this.active = !this.active
            },
            addToCart(product_id) {
                axios.post(this.baseUrl+'/cart/add-to-cart', {
                    productId: product_id,
                    isRelated: 0,
                    productQty: 1,
                    _token: this.csrf
                }).then(response => {
                    this.$root.$emit('nav_cart', response.data)
                }).catch(e => {
                    window.location.href = '/login';
                    // console.log(e)
                    //this.errors.push(e)
                })
            },
        },
        mounted() {
            this.baseUrl = window.location.origin;
            this.csrf = document.head.querySelector('meta[name="csrf-token"]').content;
            this.$root.$on('product_filter', data => {

                if ( data.option === 'checked' ) {
                    if (typeof this.filters[data.property_id] === 'undefined') {
                        this.$set(this.filters, data.property_id, {checked: []});
                    }
                    if (typeof data.value.find(el => el.value) === 'undefined') {
                        delete this.filters[data.property_id];
                    } else  {
                        this.$set(this.filters[data.property_id], data.option, data.value);
                    }
                } else {
                    if (typeof this.filters[data.property_id] === 'undefined') {
                        this.$set(this.filters, data.property_id, {min: null, max: null});
                    }
                    if (!data.value) {
                        data.value = null;
                    }
                    this.$set(this.filters[data.property_id], data.option, data.value);
                    if (!this.filters[data.property_id].min && !this.filters[data.property_id].max) {
                        delete this.filters[data.property_id];
                    }
                }
                this.fl = !this.fl;
            });
        }
    }
</script>

<style lang="scss" scoped>
    .product-cart {
        margin-bottom: 15px;

        .cart-wrapper {
            border: 1px solid gray;
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
            text-align: center;

            .cart-header {
                height: 6em;
                position: relative;
            }
            .effect {
                margin-top: 5px;
                .glyphicon {
                    vertical-align: top;
                    -webkit-transition: 0.6s ease-out;
                    -moz-transition: 0.6s ease-out;
                    transition: 0.6s ease-out;
                }
                .glyphicon.up {
                    -webkit-transform: rotateZ(180deg);
                    -moz-transform: rotateZ(180deg);
                    transform: rotateZ(180deg);
                }
                .glyphicon-triangle-bottom {
                    cursor: pointer;
                }

            }
            .thumbnail{
                a:hover {
                    text-decoration: none;
                }
                .img-wrapper {
                    width: 100%;
                    padding-bottom: 100%; /* your aspect ratio here! */
                    position: relative;
                    height: 20em;

                    .product-shop-desc {
                        text-align: justify;
                        padding: 0px 7px;
                    }
                    img {
                        position: relative;
                        top: 0;
                        bottom: 0;
                        left: 0;
                        right: 0;
                        max-width: 100%;
                    }
                }
            }
        }
    }
</style>
