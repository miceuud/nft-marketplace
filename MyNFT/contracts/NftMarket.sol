// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/security/ReentrancyGuard.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract NFTMarket is ERC721, ReentrancyGuard, Ownable {

  using Counters for Counters.Counter;
  Counters.Counter private _tokenIds;

  address payable marketplaceOwner;
  uint listingPrice = 0.015 ether;
  uint itemsCount;

  struct NftItem {
    uint index;
    address payable owner;
    address payable buyer;
    uint _tokenId;
    bool sold;
    uint price;
  }

  NftItem[] nftItems;
  event Transfer(address indexed from, address indexed to, uint256 indexed tokenId);
  error NoAssetFound(string msg);

  // use this to map over item index to Nft-Item  ?item-id
  mapping(uint => NFTItem) MarketplaceItem;

  constructor () {
    marketplaceOwner = msg.sender;
  }

  function sellNftAsset (address nftContractAddress, uint _tokenId, uint price) public payable nonReentrant{
    require(msg.value == listingPrice, "Please provide the listing amount");
    require(price > 0 , "Please provide the sales amount");

    _tokenIds.increment();
    uint index = _tokenIds.current();
    itemsCount = _tokenIds.current();

    // map a struct item to an index
    // MarketplaceItem[index] = NftItem( 
    //    index,
    //    msg.sender,
    //    address(0),
    //   _tokenId,
    //    false,
    //    price
    //   );

   safeTransferFrom(msg.sender, address(this), _tokenId );
   emit Transfer(msg.sender,address(this), _tokenId);
  }

  function buyNftAsset (uint index) public  payable nonReentrant {
    uint price = MarketplaceItem[index].price;
    uint tokenId = MarketplaceItem[index].tokenId;

    require(msg.value == price, "please provide the price amount");
    
    safeTransferFrom(address(this), msg.sender, tokenId);
    // check this. if new owner wants to resell 
    MarketplaceItem[index] = NftItem( 
       index,
       msg.sender,
       address(0),
      _tokenId,
       false,
       price
      );

    Transfer(address(this), msg.sender, tokenId);
  }

  function listAllNft () onlyOwner returns(NftItem[]) { 
    for (uint256 index = 0; index < itemsCount - 1; index++) {
      nftItems.push(MarketplaceItem[index]);
    }
    return nftItems;
  }

  function listMyAssets () {
     for (uint256 index = 0; index < itemsCount - 1; index++) {
       if (MarketplaceItem[index].owner == msg.sender) nftItems.push(MarketplaceItem[index]);
       else revert NoAssetFound("You don't have any asset")
    } 
  }

}