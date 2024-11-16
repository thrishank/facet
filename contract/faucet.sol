// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract GotchaFaucet is ERC20, Ownable {
    uint256 public constant amountToDistribute = 100 * 10 ** 18; // Distributes 100 tokens
    uint256 public constant cooldownTime = 1 days; // 1 day cooldown between requests
    mapping(address => uint256) public lastRequestTime;

    constructor() ERC20("GotchaToken", "GTK") {
        _mint(address(this), 1000000 * 10 ** 18); // Mint initial supply to the contract
    }

    function requestTokens() public {
        require(
            block.timestamp >= lastRequestTime[msg.sender] + cooldownTime,
            unicode"You must wait longer before requesting tokens again."
        );
        _transfer(address(this), msg.sender, amountToDistribute);
        lastRequestTime[msg.sender] = block.timestamp;
    }
}
CA:0x4126fc52ce3a6443420f5dbe787d3eefb4ef3ca8