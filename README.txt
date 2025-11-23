# 📝 Decentralized TodoList dApp

A minimal, secure, and fully functional **decentralized todo list** built on the **Ethereum Sepolia Testnet** using Solidity, ethers.js, and MetaMask.

---

## 🚀 Features

* ✔️ Add tasks stored **permanently** on the blockchain
* ✔️ Toggle task completion status
* ✔️ Private tasks (each wallet sees only its own)
* ✔️ Live UI updates after blockchain confirmation
* ✔️ MetaMask authentication
* ✔️ Clean, responsive UI

---

## 🛠️ Tech Stack

| Layer              | Technology                                |
| ------------------ | ----------------------------------------- |
| **Smart Contract** | Solidity ^0.8.17, Ethereum Sepolia, Remix |
| **Frontend**       | HTML, CSS, JavaScript (ES6)               |
| **Web3 Library**   | ethers.js v6.7.0                          |
| **Wallet**         | MetaMask                                  |

---

## 📂 Project Structure

```
todolist-dapp/
├── SmartContract.sol
├── index.html
├── README.md
└── screenshots/
    └── (optional images)
```

---

## 🔗 Contract Deployment

**Contract Address:** `0x7cdfEfDBaEa54b5cF710951f3d457c6c7EC69438`
**Network:** Sepolia Testnet
**View on Etherscan:**
[https://sepolia.etherscan.io/address/0x7cdfEfDBaEa54b5cF710951f3d457c6c7EC69438](https://sepolia.etherscan.io/address/0x7cdfEfDBaEa54b5cF710951f3d457c6c7EC69438)

---

## ⚙️ Setup Instructions

### 1. Clone the repository

```bash
git clone https://github.com/yourusername/todolist-dapp.git
cd todolist-dapp
```

### 2. Run a local server

Use any of the following:

**Python**

```bash
python -m http.server 8000
```

**Node.js**

```bash
npx http-server
```

**VS Code Live Server**
Right-click → **Open with Live Server**

### 3. Open the app

```
http://localhost:8000
```

### 4. Connect MetaMask

* Switch to **Sepolia Testnet**
* Have some Sepolia ETH
* Start using the dApp 🚀

---

## 📝 Smart Contract Overview

### **Write Functions**

| Function                      | Purpose                           |
| ----------------------------- | --------------------------------- |
| `addTask(string description)` | Adds a new task                   |
| `toggleTask(uint index)`      | Marks task as complete/incomplete |

### **Read Functions**

| Function               | Returns          |
| ---------------------- | ---------------- |
| `getTaskCount(user)`   | Number of tasks  |
| `getTask(user, index)` | Single task data |
| `getAllTasks(user)`    | All tasks        |

---

## 🎨 Frontend Features

* Real-time syncing with blockchain
* Clean UI with animations
* MetaMask login state detection
* Automatic task loading
* Error & network handling

---

## 🐛 Troubleshooting Guide

| Issue                 | Solution                          |
| --------------------- | --------------------------------- |
| MetaMask not detected | Install from metamask.io          |
| Wrong network         | Switch to **Sepolia**             |
| Insufficient funds    | Get ETH from Sepolia Faucet       |
| Transaction failed    | Increase gas or retry             |
| Tasks not loading     | Refresh after MetaMask connection |

---

## 🔮 Planned Enhancements

* 🔥 Task deletion
* 🎯 Priority levels
* 📅 Due dates & reminders
* 🏷️ Categories / tags
* 🔍 Search & filtering
* 📤 Shared lists
* 📎 IPFS file attachments

