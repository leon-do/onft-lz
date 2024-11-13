// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.22;

import { ONFT } from "../ONFT.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

// @dev WARNING: This is for testing purposes only
contract MyONFT721Mock is ONFT {
    constructor(
        string memory _name,
        string memory _symbol,
        address _lzEndpoint,
        address _delegate
    ) ONFT(_name, _symbol, _lzEndpoint, _delegate) {}

    function mint(address _to, uint256 _amount) public {
        _mint(_to, _amount);
    }
}
