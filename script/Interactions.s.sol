// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Script} from "forge-std/Script.sol";
import {BasicNft} from "../src/BasicNft.sol";
import {DevOpsTools} from "lib/foundry-devops/src/DevOpsTools.sol";


contract MintBasicNft is Script {
    // set the url of the nft you want the minter to mint 
        string public constant PUG_URI = "ipfs://QmQnpDbTwY8X4mJZfva3yKKSbpJMnLpryueCQyqinw8BSG";

    function run() external {
        // get the most recently deployed contract
address mostRecentlyDeployedContract = DevOpsTools.get_most_recent_deployment("BasicNft", block.chainid);
    //    invoke the mintNftOnContract function
        mintNftOnContract(mostRecentlyDeployedContract);
    }
    // helper function to mint the nft on the contract
    function mintNftOnContract(address contractAddress) public {    
        vm.startBroadcast();
        BasicNft(contractAddress).mintNft(PUG_URI);
        vm.stopBroadcast();
    }
}