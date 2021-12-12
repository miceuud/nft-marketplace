<template>
  <div class="">
    <div class="intro-container">
      <b-container>
        <div class="intro-items">
          <div>Buy</div>
          <div>Collect and find more</div>
          <div>Valuable NFTs</div>
        </div>
        <div>
          <b-button> Explore </b-button>
          <b-button>
            <router-link to="create-asset"> Create </router-link>
          </b-button>
        </div>
      </b-container>
    </div>
    <home />
  </div>
</template>

<script>
import Home from "../components/Home.vue";
export default {
  name: "",
  components: { Home },
};
</script>
<style scoped>
.intro-container {
  margin: 2rem 0;
}
.intro-items div {
  font-size: 2rem;
  /* text-transform: capitalize; */
}
.btn {
  margin: 1rem 10px;
}
</style>
