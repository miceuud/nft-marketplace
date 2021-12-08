<template>
  <div id="app">
    <div id="nav">
      <router-link to="/">
        <header>{{ header }}</header>
      </router-link>
      <!-- <router-link to="/about">About</router-link> -->
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
    };
  },
  components: {},
};
</script>

<style>
@import url("https://fonts.googleapis.com/css2?family=Comforter+Brush&display=swap");
#app {
  font-family: Montserrat, Helvetica, Arial, "Comforter Brush", cursive,
    sans-serif;
}
header {
  font-family: "Comforter Brush";
  font-size: 2rem;
}
a {
  text-decoration: none;
  text-decoration-color: none;
}
</style>
