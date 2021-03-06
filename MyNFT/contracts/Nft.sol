// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract MyNFT is ERC721URIStorage {
 
  using Counters for Counters.Counter;
  
  Counters.Counter private _tokenIds;
  address public marketplaceContractAddress;
  
  constructor(address marketplace) ERC721("MyNFT-Tokens", "UMT") {
    marketplaceContractAddress = marketplace;
  }

  function createToken (string memory _tokenURI) public returns (uint _tokenId) {
    _tokenIds.increment();
    _tokenId = _tokenIds.current();

    _mint(msg.sender, _tokenId);
    _setTokenURI(_tokenId, _tokenURI);
    setApprovalForAll(marketplaceContractAddress, true);
 
   _tokenId;
  }
}