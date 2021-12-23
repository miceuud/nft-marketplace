require("dotenv").config();
require("@nomiclabs/hardhat-waffle");

task("accounts", "Prints the list of accounts", async (taskArgs, hre) => {
  const accounts = await hre.ethers.getSigners();

  for (const account of accounts) {
    console.log(account.address);

    console.log(process.env.PRIVATE_KEY);
  }
});

/**
 * @type import('hardhat/config').HardhatUserConfig
 */
module.exports = {
  solidity: "0.8.4",
  paths: {
    artifacts: "../src/artifacts",
  },
  networks: {
    hardhat: {},
    matic: {
      url: "https://rpc-mumbai.maticvigil.com",
      accounts: [process.env.PRIVATE_KEY],
    },
    alchemy: {
      url: `${process.env.URL}`,
      accounts: [`0x${process.env.PRIVATE_KEY}`],
    },
    infura: {
      url: "https://kovan.infura.io/v3/322bf34144b245a994fc20708aa14159",
      accounts: [
        "0x89fd24f18d268e2cfe148e05c5d2ff4824f6831185a83de30876f65502ee1a5e",
      ],
    },
  },
};
