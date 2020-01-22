import Vue from 'vue'
import VueRouter from 'vue-router'

import Login from '../views/login'
import Index from 'views/index/index'
import ProblemSet from 'views/problemset/problemset'

Vue.use(VueRouter)

const routes = [
  {
    path: '/',
    redirect: '/index'
  },
  {
    path: '/login',
    component: Login
  },
  {
    path: '/index',
    component: Index
  },
  {
    path: '/problemset',
    component: ProblemSet
  }
]

const router = new VueRouter({
  routes,
  mode: 'history'
})

export default router
