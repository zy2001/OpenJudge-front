import Vue from 'vue'
import VueRouter from 'vue-router'

//deal with navigating to current location is not allowed
const routerPush = VueRouter.prototype.push
VueRouter.prototype.push = function push(location) {
  return routerPush.call(this, location).catch(error => error)
}


const Index = () => import('views/index/index')
const ProblemSet = () => import('views/problemset/problemset')
const Problem = () => import('views/problem/problem')
const ProblemDetail = () => import('components/content/problem/problemDetail')
const ProblemSubmit = () => import('components/content/problem/problemSubmit')
const ProblemSubmitStatus = () => import('components/content/problem/problemSubmitStatus')
const Status = () => import('views/status/status')

Vue.use(VueRouter)

const routes = [
  {
    path: '/',
    redirect: '/index'
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
    path: '/status',
    component: Status,
  },
  {
    path: '/problem/:pid',
    component: Problem,
    children: [
      {
        path: '',
        component: ProblemDetail
      },
      {
        path: 'detail',
        component: ProblemDetail
      },
      {
        path: 'submit',
        component: ProblemSubmit
      },
      {
        path: 'status',
        component: ProblemSubmitStatus
      }
    ]
  }
]

const router = new VueRouter({
  routes,
  mode: 'history'
})

export default router
