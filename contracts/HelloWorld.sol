//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

contract HelloWorld {
    
    string public message;
    address public owner;
    address public newOwner;

    modifier onlyOwner(){
        require(owner == msg.sender, "Only owner can call function");
        _;
    }

    constructor(string memory _message) {
        owner = msg.sender;
        message = _message;
    }

    /// @dev Change the message(message) - Only owner can call function
    /// @param _newMessage new message
    function changeMessage(string memory _newMessage) external onlyOwner {
        message = _newMessage;
    }

    /// @dev Owner transfers ownership owner contract to another address
    /// @param _newOwner address to be transfer ownership to
    function transferOwnership(address _newOwner) external onlyOwner{
        newOwner = _newOwner;
    }

    /// @dev new owner accepts ownership of the contract
    function acceptOwnership() external{
        require(msg.sender == newOwner, "Only new owner can call function");
        owner = newOwner;
        newOwner = address(0);
    }
}
