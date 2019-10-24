import Vue from 'vue'
import Router from 'vue-router'
import NewUser from '@/components/NewUser'
import UserList from '@/components/UserList'

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/new',
      name: 'NewUser',
      component: NewUser
    },
    {
      path: '/',
      name: 'UserList',
      component: UserList
    }
  ]
})
