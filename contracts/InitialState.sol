// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract InitialState {
    struct State {
        address owner;
        uint256 tokenId;
    }
    State[] private state;

    function get() public returns (State[] memory) {
        state.push(State({owner: 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4, tokenId: 1}));
        state.push(State({owner: 0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2, tokenId: 3}));
        return state;
    }
}