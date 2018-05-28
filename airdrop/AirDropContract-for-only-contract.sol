pragma solidity ^0.4.23;

interface FrescoToken {
    
    function transfer(address to, uint256 value) external returns (bool);
}


contract AirdropContract {
    
    address public owner;
    
    FrescoToken token;
   
    
    modifier onlyOwner() {
    	require(msg.sender == owner);
    	_;
  	}
    
    constructor() public {
      owner = msg.sender;
      token = FrescoToken(0x0Eb152d2bba8aF722D7E296A1F223d819C3bbB1f);
    }
    
    function send(address[] dests, uint256[] values) public onlyOwner returns(uint256) {
        uint256 i = 0;
        while (i < dests.length) {
            token.transfer(dests[i], values[i]);
            i += 1;
        }
        return i;
        
    }
    
    
}