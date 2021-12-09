<template>
  <div>
    <!-- receive props -->
    <create-assets :asset="asset" @createdAssets="createdAssets" />
  </div>
</template>

<script>
import CreateAssets from "../components/CreateAssetsForm.vue";
export default {
  data() {
    return {
      // receive props
      asset: {
        ame: "",
        description: "",
        amount: "",
        file: null,
        sold: false,
      },
    };
  },
  components: {
    CreateAssets,
  },
  methods: {
    // receive from child component
    createdAssets() {
      let assetObject = {
        name: this.asset.name,
        description: this.asset.description,
        amount: this.asset.amount,
        sold: this.asset.sold,
        account: this.$store.state.account,
      };
      this.$store.commit("CREATE_ASSETS", assetObject);
    },
  },
};
</script>

<style></style>
