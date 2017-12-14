<template>
    <div id='app'>
        <v-header></v-header>
        <router-view></router-view>
    </div>
</template>

<script>
    import Header from './components/common/header.vue';

    export default {
        name: 'app',
        components: {
            'v-header': Header
        }
    }
</script>
