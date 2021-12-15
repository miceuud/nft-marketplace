// import ipfs-client from "ipfs-http-client";
const { create } = require("ipfs-http-client");

const fs = require("fs");

let picture = fs.readFileSync("./src/assets/nft.png");

let data = {
  name: "mynft",
  sold: false,
  file: picture,
  amount: 1,
};

// console.log(file);

async function ipfsClient() {
  const ipfs = await create("https://ipfs.infura.io:5001/api/v0");
  let response = await ipfs.add(data);
  console.log(response);
}

ipfsClient();

// async function readFile(hash) {
//   const ipfs = await create("https://ipfs.infura.io:5001/api/v0");
//   // let file = await ipfs.cat(hash);
//   // file = Buffer.from(file);
//   let jpeg;

//   for await (const chunk of ipfs.cat(hash)) {
//     jpeg = Buffer.from(chunk, "base64");
//     // jpeg = Buffer.from(chunk);
//   }
//   console.log(jpeg);

//   fs.writeFileSync("./src/assets/log2.jpeg", jpeg);
//   // console.log(typeof file);
//   // let data;
//   // for (file of file) {
//   //   data = Buffer.from(file);
//   // }
//   // console.log(data);
// }

// readFile("QmXaLStuaWXxGvocbD98J8wSuxdZb23R9eDZ6yPd6b21RA");
