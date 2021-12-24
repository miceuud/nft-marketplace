import { create } from "ipfs-http-client";

exports.ipfsClient = (arg) => {
  try {
    const ipfs = await create("https://ipfs.infura.io:5001/api/v0");
    let response = await ipfs.add(arg);
    return response.path;
  } catch (e) {
    console.log(e.message);
    return;
  }
}