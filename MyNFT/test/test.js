const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("MyNFT", function () {
  it("should return token id ", async function () {
    const NFTMarket = await hre.ethers.getContractFactory("NFTMarket");
    const nftmarket = await NFTMarket.deploy();

    await nftmarket.deployed();

    const markeplaceAddress = nftmarket.address;

    const MyNFT = await hre.ethers.getContractFactory("MyNFT");
    const myNft = await MyNFT.deploy(markeplaceAddress);

    await myNft.deployed();
    // create nft
    let tokenId = await myNft.createToken("www.mynftlink.com");
    tokenId = await tokenId.wait();
    tokenId = await tokenId.events[0].args[2].toString();

    expect(Number(tokenId)).to.be.a("number");
    expect(Number(tokenId)).to.equal(1);
  });
});
