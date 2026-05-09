//SPDX-License-Identifier: Unlicensed
pragma solidity ^0.8.0;

contract OwnerModel{

    address private owner;

    constructor() payable 
    {
        owner = msg.sender;
    }

    receive() external payable { }

    function sendMoney(uint256 amt, address payable rec) onlyOwnerReq public{
            (bool s,) = rec.call{value:amt*1 ether}(" ");
            require(s,"Transaction failed");
    }

    modifier onlyOwnerReq () { 
         require(msg.sender==owner,"you're not owner");
       _; 
    }

}
