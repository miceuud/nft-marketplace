const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("NftMarket", function () {
  it("Should return the new greeting once it's changed", async function () {
    const nftmarket = await ethers.getContractFactory("NftMarket");
    const nftmarket = await Greeter.deploy("");
    await nftmarket.deployed();

    // expect(await greeter.greet()).to.equal("Hello, world!");

    // const setGreetingTx = await greeter.setGreeting("Hola, mundo!");

    // wait until the transaction is mined
    // await setGreetingTx.wait();

    // expect(await greeter.greet()).to.equal("Hola, mundo!");
  });
});
