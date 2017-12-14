<template>
    <div v-if='Object.keys(card).length != 0'>
        <b-card v-bind='cardProps' style='max-width: 150px' class='mb-2'>
            <p>
                <span class='font-weight-bold'>Set</span>: {{ card.set }}
                <span class='font-weight-bold'>Rarity</span>: {{ card.rarity }}
                <span class='font-weight-bold'>Quantity</span>: {{ quantity }}
            </p>
        </b-card>
    </div>
</template>

<script>
    import axios from 'axios';
    import bCard from 'bootstrap-vue/es/components/card/card';

    export default {
        components: {
            'b-card': bCard
        },

        computed: {
            cardProps: function() {
                var props = {};

                props['title'] = this.card.name;
                props['img-src'] = this.card.image;

                return props;
            }
        },

        data() {
            return {
                card: {},
                quantity: -1
            }
        },

        methods: {
            load: function() {
                var self = this;
                axios.get('/api/v1/card/' + this.cardInfo['set'] + '/' + this.cardInfo['rarity'] + '/' + this.cardInfo['id'])
                    .then(function(resp) {
                        var card = {
                            rarity: self.cardInfo['rarity'].toUpperCase(),
                            image: resp['data']['image'],
                            name: resp['data']['name']
                        };

                        axios.get('/api/v1/set/' + self.cardInfo['set'])
                            .then(function(resp) {
                                card['set'] = resp['data']['name'];

                                self.card = card;
                            }).catch(function(err) {
                                console.log(err);
                            });
                    }).catch(function(err) {
                        console.log(err);
                    });
            }
        },

        mounted() {
            this.load();
        },

        props: {
            cardInfo: {
                type: Object,
                required: true
            },
            quantity: {
                type: Number,
                required: true
            }
        }
    }
</script>