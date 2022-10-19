// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

contract WhiteList{
    uint8 public maxWhiteListedAddresses;

    mapping(address => bool) public whitelistedAddresses;

    uint8 public numAddressesWhitelisted; 

    constructor(uint8 _maxWhiteListedAddresses){
        maxWhiteListedAddresses = _maxWhiteListedAddresses;
    }

    function whiteListAddress() external{
        // check if the user has already been whitelisted
        require(!whitelistedAddresses[msg.sender], "Sender has already been whitelisted");

        require(numAddressesWhitelisted < maxWhiteListedAddresses, "Max white listing limit reached");
        // Add the address which called the function to the whitelistedAddress array
        whitelistedAddresses[msg.sender]=true;
        
        // Increase the number of whitelisted addresses
        numAddressesWhitelisted += 1;
    }
}