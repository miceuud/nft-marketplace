// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/security/ReentrancyGuard.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract NFTMarket is ERC721URIStorage, ReentrancyGuard {

  using Counters for Counters.Counter;
  Counters.Counter private _tokenIds;

  // add royality to the contract

  address marketplaceOwner;
  uint listingPrice = 1 wei;
  uint itemsCount;

  struct NftItem {
    uint index;
    address owner;
    uint _tokenId;
    bool sold;
    uint price;
  }
  NftItem[] nftItems;
  NftItem[] myAssets;

  error NoAssetFound(string msg);

  // use this to map over item index to Nft-Item  ?item-id
  mapping(uint => NftItem) CreateAsset;

  constructor () ERC721("MyNFT-Tokens", "UMT") {
    marketplaceOwner = msg.sender;
  }

  function sellNftAsset (uint _tokenId, uint price) public payable nonReentrant returns(uint) {
    require(msg.value == listingPrice, "Please provide the listing amount");
    require(price >  1 wei, "Please provide the sales amount");

    _tokenIds.increment();
    uint index = _tokenIds.current();
    itemsCount = _tokenIds.current();

    CreateAsset[index] = NftItem( 
       index,
       msg.sender,
      _tokenId,
       false,
       price
      );
      // marketplace owner withdrawer
   payable(marketplaceOwner).transfer(msg.value);
   safeTransferFrom(msg.sender, address(this), _tokenId );

   return CreateAsset[index].price;
  //  emit Transfer(msg.sender,address(this), _tokenId);
  }

  function buyNftAsset (uint index) public  payable nonReentrant {
    uint price = CreateAsset[index].price;
    uint tokenId = CreateAsset[index]._tokenId;

    require(msg.value == price, "please provide the price amount");
    
    payable(CreateAsset[index].owner).transfer(msg.value);
    // IERC721(nftAddress).safeTransferFrom(address(this), msg.sender, tokenId);
    safeTransferFrom(address(this), msg.sender, tokenId);

    CreateAsset[index].owner = msg.sender;
    CreateAsset[index].sold = true;

    emit Transfer(address(this), msg.sender, tokenId);
  }

  function listAllNft () public returns (NftItem[] memory ) { 
    if(itemsCount > 0) {
       for (uint256 index = 0; index < itemsCount ; index++) {
       nftItems.push(CreateAsset[index]);
    }  
    } else revert NoAssetFound("No asset has been uploaded to the marketplace");
   return nftItems;
  }

  function listMyAssets () public returns (NftItem[] memory){     
     for (uint256 index = 0; index < itemsCount; index++) {
       if (CreateAsset[index].owner == msg.sender) {
          myAssets.push(CreateAsset[index]);   
       } else revert NoAssetFound("You don't have any asset");
        
    } 
   return myAssets;
  }

}