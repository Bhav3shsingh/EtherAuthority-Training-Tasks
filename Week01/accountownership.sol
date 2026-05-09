//SPDX-License-Identifier:Unlicensed
pragma solidity ^0.8.0;

contract accountownership{

    address private owner;
    mapping(string=>address) dataset;

    constructor() payable {
        owner = msg.sender;
    }

    function createProfile(string memory s) public
    {
        require(dataset[s]==address(0),"Username taken");
        dataset[s] = msg.sender;
    }

    function getAddress(string memory s) public view returns(address) {
        return dataset[s];
    }

    function setAddress(string memory s, address m) public onlyOwner {
        dataset[s]=m;
    }

    function transferOwnership(string memory s, address newOwner) public
    {
        dataset[s]=newOwner;
    }

    receive() external payable { }

    modifier onlyOwner()
    {
        require(msg.sender==owner, "UNAUTHORISED ACCESS");
        _;
    }

}
