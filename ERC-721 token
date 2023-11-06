// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";

contract MyNFT is ERC721Enumerable, Ownable {
    using SafeMath for uint256;

    uint256 public constant MAX_SUPPLY = 10000; // Maximum number of tokens that can ever be minted
    uint256 public constant MAX_MINT_PER_TRANSACTION = 10; // Maximum number of tokens that can be minted in a single transaction
    uint256 public constant MINT_PRICE = 0.1 ether; // Price to mint one token

    constructor() ERC721("MyNFT", "MNFT") {}

    function mint(uint256 numberOfTokens) external payable {
        require(totalSupply() + numberOfTokens <= MAX_SUPPLY, "Exceeds maximum supply");
        require(numberOfTokens <= MAX_MINT_PER_TRANSACTION, "Exceeds maximum mint per transaction");
        require(msg.value >= numberOfTokens * MINT_PRICE, "Insufficient funds");

        for (uint256 i = 0; i < numberOfTokens; i++) {
            uint256 tokenId = totalSupply() + 1;
            require(tokenId <= MAX_SUPPLY, "Exceeds maximum supply");
            _safeMint(msg.sender, tokenId);
        }
    }

    function setBaseURI(string memory baseURI) external onlyOwner {
        _setBaseURI(baseURI);
    }

    function withdraw() external onlyOwner {
        payable(owner()).transfer(address(this).balance);
    }
}
