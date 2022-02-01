const hre = require("hardhat");
// let fs = require('fs')

async function main() {
  const NFTMarket = await hre.ethers.getContractFactory("NFTMarket");
  const nftmarket = await NFTMarket.deploy();

  await nftmarket.deployed();
  const markeplaceAddress = nftmarket.address;
  console.log("this is the marketplace add:", markeplaceAddress);

  const MyNFT = await hre.ethers.getContractFactory("MyNFT");
  let myNft = await MyNFT.deploy(markeplaceAddress);
  myNft = await myNft.deployed();
  console.log("this is the nft add:", myNft.address);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
    });
