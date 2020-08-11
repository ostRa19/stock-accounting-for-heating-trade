<template>
    <div>
        <div class="jumbotron jumbotron-fluid">
            <div class="container">
                <h3 class="display-3">Замовлення #{{order.id}}</h3>
            </div>
        </div>
        <div class="orders-list">
            <div class="row" style="margin-bottom: 5px;">
                <div class="col-md-2"><strong>ID</strong></div>
                <div class="col-md-2"><strong>Створено</strong></div>
                <div class="col-md-2"><strong>Всього</strong></div>
                <div class="col-md-2"><strong>Статус</strong></div>
            </div>
            <div class="row" style="margin-bottom: 5px;">
                <div class="col-md-2">{{order.id}}</div>
                <div class="col-md-2">{{order.created_at | formatDate}}</div>
                <div class="col-md-2">{{order.total}}</div>
                <div class="col-md-2">{{order.status}}</div>
            </div>

            <div class="row" style="margin-bottom: 5px;">
                <div class="col-xs-12">

                    <table class="table table-striped">
                        <thead>
                        <tr>
                            <th class="col-sm-8">Товар</th>
                            <th class="col-sm-2">Цiна</th>
                            <th class="col-sm-2">Кiлькiсть</th>
                        </tr>
                        </thead>

                        <tbody>
                        <tr v-for="product in order.order_data">
                            <td><a :href="productRoute + '/' + product.product_id">{{product.product.name}}</a></td>
                            <td>{{product.price}}</td>
                            <td>{{product.qty}}</td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>

            <div class="row">
                <div class="col-xs-12">
                    <a :href="'/order/'+ order.id + '/print'" class="btn btn-info">Друк</a>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
    export default {
        name: "OrderInfo",
        props: ['order', 'productRoute'],
    }
</script>

<style scoped>

</style>