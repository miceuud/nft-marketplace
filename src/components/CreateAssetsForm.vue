<template>
  <b-container>
    <!-- pass props  -->
    <b-form v-bind="asset" @submit.prevent="createAsset">
      <b-form-group>
        <b-form-input
          placeholder="Asset Name"
          type="text"
          v-model="asset.name"
          required
        ></b-form-input>
      </b-form-group>
      <b-form-group>
        <b-form-textarea
          placeholder="Asset Description"
          type="text"
          v-model="asset.description"
          required
        ></b-form-textarea>
      </b-form-group>
      <b-form-group>
        <b-form-input
          placeholder="Price in ETH"
          type="number"
          v-model="asset.amount"
          required
        >
        </b-form-input>
      </b-form-group>
      <b-form-group>
        <b-form-file required v-model="asset.file" ref="file"> </b-form-file>
      </b-form-group>
      <b-button type="submit"> Create Digital Asset</b-button>
    </b-form>
  </b-container>
</template>

<script>
export default {
  props: {
    asset: {
      type: Object,
    },
  },
  data() {
    return {};
  },
  methods: {
    createAsset() {
      //  check inputs

      // pass to parent
      this.$emit("createdAssets");
    },
  },
};
</script>

<style></style>
