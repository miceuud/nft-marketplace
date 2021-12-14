// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract MyNFT is ERC721 {
 
  using Counters for Counters.Counter;
  // unique token id's
  Counters.Counter private _tokenIds;
  address marketplaceContractAddress;

  uint public _tokenId;

  constructor(address marketplace) ERC721("MyNFT Tokens", "UMT") {
    marketplaceContractAddress = marketplace;
  }

  function creatToken (string memory _tokenURI) public returns (uint){
    _tokenIds.increment();
     _tokenId = _tokenIds.current();

    _mint(msg.sender, _tokenId);
    _setTokenURI(_tokenId, _tokenURI);
    setApprovalForAll(marketplaceContractAddress, true);

    return _tokenId;
  }
}