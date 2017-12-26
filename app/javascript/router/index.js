import Error404 from '../pages/404.vue';
import Index from '../pages/index.vue';
import UserInfo from '../pages/user_info.vue';
import UserLookup from '../pages/user_lookup.vue';

import Router from 'vue-router';
import Vue from 'vue/dist/vue.esm';

Vue.use(Router);

export default new Router({
    routes: [
        {
            path: '/',
            name: 'Index',
            component: Index
        },
        {
            path: '/user',
            name: 'User Lookup',
            component: UserLookup
        },
        {
            path: '/user/:id',
            name: 'User Info',
            component: UserInfo
        },
        {
            path: '/*',
            name: '404',
            component: Error404
        }
    ]
});
