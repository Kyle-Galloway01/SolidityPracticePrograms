pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract GameCurrency is ERC20, Ownable {
    constructor() ERC20("GameCurrency", "GC") {
        _mint(msg.sender, 1000000 * 10**decimals());
    }

    // Function to mint new game currency tokens (onlyOwner)
    function mint(address to, uint256 amount) external onlyOwner {
        _mint(to, amount);
    }

    // Function to burn game currency tokens (onlyOwner)
    function burn(address from, uint256 amount) external onlyOwner {
        _burn(from, amount);
    }
}
