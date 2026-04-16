# DeFi Savings Smart Contract

## 🚀 Overview
This is a secure Solidity smart contract that allows users to deposit and withdraw ETH with a time-lock mechanism.

## ✨ Features
- Deposit ETH into the contract
- Withdraw ETH after a lock period
- Time-lock security mechanism
- Reentrancy protection using modifier
- Event logging for transparency

## 🔒 Security Features
- Reentrancy guard implemented
- Checks-Effects-Interactions pattern
- Safe ETH transfer using `.call`

## 🛠️ Tech Stack
- Solidity ^0.8.0
- Ethereum Blockchain

## 📦 How It Works
1. Users deposit ETH into the contract
2. Funds are locked for a specified time
3. Users can withdraw after the lock period
4. All transactions are logged using events

## 👨‍💻 Author
Osanebi Joshua
