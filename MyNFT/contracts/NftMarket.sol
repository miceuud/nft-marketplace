// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/security/ReentrancyGuard.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract NFTMarket is ERC721URIStorage, ReentrancyGuard, Ownable {

  using Counters for Counters.Counter;
  Counters.Counter private _tokenIds;

  address marketplaceOwner;
  uint listingPrice = 1 ether;
  uint public itemsCount;

  struct NftItem {
    uint index;
    address nftAddress;
    address owner;
    uint _tokenId;
    bool sold;
    uint price;
  }

  error NoAssetFound(string msg);
  mapping(uint => NftItem) public CreateAsset;

  constructor () ERC721("MyNFT-Tokens", "UMT") {
    marketplaceOwner = msg.sender;
  }

  function sellNftAsset (address nftAddress, uint _tokenId, uint nfAmount) public payable nonReentrant {
    require(msg.value == listingPrice, "Please provide the listing amount");
    require(nfAmount >  1 wei, "Please provide the sales amount");

    _tokenIds.increment();
    itemsCount = _tokenIds.current();

    CreateAsset[_tokenId] = NftItem( 
       itemsCount,
       nftAddress,
       msg.sender,
      _tokenId,
       false,
       nfAmount
      );
    IERC721(nftAddress).transferFrom(msg.sender, address(this), _tokenId);
    emit Transfer(msg.sender,address(this), _tokenId); 
  }

  function buyNftAsset (address nftAddress,uint id) public payable nonReentrant {
    uint price = CreateAsset[id].price;
    uint tokenId = CreateAsset[id]._tokenId;

    require(msg.value == price, "please provide the price amount");
    
    payable(CreateAsset[id].owner).transfer(msg.value);
    CreateAsset[id].sold = true;
    CreateAsset[id].owner = msg.sender;

    IERC721(nftAddress).transferFrom(address(this),msg.sender, tokenId);
    emit Transfer(address(this), msg.sender, tokenId);
  }

  function listAllNft () public onlyOwner view returns (NftItem[] memory)  { 
    require(itemsCount > 0, "There are no items in the martketplace");

    uint startingIndex = 0;
    NftItem[] memory nftItems = new NftItem[](itemsCount);
    for (uint256 index = 1; index <= itemsCount ; index++) {    
        nftItems[startingIndex] = CreateAsset[index];
        startingIndex += 1;  
    }
    return nftItems;
  } 

  function listMyAssets () public view returns (NftItem[] memory) {  
     NftItem[] memory myAssets = new NftItem[](itemsCount);
     uint startingIndex = 0;

     for (uint256 index = 1; index <= itemsCount; index++) {
        if (CreateAsset[index].owner == msg.sender) {
         myAssets[startingIndex] = CreateAsset[index];
        startingIndex += 1;
       }
   } 
    return myAssets; 
  }
}
