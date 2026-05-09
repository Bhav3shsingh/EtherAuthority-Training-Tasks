//SPDX-License-Identifier:Unlicensed
pragma solidity ^0.8.0;

contract EtherTransferContract{

    address private owner;

    constructor() payable{
        owner=msg.sender;
    }
    receive() external payable {}

    function send(uint256 amt,address receiver) public{
        uint256 a = amt*1 ether;
       if(msg.sender==owner){
            require(address(this).balance>=a,"Not enough balance");
            (bool s,)=receiver.call{value:a}("");
            require(s,"Transaction failed");
       }
    }

    function getBalance() public view returns(uint256){
        return address(this).balance;
    }

}
