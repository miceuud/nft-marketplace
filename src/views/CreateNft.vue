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
            type="text"
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
import { ethers } from "ethers";
import NFTMarket from "../artifacts/contracts/NftMarket.sol/NFTMarket.json";
import MyNFT from "../artifacts/contracts/Nft.sol/MyNFT.json";
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
  methods: {
    // get image
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
      let imageUrl;
      try {
        imageUrl = await this.ipfsClient(this.asset.nft);
        imageUrl = `https://ipfs.infura.io:5001/api/v0/${imageUrl}`;
      } catch (error) {
        console.error(error);
        return;
      }

      let assets = {
        name: this.asset.name,
        description: this.asset.description,
        amount: parseInt(this.asset.amount),
        sold: false,
        nft: imageUrl,
        account: this.$store.state.account,
      };
      // asset ipfs uri
      let assetUri;

      try {
        assetUri = await this.ipfsClient(JSON.stringify(assets));
        console.log(`this is the image uri: ${assetUri}`);
      } catch (error) {
        console.log(error.message);
        return;
      }

      const provider = new ethers.providers.Web3Provider(window.ethereum);
      const signer = provider.getSigner();
      const contractAddress =
        process.env.VUE_APP_MARKETPLACE_CONTRACT_ADDRESS ||
        0xc6e7df5e7b4f2a278906862b61205850344d4e7d;
      const nftAddress =
        process.env.VUE_APP_NFT_CONTRACT_ADDRESS ||
        0x59b670e9fa9d0a427751af201d676719a970857b;

      // create item
      const nftContract = new ethers.Contract(nftAddress, MyNFT.abi, signer);
      // create Asset
      let id;
      try {
        // create an nft
        let nftTokenId = await nftContract.createToken(assetUri);
        id = await nftTokenId.wait();
        // get token id
        id = await id.events[0].args[2].toString();
        console.log(id);
      } catch (error) {
        console.log("error here", error.message);
        return;
      }

      const marketplaceContract = new ethers.Contract(
        contractAddress,
        NFTMarket.abi,
        signer
      );

      let price = ethers.utils.parseUnits(this.asset.amount, "ether");

      let listing = price.toString();
      let overrides = {
        value: listing,
        gasLimit: 2000000,
      };

      try {
        // upload nft to marketplace
        let createAsset = await marketplaceContract.sellNftAsset(
          "0x59b670e9fA9D0A427751Af201D676719a970857b",
          id,
          price,
          overrides
        );
        createAsset = await createAsset.wait();
        console.log(createAsset);

        // createAsset = await createAsset.events[0];
        console.log("this is created", createAsset);
      } catch (error) {
        // reset ID
        (id = null), console.log("this is error", error);
        console.log(id);
        return;
      }

      for (const keys in this.asset) {
        // reset value
        this.asset[keys] = "";
      }
      // reset the file input field
      this.$refs["file-input"].reset();
      this.$router.push("/");
    },
  },
};
</script>

<style></style>
