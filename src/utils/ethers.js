import { ethers } from "ethers";

exports.etherClient = () => {
  if (typeof window.ethereum !== "undefined") {
    console.log("MetaMask is installed!");
  }

  const provider = new ethers.providers.Web3Provider(window.ethereum);
  const signer = provider.getSigner();

  return provider;
};
