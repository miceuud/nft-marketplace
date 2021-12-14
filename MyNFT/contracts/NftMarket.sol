// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/security/ReentrancyGuard.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract NFTMarket is ReentrancyGuard, ERC721 {

  using Counters for Counters.Counter;
  Counters.Counter private _tokenIds;

  address payable marketplaceOwner;
  uint listingPrice = 0.015 ether;

  struct NftItem {
    address payable nftCreator;
    address payable nftBuyer;
    uint _tokenId;
    uint _tokenIndex;
    bool sold;
    uint price;
  }
  // use this to map over itemnumber to Nft-Item  ?item-id
  mapping(uint => NFTItem) MarketplaceItem;

  constructor () {
    marketplaceOwner = msg.sender;
  }

  function sellNftAsset (address _marketplaceAddress, uint _tokenId, uint price) public payable {
    require(msg.value == listingPrice, "Please provide the listing amount");
    require(price > 0 , "Please provide the sales amount");

    // require()
    _tokenIds.increment();
    uint index = _tokenIds.current();

    MarketplaceItem[index] = NftItem (
      msg.sender,
      address(0),
      _tokenURI,
      index,
      false,
      price
    );
   transferFrom(msg.sender, address(this), Marke);
  }
  function buyNftAsset () public  {

  
  }
  function listAllNft () {

  }
  function listMyAssets () {

  }
}