const hre = require("hardhat");

async function main() {
  const NFTMarket = await hre.ethers.getContractFactory("NFTMarket");
  const nftmarket = await NFTMarket.deploy();

  await nftmarket.deployed();

  const markeplaceAddress = nftmarket.address;
  console.log(markeplaceAddress);
  const MyNFT = await hre.ethers.getContractFactory("MyNFT");
  const myNft = await MyNFT.deploy(markeplaceAddress);

  await myNft.deployed();
  console.log(myNft.address);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
