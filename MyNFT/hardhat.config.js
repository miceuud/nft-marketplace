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
    alchemy: {
      url: `${process.env.URL}`,
      accounts: [`0x${process.env.PRIVATE_KEY}`],
    },
  },
};
