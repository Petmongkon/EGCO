import Vue from 'vue'
import Router from 'vue-router'
import Main from '@/components/Main'
import SignIn from '@/components/SignIn'
import SignUp from '@/components/SignUp'

Vue.use(Router)

let router = new Router({
  routes: [
    {
      path: '/main',
      name: 'Main',
      component: Main,
      meta:{
        requiresAuth : true
      }
    },
    {
      path:'/signup',
      name:'SignUp',
      component:SignUp
    },
    {
      path:'*',
      redirect:'/signin'
    },
    {
      path:'/',
      redirect:'/signin'
    },
    {
      path:'/signin',
      name:'SignIn',
      component:SignIn
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