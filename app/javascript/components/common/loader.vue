<template>
    <div v-if='!done' class='loader'></div>
</template>

<script>
    export default {
        data() {
            return {
                done: false
            }
        },

        methods: {
            hide: function() {
                this.done = true;
            }
        }
    }
</script>