<template>
    <div>
        <div class="row">
            <div class="col-sm-7">
                <form method="post" :action="baseUrl+'/cart/add-to-cart'">
                    <p>{{ itemData.description }}</p>
                    <p>Цiна: <span id="single-price">{{ itemData.price }}</span></p>
                    <p>У наявностi: <span id="single-qty">{{ itemData.qty > 0 ? itemData.qty : 'Передзамовлення' }}</span></p>
                    <input type="hidden" name="_token" :value="csrf">
                    <input type="hidden" name="productId" :value="itemData.id">
                    <div class="row">
                        <div class="form-group col-sm-6">
                            <label class="control-label" for="single-productQty">Кiлькicть</label>
                            <input type="number" class="form-control" name="productQty"
                                   id="single-productQty" placeholder="QTY" v-model="qty"
                                   min="1" max="99" required>
                        </div>

                    </div>
                    <div>Загалом: {{total}}</div>
                    <button class="btn btn-primary" type="submit">{{ itemData.qty > 0 ? 'Додати в кошик' : 'Замовити' }}</button>
                </form>
            </div>
            <div class="col-sm-5">
                <img class="img-thumbnail" :alt="'product id'+itemData.id"
                     width="400" height="300"
                     :src="baseUrl+'/images/'+itemData.image">
            </div>
        </div>
        <div class="row" v-for="property in itemData.properties">
            <div class="col-sm-7">
                {{property.properties.name}}&nbsp;:&nbsp;{{property.value}}
            </div>
        </div>
    </div>
</template>

<script>
    export default {
        name: 'SingleItem',
        props: ['itemData'],
        data() {
            return {
                baseUrl: '',
                csrf: '',
                qty: 1
            }
        },
        computed: {
            total () {
                return Math.round(this.itemData.price*100)* this.qty/100;
            }
        },
        mounted() {
            this.baseUrl = window.location.origin;
            this.csrf = document.head.querySelector('meta[name="csrf-token"]').content;
        }
    }
</script>
