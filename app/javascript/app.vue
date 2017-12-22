<template>
    <div id='app'>
        <v-header></v-header>
        <div class='container'>
            <div class='row'>
                <div class='col'>
                    <router-view></router-view>
                </div>
                <div class='col-3'>
                    <v-navbar></v-navbar>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
    import Header from './components/common/header.vue';
    import NavBar from './components/common/navbar.vue';

    export default {
        name: 'app',
        components: {
            'v-header': Header,
            'v-navbar': NavBar
        }
    }
</script>
