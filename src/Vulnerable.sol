// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Hackme {
    address public owner;
    string private owner_secret;
    bool private isLocked;

    constructor(string memory _owner_secret) {
        owner = msg.sender;
        isLocked = true;
        owner_secret = _owner_secret;

    }

    function locked() public view returns (bool) {
        return isLocked;
    }
    function pwn(string memory secret) public returns (string memory) {
        require(keccak256(abi.encodePacked(owner_secret)) == keccak256(abi.encodePacked(secret)));
        isLocked = false;
        return "GreatJob4337";
    }

}
