<template>
    <li><a :href="baseUrl +'/cart'"><img height="22" width="25" :src="baseUrl + '/images/cart-icon.png'">
        Додано: <span
                id="nav-items">{{ count }}</span>
        (<span id="nav-total">{{ total }}</span>)
    </a>
    </li>
</template>

<script>
    export default {
        name: "NavCart",
        props: ['cart'],
        data() {
            return {
                baseUrl: '',
                count: 0,
                total: 0,
            }
        },
        methods: {
            productCount() {
                Object.keys(this.cart).forEach(el=>{
                    if (typeof this.cart[el].productQty !== 'undefined') {
                        this.count += 1
                    }
                })
            }
        },
        created() {
            this.productCount()
            this.total = Object.keys(this.cart).length > 0 ? Math.round(this.cart.total*100)/100 : 0
        },
        mounted() {
            this.baseUrl = window.location.origin;

            this.$root.$on('nav_cart', data => {
                this.count = data.items
                this.total = Math.round(data.total*100)/100
            })
        },
    }
</script>

<style scoped>

</style>