<template>
    <div class='text-center'>
        <div class='mb-3'>
            User Lookup
        </div>
        <div class='mb-3'>
            <form role='form' class='form-inline justify-content-center'>
                <div class='form-group'>
                    <input type='text' ref='username' class='form-control mb-2 mr-sm-2 mb-sm-0' id='inputUsername' placeholder='Username' />
                </div>
                <div class='form-group'>
                    <button type='submit' v-on:click='fetchData' class='btn btn-primary'>Search</button>
                </div>
            </form>
        </div>
        <div>
            <div class='mb-1' v-for='user in users'>
                <router-link :to="{ path: '/user/' + user.user_id }">{{ user.username }}</router-link>
            </div>
        </div>
    </div>
</template>

<script>
    import axios from 'axios';

    export default {
        data() {
            return {
                users: ''
            }
        },

        methods: {
            fetchData() {
                var self = this;
                axios.get('/api/v1/search/user/' + self.$refs.username.value)
                    .then(function(resp) {
                        self.users = resp['data']['users'];
                    }).catch(function(err) {
                        console.log(err);
                    });
            }
        }
    }
</script>
