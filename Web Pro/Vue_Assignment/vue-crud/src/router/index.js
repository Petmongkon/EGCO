import Vue from 'vue'
import Router from 'vue-router'
import LogIn from '@/components/LogIn'
import ListPage from '@/components/ListPage'
import Register from '@/components/Register'
import AddUser from '@/components/AddUser'
import EditUser from '@/components/EditUser'

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/',
      name: 'LogIn',
      component: LogIn
    },
    {
      path: '/listpage',
      name: '/ListPage',
      component: ListPage
    },
    {
      path: '/register',
      name: '/Register',
      component: Register
    },
    {
      path: '/adduser',
      name: '/AddUser',
      component: AddUser
    },
    {
      path: '/edituser',
      name: '/EditUser',
      component: EditUser,
      props: true
    },
    
  ]
  
})

