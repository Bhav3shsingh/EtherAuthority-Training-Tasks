//SPDX-License-Identifier:Unlicensed
pragma solidity ^0.8.0;

contract StudentRegisteration
{

    address private owner;

    constructor() payable 
    {
        owner=msg.sender;
    }

    mapping (uint256=>Student) data;

    struct Student
    {
        uint256 rollno;
        string name;
        uint256 age;
        address wallet;
    }

    event feePaid(address indexed sender, uint256 amount);

    function register(string memory n, uint256 r, uint256 a, address w) public 
    {
        require(data[r].rollno==0 ,"Roll no. already assigned");
        data[r]=Student(r,n,a,w);
    }

    function getStudentRecord(uint256 r) public view returns(Student memory)
    {
        require(data[r].rollno!=0,"No record");
        return data[r];
    }

    function editData(uint256 r, address w, uint256 a, string memory n) public onlyOwner
    {
        data[r] = Student(r,n,a,w);
    }

    modifier onlyOwner {
        require(msg.sender==owner,"Not owner");
        _;
    }

    function rewardScholarshipToStudent(uint256 r, uint256 amt) public payable onlyOwner
    {
        require(address(this).balance>=amt,"Insufficient balance");
        (bool s,) = data[r].wallet.call{value:amt}("");
        require(s,"Failed");
    }

    function collectFees() public payable onlyOwner{
        (bool s,) = owner.call{value:address(this).balance}("");
        require(s,"Failed");

    }

    function payFees() public payable 
    {
        require(msg.value>0,"Insufficient Balance");
        emit feePaid(msg.sender, msg.value);
    }

}
