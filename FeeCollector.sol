// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;
contract FeeCollector {
    address public owner; // declares a state variable "owner" of type address and makes it public
    uint256 public balance; // declares a state variable "balance" of type uint256 and makes it public

    constructor() {
        owner = msg.sender; // assigns the address of the account that deploys the contract to the "owner" variable
    }

    receive()  payable external {
        balance += msg.value; // function that allows the contract to receive Ethers and updates the balance
    }

    function withdraw(uint amount, address payable destAddr ) public {
        require(msg.sender == owner, "Only Owner can withdraw"); // check if the msg.sender is the owner
        require(amount <= balance, "Wrong amount"); // check if the amount is less or equal to the balance
        destAddr.transfer(amount); // transfer the amount to the destAddr
        balance -= amount; // update the balance
    }
}
