import Vue from 'vue'
import Router from 'vue-router'
import SignIn from '@/components/SignIn'
import SignUp from '@/components/SignUp'
import Main from '@/components/Main'
import Detail from '@/components/Detail'

Vue.use(Router)

let router = new Router({
  routes: [
    {
      path: '/',
      redirect:'/signin'
    },
    {
      path:'*',
      redirect:'/signin'
    },
    {
      path:'/signin',
      name:'SignIn',
      component:SignIn
    },
    {
      path: '/signup',
      name: 'SignUp',
      component: SignUp
    },
    {
      path: '/main',
      name: 'Main',
      component: Main,
      meta:{
        requiresAuth : true
      }
    },
    {
      path: '/detail/:cityname',
      name:'Detail',
      component:Detail,
      meta:{
        requiresAuth:true
      }
    }
  ]
})

router.beforeEach((to, from, next) => {
  let currentUser = firebase.auth().currentUser
  let requiresAuth = to.matched.some(record => record.meta.requiresAuth)
  if (requiresAuth && !currentUser) {
    next('signin')
  } else if (!requiresAuth && currentUser) {
    next('main')
  } else {
    next()
  }
})

export default router
