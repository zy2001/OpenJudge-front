import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    user: {
      username: '',
      id: -1
    },
    problem: {
      title: ''
    }
  },
  mutations: {
    login(state, res) {
      console.log(res)
      state.user.id = res.id
      state.user.username = res.username
    },
    setTitle(state, title) {
      state.problem.title = title
    }
  },
  actions: {
  },
  modules: {
  }
})
