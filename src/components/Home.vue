<template>
  <div class="">
    <ul v-for="link in links" :key="link.title">
      <li></li>
    </ul>
  </div>
</template>

<script>
export default {
  name: "Home",
  props: {},
  data() {
    return {
      header: "UMT NFT Marketplace",
      links: [
        {
          title: "Collections",
          url: "",
        },
        {
          title: "My assets",
          url: "",
        },
        {
          title: "Dashbaord",
          url: "",
        },
      ],
    };
  },
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped></style>
