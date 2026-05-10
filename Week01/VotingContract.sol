// SPDX-License-Identifier: Unlicensed
pragma solidity ^0.8.0;

contract VotingContract
{
    struct Candidate
    {
        address ID;
        string name;
        uint256 registrationID;
        uint256 voteCount;
    }

    Candidate[] public candidates;
    mapping (address=>bool) private list;
    mapping (address=>uint256) private idlist;
    mapping (address=>bool) private record;

    function registerCandidate(string memory _name) public
    {
        require(!list[msg.sender], "Candidate already registered");
        idlist[msg.sender]=candidates.length;
        candidates.push(Candidate(msg.sender, _name, idlist[msg.sender], 0));
        list[msg.sender]=true;
    }

    function castVote(address _id) public 
    {
        require(list[_id], "Candidate not registered");
        require(!record[msg.sender], "Already voted");
        candidates[idlist[_id]].voteCount++;
        record[msg.sender]=true;
    }

    function fetchVotes(address c) public view returns(uint256)
    {
        return candidates[idlist[c]].voteCount;
    }

}
