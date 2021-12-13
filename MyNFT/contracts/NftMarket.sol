// contracts/GameItem.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/security/ReentrancyGuard.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract NFTMarket is ReentrancyGuard {

  using Counters for Counters.Counter;
  Counters.Counter private _tokenIds;

  address payable contractMarketAddres;
  uint listingPrice = 0.01 ether;

  struct NftItem {
    address payable nftCreator;
    address payable nftBuyer;
    uint nftId;
    uint itemNumber;
    bool sold;
    uint price;
  }
  // use this to map over itemnumber to Nft-Item
  mapping(uint => NFTItem) MarketplaceItem;

  constructor () {
    contractMarketAddres = msg.sender;
  }

  function sellNftAsset (address nft_address, uint token_id, uint price) public payable returns (NFTItem[] memory) {
    require(msg.value == listingPrice, "Please provide the listing amount");
    require(price > 1 wei, "Please provide the listing amount");

    // require()
    _tokenIds.increment();
    uint index = _tokenIds.current();

    NftItem[] asset = new NftItem ({
      nftCreator: msg.sender,
      nftBuyer: address(0),
      nftId: nftId,
      itemNumber: index,
      sold: false,
      price: price + listingPrice
    });


  }
  function buyNftAsset () public  {

  
  }
  function listAllNft () {

  }
  function listMyAssets () {

  }
}