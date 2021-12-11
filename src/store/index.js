import Vue from "vue";
import Vuex from "vuex";

Vue.use(Vuex);

export default new Vuex.Store({
  state: {
    account: "",
    assets: [],
  },
  mutations: {
    CREATE_ASSETS(state,value) {
      state.assets.push(value)
    },
  },
  actions: {
    
  },
  modules: {},
});
