<template>
  <div id="app">
    <div id="nav">
      <router-link to="/">
        <header class="logo">{{ header }}</header>
      </router-link>
      <!-- <router-link to="/about">About</router-link> -->
      <div class="nav">
        <ul>
          <li v-for="link in links" :key="link.title">
            <router-link :to="link.url">
              {{ link.title }}
            </router-link>
          </li>
        </ul>
        <div class="login" @click="loginButton">
          {{ this.$store.state.account || "Login" }}
        </div>
      </div>
    </div>
    <router-view />
  </div>
</template>

<script>
import {} from "@/views/Home.vue";
export default {
  data() {
    return {
      header: "Nft Marketplace",
      links: [
        {
          title: "Sell Asset",
          url: "create-asset",
        },
        {
          title: "My Collections",
          url: "collections",
        },
        {
          title: "Dashboard",
          url: "dashboard",
        },
      ],
    };
  },
  components: {},
  methods: {
    async loginButton() {
      if (typeof window.ethereum !== "undefined") {
        let result = await window.ethereum.request({
          method: "eth_requestAccounts",
        });
        this.$store.state.account = result[0];
      }
    },
  },
};
</script>

<style>
@import url("https://fonts.googleapis.com/css2?family=Comforter+Brush&display=swap");
#app {
  font-family: Montserrat, Helvetica, Arial, "Comforter Brush", cursive,
    sans-serif;
}
#nav {
  margin-top: 10px;
}
.logo {
  font-family: "Comforter Brush";
  font-size: 2rem;
  margin-left: 2rem;
  top: 10px;
}
a {
  text-decoration: none;
  text-decoration-color: none;
}
a :hover {
  text-decoration: none;
  text-decoration-line: none;
}
ul {
  display: flex;
}
li {
  list-style: none;
  margin-right: 1.5rem;
  font-size: 1.2rem;
}
a {
  text-decoration: none;
}
.nav {
  position: absolute;
  right: 3rem;
  top: 12px;
}
.login {
  position: relative;
  font-size: 1.2rem;
  cursor: pointer;
}
</style>
