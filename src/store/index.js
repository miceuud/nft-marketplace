import Vue from "vue";
import Vuex from "vuex";

Vue.use(Vuex);

export default new Vuex.Store({
  state: {
    account: "",
    assets: [],
  },
  mutations: {
    CREATE_ASSETS() {
      // state.assets.push(asset);
    },
    LOGIN_ACCOUNT(state, account) {
      state.account = account;
    },
  },
  actions: {
    CREATE_LOGIN_ACCOUNT({ commit }, account) {
      commit("LOGIN_ACCOUNT", account);
    },
  },
  getters: {},

  modules: {},
});
