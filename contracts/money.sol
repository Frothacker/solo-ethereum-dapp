pragma solidity ^0.4.17;

contract MoneyMover{
    address public manager;
    address[] public contributors;
    uint public donationCount;
    mapping (address => bool) hasContributed;
    
    constructor() public {
        manager = msg.sender;
    }
    
    function giveMoney() public payable {
        require(msg.value > 100);
        if (!hasContributed[msg.sender]) {
            contributors.push(msg.sender);
            hasContributed[msg.sender] = true;
        }
        donationCount ++;
    }
    
    function withdrawMoney() public {
        require(msg.sender == manager);
        manager.transfer(address(this).balance);
    }
    
    function getContributors() public view returns(address[]) {
        return contributors;
    }

}
