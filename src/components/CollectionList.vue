<template>
  <div>
    <!-- nft listing -->
    <div>
      <b-container>
        <b-row>
          <b-card-group>
            <b-col lg="4">
              <b-card
                title="Title"
                img-src="https://placekitten.com/g/380/200"
                img-alt="Image"
                img-top
              >
                <b-card-text>
                  This is a wider card with supporting text below as a natural
                  lead-in to additional content. This content is a little bit
                  longer.
                </b-card-text>
                <template #footer>
                  <small class="text-muted">Last updated 3 mins ago</small>
                  <b-button href="#" variant="primary">Buy</b-button>
                </template>
              </b-card>
            </b-col>
            <b-col lg="4">
              <b-card
                title="Title"
                img-src="https://placekitten.com/g/380/200"
                img-alt="Image"
                img-top
              >
                <b-card-text>
                  This is a wider card with supporting text below as a natural
                  lead-in to additional content. This content is a little bit
                  longer.
                </b-card-text>
                <template #footer>
                  <small class="text-muted">Last updated 3 mins ago</small>
                  <b-button href="#" variant="primary">Buy</b-button>
                </template>
              </b-card>
            </b-col>
            <b-col lg="4">
              <b-card
                title="Title"
                img-src="https://placekitten.com/g/380/200"
                img-alt="Image"
                img-top
              >
                <b-card-text>
                  This is a wider card with supporting text below as a natural
                  lead-in to additional content. This content is a little bit
                  longer.
                </b-card-text>
                <template #footer>
                  <small class="text-muted">Last updated 3 mins ago</small>
                  <b-button href="#" variant="primary">Buy</b-button>
                </template>
              </b-card>
            </b-col>
            <b-col lg="4">
              <b-card
                title="Title"
                img-src="https://placekitten.com/g/380/200"
                img-alt="Image"
                img-top
              >
                <b-card-text>
                  This is a wider card with supporting text below as a natural
                  lead-in to additional content. This content is a little bit
                  longer.
                </b-card-text>
                <template #footer>
                  <small class="text-muted">Last updated 3 mins ago</small>
                  <b-button href="#" variant="primary">Buy</b-button>
                </template>
              </b-card>
            </b-col>
            <b-col lg="4">
              <b-card
                title="Title"
                img-src="https://placekitten.com/g/380/200"
                img-alt="Image"
                img-top
              >
                <b-card-text>
                  This is a wider card with supporting text below as a natural
                  lead-in to additional content. This content is a little bit
                  longer.
                </b-card-text>
                <template #footer>
                  <small class="text-muted">Last updated 3 mins ago</small>
                  <b-button href="#" variant="primary">Buy</b-button>
                </template>
              </b-card>
            </b-col>
            <b-col lg="4">
              <b-card
                title="Title"
                img-src="https://placekitten.com/g/380/200"
                img-alt="Image"
                img-top
              >
                <b-card-text>
                  This is a wider card with supporting text below as a natural
                  lead-in to additional content. This content is a little bit
                  longer.
                </b-card-text>
                <template #footer>
                  <small class="text-muted">Last updated 3 mins ago</small>
                  <b-button href="#" variant="primary">Buy</b-button>
                </template>
              </b-card>
            </b-col>
            <b-col lg="4">
              <b-card
                title="Title"
                img-src="https://placekitten.com/g/380/200"
                img-alt="Image"
                img-top
              >
                <b-card-text>
                  This is a wider card with supporting text below as a natural
                  lead-in to additional content. This content is a little bit
                  longer.
                </b-card-text>
                <template #footer>
                  <small class="text-muted">Last updated 3 mins ago</small>
                  <b-button href="#" variant="primary">Buy</b-button>
                </template>
              </b-card>
            </b-col>
            <b-col lg="4">
              <b-card
                title="Title"
                img-src="https://placekitten.com/g/380/200"
                img-alt="Image"
                img-top
              >
                <b-card-text>
                  This is a wider card with supporting text below as a natural
                  lead-in to additional content. This content is a little bit
                  longer.
                </b-card-text>
                <template #footer>
                  <small class="text-muted">Last updated 3 mins ago</small>
                  <b-button href="#" variant="primary">Buy</b-button>
                </template>
              </b-card>
            </b-col>
            <b-col lg="4">
              <b-card
                title="Title"
                img-src="https://placekitten.com/g/380/200"
                img-alt="Image"
                img-top
              >
                <b-card-text>
                  This is a wider card with supporting text below as a natural
                  lead-in to additional content. This content is a little bit
                  longer.
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
    </div>
  </div>
</template>

<script>
// import { create } from "ipfs-http-client";
import { ethers } from "ethers";
import NFTMarket from "../artifacts/contracts/NftMarket.sol/NFTMarket.json";
// import MyNFT from "../artifacts/contracts/Nft.sol/MyNFT.json";
export default {
  data() {
    return {};
  },
  components: {},
  mounted: async function () {
    const provider = new ethers.providers.Web3Provider(window.ethereum);
    const signer = provider.getSigner();
    const contractAddress = process.env.VUE_APP_MARKETPLACE_CONTRACT_ADDRESS;

    let nftContract = new ethers.Contract(
      contractAddress,
      NFTMarket.abi,
      signer
    );
    let allAssets;

    try {
      allAssets = await nftContract.listAllNft();
      allAssets = await allAssets.wait();
      console.log(allAssets.events);
    } catch (error) {
      console.error(error.message);
    }
  },
};
</script>

<style></style>
