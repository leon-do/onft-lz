// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.22;

import { ONFT721 } from "@layerzerolabs/onft-evm/contracts/onft721/ONFT721.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

contract ONFT is ONFT721 {
    constructor(
        string memory _name,
        string memory _symbol,
        address _lzEndpoint,
        address _delegate
    ) ONFT721(_name, _symbol, _lzEndpoint, _delegate) {}

    function tokenURI(uint256 _tokenId) public pure override returns (string memory) {
        string memory baseURI = "https://hello.com/";
        return string(abi.encodePacked(baseURI, Strings.toString(_tokenId)));
    }
}