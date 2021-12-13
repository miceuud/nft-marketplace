<template>
  <div>
    <b-container>
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
          <b-form-file required type="file" @change="saveFile" ref="file-input">
          </b-form-file>
        </b-form-group>
        <b-button type="submit"> Create Digital Asset</b-button>
      </b-form>
    </b-container>
  </div>
</template>

<script>
import { create } from "ipfs-http-client";
export default {
  data() {
    return {
      asset: {
        name: "",
        description: "",
        amount: "",
        sold: false,
        nft: null,
        account: "",
      },
    };
  },
  components: {},
  methods: {
    // field file for input
    saveFile(event) {
      this.asset.nft = event.target.files[0];
    },
    // initialize ipfs
    async ipfsClient(arg) {
      try {
        const ipfs = await create("https://ipfs.infura.io:5001/api/v0");
        let response = await ipfs.add(arg);
        return response.path;
      } catch (e) {
        console.log(e.message);
        return;
      }
    },
    clearFiles() {
      this.$refs["file-input"].reset();
    },
    // create nft
    async createAsset() {
      if (
        !this.asset.name ||
        !this.asset.description ||
        !this.asset.amount ||
        !this.asset.nft
      ) {
        console.log("fields are required");
        return;
      }

      if (!this.$store.state.account) {
        console.log("Please login with a valid wallet");
        return;
      }
      // nft ipfs url
      let imagePath = await this.ipfsClient(this.asset.file);
      imagePath = `https://ipfs.infura.io:5001/api/v0/${imagePath}`;

      console.log(imagePath);

      let assets = {
        name: this.asset.name,
        description: this.asset.description,
        amount: this.asset.amount,
        sold: false,
        nft: imagePath,
        account: this.$store.state.account,
      };
      // asset ipfs uri
      try {
        let assetUri = await this.ipfsClient(JSON.stringify(assets));
        console.log(assetUri);
      } catch (error) {
        console.log(error.message);
        return;
      }

      for (const keys in this.asset) {
        // reset value
        this.asset[keys] = "";
      }
      // reset the file input field
      this.clearFiles();
      this.$router.push("/");
    },
  },
};
</script>

<style></style>
