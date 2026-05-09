// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

contract p1 {
//this contract will handle money

    uint256 public counter;
    uint256 private store;

    constructor(){
        counter=1;
        store=777;
    }

    function storeValue(uint256 r) public{
        store=r;
    }

    function getValue() public view returns(uint256){
        return store;
    }


    function inc() public{
        counter+=1;
    }

    function dec() public{
        if (counter-1>0) {
            counter-=1;
        }
    }

    function getCount() public view returns(uint256){
        return counter;
    }

    //receiving money
    receive () external payable {}

    function getBalance() public view returns(uint256){
        return address(this).balance;
    }

    //sending money
    function _send(uint amt,  address payable  receiver) public payable {
        require(address(this).balance>=amt,"Fill Wallet first");
        //if(msg.sender==owner){
            (bool s,) = receiver.call{value:amt}("");
            require(s,"Transaction failed");
        //}
    }

}

