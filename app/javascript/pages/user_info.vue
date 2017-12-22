<template>
    <div class='text-center'>
        <div v-if='!doneLoading' class='alert alert-info'>Fetching user info...</div>

        <div v-if='doneLoading && !error' >
            <div class='mb-3'>User info for {{ user.username }}</div>

            <div class='mb-3'>
                <b-form-select class='filter-dropdown' v-model='selected' :options='options'></b-form-select>
            </div>

            <div class='card-deck m-1 justify-content-center'>
                <v-card v-for='card in user.cards' v-if='selected == null || card.set == selected' :key='cardKey(card)' :cardInfo='card' :quantity='card.quantity'></v-card>
            </div>
        </div>
        <div v-if='doneLoading && error' class='alert alert-danger'>Something went wrong while fetching user info for {{ user.user_id }}.</div>
    </div>
</template>

<script>
    import Card from '../components/user_info/card.vue';

    import axios from 'axios';
    import bCard from 'bootstrap-vue/es/components/card/card';
    import bFormSelect from 'bootstrap-vue/es/components/form-select/form-select'

    export default {
        components: {
            'b-card': bCard,
            'v-card': Card,
            'b-form-select': bFormSelect,
        },

        data() {
            return {
                selected: null,
                options: [
                    {value: null, text: 'All Sets'},
                    {value: 'discord_waifus_GBF', text: 'Granblue Fantasy I'},
                    {value: 'discord_waifus_FE1', text: 'Fire Emblem I'}
                ],

                doneLoading: false,
                error: false,
                user: {}
            }
        },

        methods: {
            load: function() {
                var self = this;
                axios.get('/api/v1/user/' + this.$route.params.id)
                    .then(function(resp) {
                        self.doneLoading = true;
                        self.user = resp['data'];
                    }).catch(function(err) {
                        console.log(err);
                        self.doneLoading = true;
                    });
            },

            cardKey: function(card) {
                return card.id + ', ' + card.set;
            }
        },

        mounted() {
            this.load();
        }
    }
</script>
