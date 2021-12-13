// contracts/MyNFT.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract MyNFT is ERC721 {
 
  using Counters for Counters.Counter;
  // unique token id's
  Counters.Counter private _tokenIds;
  address contractMarketplaceAddress;

  constructor(address marketplace) ERC721("MyNFT Tokens", "UMT") {
    contractMarketplaceAddress = marketplace;
  }

  function creatToken (string memory tokenURI) public returns (uint){
    _tokenIds.increment();
    uint token_id = _tokenIds.current();

    _mint(msg.sender,assetId);
    _setTokenURI(msg.sender, assetId);
    setApprovalForAll(contactMarketplaceAddress, true);

    return token_id;
  }
}