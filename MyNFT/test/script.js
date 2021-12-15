const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("MyNFT", function () {
  it("Should return the new greeting once it's changed", async function () {
    const NFTMarket = await ethers.getContractFactory("NFTMarket");
    const nftnarket = await NFTMarket.deploy();
    await mynft.deployed();

    // expect(await greeter.greet()).to.equal("Hello, world!");

    // const setGreetingTx = await greeter.setGreeting("Hola, mundo!");

    // wait until the transaction is mined
    // await setGreetingTx.wait();

    // expect(await greeter.greet()).to.equal("Hola, mundo!");
  });
});
