
const hre = require("hardhat");

async function main() {
  
  const  NftMarket= await hre.ethers.getContractFactory("NftMarket");
  const nftmarket = await Greeter.deploy("NftMarket");

  await greeter.deployed();

  // console.log("Greeter deployed to:", greeter.address);
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
