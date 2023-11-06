
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract GameItem is ERC721, Ownable {
    uint256 public nextTokenId;
    mapping(uint256 => string) public itemTypes; // Mapping from token ID to item type

    constructor() ERC721("GameItem", "ITM") {}

    // Mint a new game item
    function mintItem(address to, string memory itemType) external onlyOwner {
        uint256 tokenId = nextTokenId;
        nextTokenId++;
        itemTypes[tokenId] = itemType;
        _safeMint(to, tokenId);
    }

    // Get item type by token ID
    function getItemType(uint256 tokenId) external view returns (string memory) {
        require(_exists(tokenId), "Token does not exist");
        return itemTypes[tokenId];
    }
}
