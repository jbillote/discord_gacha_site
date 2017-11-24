<template>
    <div id='app'>
        <span v-bind:title='message'>
            <p class='header'>Discord Gacha</p>
        </span>
    </div>
</template>

<script>
    export default {
        data: function() {
            return {
                message: 'Coming Soon'
            }
        }
    }
</script>

<style scoped>
    .header {
        font-size: 2em;
        text-align: center;
    }
</style>
