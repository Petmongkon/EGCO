import Vue from 'vue'
import Router from 'vue-router'
import Skill from '@/components/Skill'

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/',
      name: 'Skill',
      component: Skill
    }
  ]
})
