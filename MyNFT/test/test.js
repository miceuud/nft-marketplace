const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("MyNFT", function () {
  it("nft url ", async function () {
    const NFTMarket = await hre.ethers.getContractFactory("NFTMarket");
    const nftmarket = await NFTMarket.deploy();

    await nftmarket.deployed();

    const markeplaceAddress = nftmarket.address;

    const MyNFT = await hre.ethers.getContractFactory("MyNFT");
    const myNft = await MyNFT.deploy(markeplaceAddress);

    await myNft.deployed();
    const tokenId = await myNft.createToken("www.mynftlink.com");
    await tokenId.wait();
    console.log(tokenId);

    expect(await nftmarket.sellNftAsset(1, 200)).to.be.be("number");
  });
});
