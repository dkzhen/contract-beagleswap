require("@nomicfoundation/hardhat-toolbox");
const dotenv = require("dotenv");
dotenv.config();
/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  networks: {
    scrollAlpha: {
      url: "https://alpha-rpc.scroll.io/l2" || "",
      accounts: [process.env.PRIVATE_KEY],
    },
    goerli: {
      url: "https://ethereum-goerli.publicnode.com" || "",
      accounts: [process.env.PRIVATE_KEY],
    },
    base: {
      url: "https://goerli.base.org" || "",
      accounts: [process.env.PRIVATE_KEY],
    },
  },
  etherscan: {
    apiKey: {
      scrollAlpha: "abc",
      goerli: process.env.API_KEY,
      base: "abc",
    },
    customChains: [
      {
        network: "scrollAlpha",
        chainId: 534353,
        urls: {
          apiURL: "https://blockscout.scroll.io/api",
          browserURL: "https://blockscout.scroll.io/",
        },
      },

      {
        network: "base",
        chainId: 84531,
        urls: {
          apiURL: "https://api-goerli.basescan.org/api",
          browserURL: "https://goerli.basescan.org",
        },
      },
    ],
  },
  solidity: "0.8.0",
};
