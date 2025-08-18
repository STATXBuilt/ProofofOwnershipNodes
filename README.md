# Proof-of-Ownership Template

This repo is a starter template for all projects that extend or integrate
with the **Proof-of-Ownership contracts** originally deployed by:

**C.L.I.C.K.it by STATXBuild LLC**

---

## Attribution

All derivative works must include the following credit:  

> Powered by Proof-of-Ownership • C.L.I.C.K.it by STATXBuild LLC  

Usage of this repo is subject to the [LICENSE](./LICENSE.md), including 
the **Non-Competitive Clause**, which prohibits deployment of competing 
networks or services without prior written consent.  

---

## Contracts
import { CONTRACT_ADDRESS, CONTRACT_ABI } from "./config";
import { ethers } from "ethers";

async function connectContract() {
  if (window.ethereum) {
    const provider = new ethers.providers.Web3Provider(window.ethereum);
    const signer = provider.getSigner();
    return new ethers.Contract(CONTRACT_ADDRESS, CONTRACT_ABI, signer);
  } else {
    alert("Please install MetaMask!");
  }
}


## Quick Start

1. Clone this repo  
2. Install dependencies (`npm install` or `yarn`)  
3. Modify `src/` for your specific use-case  
4. Keep the license and attribution intact  

---

## Documentation

See [docs/attribution.md](./docs/attribution.md) for expanded usage 
guidelines, licensing terms, and integration best practices.
