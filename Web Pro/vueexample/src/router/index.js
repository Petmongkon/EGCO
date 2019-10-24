import Vue from 'vue'
import Router from 'vue-router'
import AddUser from '@/components/AddUser'

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/',
      name: 'AddUser',
      component: AddUser
    }
  ]
})
