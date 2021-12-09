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
      },
    };
  },
  components: {
    CreateAssets,
  },
  methods: {
    // receive from child component
    createdAssets() {
      let name = this.asset.name;

      let description = this.asset.description;
      let amount = this.asset.amount;

      console.log(name, description, amount);
    },
  },
};
</script>

<style></style>
