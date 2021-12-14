pragma solidity ^0.6.6;

import "github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v3.4/contracts/token/ERC721/ERC721.sol";

contract SampleNFTContract is ERC721 {
    uint256 public tokenCounter;
    string public nftName;
    string public nftSymbol;
    
    constructor (string memory nftName_, string memory nftSymbol_) public ERC721 (nftName_, nftSymbol_) {
        tokenCounter = 0;
    }
    
    function createNFT(string memory nftName_, string memory nftSymbol_, string memory tokenURI) public returns (uint256) {
        uint256 newTokenId = tokenCounter;
        _safeMint(msg.sender, newTokenId);
        _setTokenURI(newTokenId, tokenURI);
        tokenCounter = tokenCounter + 1;
        nftName = nftName_;
        nftSymbol = nftSymbol_;
        return newTokenId;
    }
}