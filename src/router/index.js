import Vue from 'vue'
import VueRouter from 'vue-router'

import Login from '../views/login'
import Index from 'views/index/index'
import ProblemSet from 'views/problemset/problemset'
import Problem from 'views/problem/problem'

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
  },
  {
    path: '/problem/:pid',
    component: Problem
  }
]

const router = new VueRouter({
  routes,
  mode: 'history'
})

export default router
