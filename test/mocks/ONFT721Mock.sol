// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import { ONFT721 } from "@layerzerolabs/onft-evm/contracts/onft721/ONFT721.sol";
import { SendParam } from "@layerzerolabs/onft-evm/contracts/onft721/interfaces/IONFT721.sol";
import "@openzeppelin/contracts/utils/Strings.sol";
import "../../contracts/InitialState.sol";

contract ONFT721Mock is ONFT721 {
    constructor(
        string memory _name,
        string memory _symbol,
        address _lzEndpoint,
        address _delegate
    ) ONFT721(_name, _symbol, _lzEndpoint, _delegate) {
        InitialState initialState = new InitialState();
        InitialState.State[] memory state = initialState.get();
        for (uint256 i = 0; i < state.length; i++) {
            _mint(state[i].owner, state[i].tokenId);
        }
    }

    function mint(address _to, uint256 _tokenId) public {
        _mint(_to, _tokenId);
    }

    // @dev expose internal functions for testing purposes
    function debit(uint256 _tokenId, uint32 _dstEid) public {
        _debit(msg.sender, _tokenId, _dstEid);
    }

    function credit(address _to, uint256 _tokenId, uint32 _srcEid) public {
        _credit(_to, _tokenId, _srcEid);
    }

    function buildMsgAndOptions(
        SendParam calldata _sendParam
    ) public view returns (bytes memory message, bytes memory options) {
        return _buildMsgAndOptions(_sendParam);
    }

    function tokenURI(uint256 _tokenId) public pure override returns (string memory) {
        string memory baseURI = "https://hello.com/";
        return string(abi.encodePacked(baseURI, Strings.toString(_tokenId)));
    }
}
