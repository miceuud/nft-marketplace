const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("MyNFT", function () {
  
  it("nft sales transaction ", async function () {
    const NFTMarket = await ethers.getContractFactory("NFTMarket");
    const nftnarket = await NFTMarket.deploy();
    await mynft.deployed();

    const address = mynft.address;

    const MyNFT = await ethers.getContractFactory("MyNFT");
    const mynft = await MyNFT.deploy(address);
    await mynft.deployed();

    const mynftAddress = mynft.address;

    




  });
});
