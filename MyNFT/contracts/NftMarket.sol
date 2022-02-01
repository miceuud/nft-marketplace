// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/security/ReentrancyGuard.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract NFTMarket is ERC721URIStorage, ReentrancyGuard {

  using Counters for Counters.Counter;
  Counters.Counter private _tokenIds;

  address marketplaceOwner;
  uint listingPrice = 1 ether;
  uint itemsCount;

  struct NftItem {
    uint index;
    address nftAddress;
    address owner;
    uint _tokenId;
    bool sold;
    uint price;
  }
  
  NftItem[] myAssets;

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
      
    // payable(marketplaceOwner).transfer(msg.value);
  //  transfer right to maarketplace
    IERC721(nftAddress).transferFrom(msg.sender, address(this), _tokenId);

    emit Transfer(msg.sender,address(this), _tokenId); 
  }

  function buyNftAsset (uint index) public payable nonReentrant {
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

  function listAllNft () public view returns (NftItem[] memory ) { 
  
    if(itemsCount > 0 ) {
      NftItem[] memory nftItems = new NftItem[](itemsCount);
    
     for (uint256 index = 0; index <= itemsCount ; index++) {
      //  nftItems.push(CreateAsset[index]);
      nftItems[index] = CreateAsset[index];
    }  
    return nftItems;
    } else {
      revert NoAssetFound("no asset found");
    }
    // } else revert NoAssetFound("No asset has been uploaded to the marketplace");
   
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