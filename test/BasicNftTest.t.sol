// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Test} from "forge-std/Test.sol";
import {BasicNft} from "../src/BasicNft.sol";
import {DeployBasicNft} from "../script/DeployBasicNft.s.sol";

contract BasicNftTest is Test {
    DeployBasicNft public deployer;
    BasicNft public basicNft;
    address public USER = makeAddr("user");
    string public constant PUG_URI = "ipfs://QmQnpDbTwY8X4mJZfva3yKKSbpJMnLpryueCQyqinw8BSG";


    function setUp() public {
        deployer = new DeployBasicNft();
        basicNft = deployer.run();
    }

    function testNameIsCorrect() public view {
        string memory expectedName = "Dogie";
        string memory actualName = basicNft.name();
        assertEq(keccak256(abi.encodePacked(expectedName)), keccak256(abi.encodePacked(actualName)));
    }

    function testMintNft() public {
        vm.prank(USER);
        basicNft.mintNft(PUG_URI);
        assertEq(basicNft.ownerOf(0), USER);
        assertEq(basicNft.tokenURI(0), PUG_URI);
        assert(basicNft.balanceOf(USER) == 1);
    }
}