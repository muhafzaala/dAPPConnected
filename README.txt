<div align="center">

<img src="https://img.shields.io/badge/Network-Sepolia_Testnet-6366f1?style=flat-square&logo=ethereum&logoColor=white" />
&nbsp;
<img src="https://img.shields.io/badge/Contract-Verified-22c55e?style=flat-square&logo=ethereum&logoColor=white" />
&nbsp;
<img src="https://img.shields.io/badge/Solidity-^0.8.17-363636?style=flat-square&logo=solidity&logoColor=white" />
&nbsp;
<img src="https://img.shields.io/badge/License-MIT-c9a84c?style=flat-square" />

<br/><br/>

# ⛓️ Decentralized TodoList dApp

### Permanent. Private. Trustless. On-Chain.

<br/>

[![Solidity](https://img.shields.io/badge/Solidity-^0.8.17-363636?style=for-the-badge&logo=solidity&logoColor=white)](https://soliditylang.org)
[![Ethereum](https://img.shields.io/badge/Ethereum-Sepolia-3C3C3D?style=for-the-badge&logo=ethereum&logoColor=white)](https://ethereum.org)
[![ethers.js](https://img.shields.io/badge/ethers.js-v6.7.0-2535A0?style=for-the-badge&logo=javascript&logoColor=white)](https://ethers.org)
[![MetaMask](https://img.shields.io/badge/MetaMask-Wallet-F6851B?style=for-the-badge&logo=metamask&logoColor=white)](https://metamask.io)
[![JavaScript](https://img.shields.io/badge/JavaScript-ES6-F7DF1E?style=for-the-badge&logo=javascript&logoColor=black)](https://developer.mozilla.org/en-US/docs/Web/JavaScript)

<br/>

> A minimal, secure, and fully functional **decentralised todo list** built on the Ethereum Sepolia Testnet.
> Your tasks live on the blockchain — permanently, privately, and without a server.

<br/>

**[✨ Features](#-features)** &nbsp;·&nbsp;
**[📜 Smart Contract](#-smart-contract)** &nbsp;·&nbsp;
**[🏗️ Architecture](#%EF%B8%8F-architecture)** &nbsp;·&nbsp;
**[⚡ Quick Start](#-quick-start)** &nbsp;·&nbsp;
**[🔗 Deployment](#-deployment)** &nbsp;·&nbsp;
**[📬 Contact](#-contact)**

</div>

---

## 📌 Overview

Most todo apps store your data on someone else's server. **This one doesn't.**

Every task you add is written directly to the Ethereum blockchain via a Solidity smart contract. Tasks are wallet-scoped — only your MetaMask address can read, write, or toggle your tasks. No backend. No database. No single point of failure.

```
Your Browser  →  MetaMask  →  Sepolia Testnet  →  Smart Contract
                                                        │
                                              Your tasks, forever.
```

---

## ✨ Features

| Feature | Description |
|---|---|
| ⛓️ **On-Chain Storage** | Tasks written permanently to Ethereum — no server, no database |
| 🔒 **Wallet-Scoped Privacy** | Each wallet address sees only its own tasks |
| ✅ **Toggle Completion** | Mark tasks done or undone with a single transaction |
| 🔄 **Live UI Sync** | UI updates automatically after blockchain confirmation |
| 🦊 **MetaMask Auth** | Connect your wallet to authenticate — no passwords |
| 📱 **Responsive UI** | Clean, animated interface that works on any screen |
| 🛡️ **Error Handling** | Network detection, wrong-chain warnings, and tx failure recovery |

---

## 📜 Smart Contract

**Contract Address:** `0x7cdfEfDBaEa54b5cF710951f3d457c6c7EC69438`

**Network:** Ethereum Sepolia Testnet

**View on Etherscan:**
[`0x7cdfEfDB...9438` ↗](https://sepolia.etherscan.io/address/0x7cdfEfDBaEa54b5cF710951f3d457c6c7EC69438)

---

### ✍️ Write Functions

| Function | Parameters | Gas | Description |
|---|---|---|---|
| `addTask` | `string description` | ~50,000 | Writes a new task to the caller's list |
| `toggleTask` | `uint index` | ~30,000 | Flips the completion status of a task |

### 📖 Read Functions

| Function | Parameters | Returns | Description |
|---|---|---|---|
| `getTaskCount` | `address user` | `uint` | Number of tasks for a given address |
| `getTask` | `address user, uint index` | `Task` | Single task by index |
| `getAllTasks` | `address user` | `Task[]` | All tasks for a given address |

### 🗂️ Task Data Structure

```solidity
struct Task {
    string  description;   // Task content
    bool    completed;     // Completion status
    uint256 createdAt;     // Block timestamp
}
```

### 🔐 Security Model

```
msg.sender == your wallet address
        │
        ▼
Tasks stored in mapping(address => Task[])
        │
        ▼
Only you can add or toggle YOUR tasks.
No one — not the contract owner — can touch another wallet's data.
```

---

## 🏗️ Architecture

### System Diagram

```
┌──────────────────────────────────────────────────┐
│              Browser (index.html)                 │
│                                                   │
│  HTML + CSS + JavaScript (ES6)                    │
│  ├── ethers.js v6.7.0  (Web3 interface)           │
│  ├── MetaMask injected provider (window.ethereum) │
│  └── Contract ABI + address                       │
└──────────────────────┬───────────────────────────┘
                       │  JSON-RPC
┌──────────────────────▼───────────────────────────┐
│           MetaMask (Browser Extension)            │
│  Signs transactions · Manages private keys        │
│  Injects window.ethereum into the page            │
└──────────────────────┬───────────────────────────┘
                       │  Signed Transactions
┌──────────────────────▼───────────────────────────┐
│          Ethereum Sepolia Testnet                  │
│                                                   │
│  TodoList.sol                                     │
│  mapping(address => Task[]) private tasks         │
│  addTask() · toggleTask() · getAllTasks()          │
└──────────────────────────────────────────────────┘
```

### Transaction Flow

```
User types a task and clicks "Add"
           │
           ▼
ethers.js encodes the calldata
           │
           ▼
MetaMask opens confirmation popup
  → Shows gas estimate
  → User confirms
           │
           ▼
Transaction broadcast to Sepolia
           │
           ▼
Contract executes addTask(description)
  → Task appended to msg.sender's array
           │
           ▼
Transaction confirmed (block mined)
           │
           ▼
UI calls getAllTasks() and re-renders
```

---

## 📂 Project Structure

```
todolist-dapp/
│
├── 📄 SmartContract.sol        # Solidity contract (deploy via Remix)
├── 📄 index.html               # Frontend: HTML + CSS + JS in one file
├── 📄 README.md
└── 📁 screenshots/             # Optional UI screenshots
```

> **Zero dependencies to install.** No npm, no build step, no config files. Open `index.html` with a local server and you're live.

---

## ⚡ Quick Start

### 📋 Prerequisites

- [MetaMask](https://metamask.io) browser extension installed
- Sepolia testnet ETH — get free ETH from the [Sepolia Faucet](https://sepoliafaucet.com)
- Any local HTTP server (see options below)

---

### Step 1 — Clone the Repository

```bash
git clone https://github.com/muhafzaala/todolist-dapp.git
cd todolist-dapp
```

### Step 2 — Start a Local Server

Choose any method:

**Python** (built-in, no install needed)
```bash
python -m http.server 8000
```

**Node.js**
```bash
npx http-server
```

**VS Code**
Right-click `index.html` → **Open with Live Server**

### Step 3 — Open the App

```
http://localhost:8000
```

### Step 4 — Connect MetaMask

1. Click **Connect Wallet** in the app
2. Approve the connection in MetaMask
3. Switch to **Sepolia Testnet**
4. Ensure you have Sepolia ETH for gas
5. Start adding tasks — they live on-chain forever 🚀

---

## 🔗 Deployment

### Deploy Your Own Contract

**1. Open [Remix IDE](https://remix.ethereum.org)**

**2. Paste `SmartContract.sol`** into a new file

**3. Compile**

```
Compiler: 0.8.17
EVM Version: London (or default)
```

**4. Deploy**

```
Environment: Injected Provider (MetaMask)
Network: Sepolia Testnet
Click: Deploy → Confirm in MetaMask
```

**5. Update the contract address in `index.html`**

```js
const CONTRACT_ADDRESS = "0xYOUR_NEW_CONTRACT_ADDRESS";
```

---

## 🐛 Troubleshooting

| Issue | Cause | Solution |
|---|---|---|
| 🦊 MetaMask not detected | Extension not installed | Install from [metamask.io](https://metamask.io) |
| 🔴 Wrong network error | Connected to mainnet or wrong chain | Switch to **Sepolia Testnet** in MetaMask |
| ⛽ Insufficient funds | No Sepolia ETH for gas | Get free ETH from [sepoliafaucet.com](https://sepoliafaucet.com) |
| ❌ Transaction failed | Gas too low or contract error | Increase gas limit or retry |
| 🔄 Tasks not loading | MetaMask not fully connected | Refresh page after approving MetaMask connection |
| 📡 RPC error | Sepolia node unresponsive | Wait and retry — testnet congestion is common |

---

## 🔮 Planned Enhancements

| Enhancement | Description |
|---|---|
| 🗑️ **Task Deletion** | Remove tasks with on-chain state update |
| 🎯 **Priority Levels** | Tag tasks as low · medium · high priority |
| 📅 **Due Dates** | Set deadlines stored on-chain |
| 🏷️ **Categories & Tags** | Organise tasks by custom labels |
| 🔍 **Search & Filter** | Client-side filtering by status, tag, or text |
| 📤 **Shared Lists** | Share a list with another wallet address |
| 📎 **IPFS Attachments** | Attach files to tasks via IPFS CID storage |
| 🔔 **Notifications** | Browser alerts on transaction confirmation |
| 🌐 **Mainnet Deploy** | Migrate to Ethereum mainnet or L2 (Polygon, Base) |

---

## 📬 Contact

<div align="center">

Developed by **Muhammad Afzaal Asghar**

[![Email](https://img.shields.io/badge/Email-mafzaala333%40gmail.com-D14836?style=for-the-badge&logo=gmail&logoColor=white)](mailto:mafzaala333@gmail.com)
[![GitHub](https://img.shields.io/badge/GitHub-muhafzaala-181717?style=for-the-badge&logo=github&logoColor=white)](https://github.com/muhafzaala)

<br/>

For questions or issues — open an [issue](https://github.com/muhafzaala/todolist-dapp/issues) or reach out at **mafzaala333@gmail.com**

<br/>

---

⭐ **If this project helped you understand Web3 development, give it a star.**

*Built with Solidity, ethers.js, and the conviction that data should belong to its owner.*

</div>
