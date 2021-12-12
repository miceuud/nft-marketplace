<template>
  <div>
    <div>
      <b-container v-if="$store.state.assets.length > 0">
        <b-row>
          <b-card-group>
            <b-col lg="4">
              <b-card
                title="Title"
                img-src="require('../assets/' + car.image)"
                img-alt="Image"
                img-top
              >
                <b-card-text>
                  <!-- {{ asset[index].description }} -->
                </b-card-text>
                <template #footer>
                  <small class="text-muted">Last updated 3 mins ago</small>
                  <b-button href="#" variant="primary">Buy</b-button>
                </template>
              </b-card>
            </b-col>
          </b-card-group>
        </b-row>
      </b-container>
      <div class="" v-if="!$store.state.assets.length">
        {{ data }}
      </div>
    </div>
    <!-- img-src="https://placekitten.com/g/380/200"  -->
  </div>
</template>

<script>
export default {
  name: "Home",
  // props: {
  //   asset:  {
  //     type: Object
  //   }
  // },
  data() {
    return {
      data: "there are no nft yet",
    };
  },
  mounted: function () {
    console.log(this.$store.state.assets[0]);
    // },
  },
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
.card {
  margin: 1rem 0;
}
.btn {
  margin-left: 1rem;
}
</style>
