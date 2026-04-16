// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DeFiSavings {

    struct User {
        uint balance;
        uint depositTime;
    }

    mapping(address => User) public users;

    uint public lockTime = 1 minutes;

    event Deposited(address indexed user, uint amount);
    event Withdrawn(address indexed user, uint amount);

    // 🔒 Reentrancy guard
    bool private locked;

    modifier noReentrant() {
        require(!locked, "No reentrancy");
        locked = true;
        _;
        locked = false;
    }

    function deposit() public payable {
        require(msg.value > 0, "Send ETH");

        // Only set time if first deposit
        if (users[msg.sender].balance == 0) {
            users[msg.sender].depositTime = block.timestamp;
        }

        users[msg.sender].balance += msg.value;

        emit Deposited(msg.sender, msg.value);
    }

    function withdraw(uint amount) public noReentrant {
        require(users[msg.sender].balance >= amount, "Insufficient balance");

        require(
            block.timestamp >= users[msg.sender].depositTime + lockTime,
            "Funds are locked"
        );

        users[msg.sender].balance -= amount;

        (bool success, ) = payable(msg.sender).call{value: amount}("");
        require(success, "Transfer failed");

        emit Withdrawn(msg.sender, amount);
    }

    function getBalance() public view returns (uint) {
        return users[msg.sender].balance;
    }
}
