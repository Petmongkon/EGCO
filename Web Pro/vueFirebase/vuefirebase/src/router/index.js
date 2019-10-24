import Vue from 'vue'
import Router from 'vue-router'
import MovieList from '@/components/MovieList'
import SignIn from '@/components/SignIn'
import SignUp from '@/components/SignUp'

Vue.use(Router)

let router = new Router({
  routes: [
    {
      path: '/movielist',
      name: 'MovieList',
      component: MovieList,
      // meta:{
      //   requiresAuth : true
      // }
    },
    {
      path: '/',
      redirect:'/singin'
    },
    {
      path: '*',
      name:'Signin',
      component:SignIn
    },
    {
      path: '/signup',
      name: 'SignUp',
      component: SignUp
    }
  ]
})

router.beforeEach((to, from, next) => {
  let currentUser = firebase.auth().currentUser
  let requiresAuth = to.matched.some(record => record.meta.requiresAuth)
  if (requiresAuth && !currentUser) {
    next('signin')
  } else if (!requiresAuth && currentUser) {
    next('movie')
  } else {
    next()
  }
})

export default router