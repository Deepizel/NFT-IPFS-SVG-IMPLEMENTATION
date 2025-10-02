// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Script} from "forge-std/Script.sol";
import {MoodNft} from "../src/MoodNft.sol";
import {Base64} from "@openzeppelin/contracts/utils/Base64.sol";

contract DeployMoodNft is Script {
    string public SAD_SVG_IMAGE_URI;
    string public HAPPY_SVG_IMAGE_URI;
    
    function run() external returns (MoodNft) {
        string memory sadSvg = vm.readFile("./img/sad.svg");
        string memory happySvg = vm.readFile("./img/happy.svg");
        SAD_SVG_IMAGE_URI = svgToImageURI(sadSvg);
        HAPPY_SVG_IMAGE_URI = svgToImageURI(happySvg);
        vm.startBroadcast();
        MoodNft moodNft = new MoodNft(SAD_SVG_IMAGE_URI, HAPPY_SVG_IMAGE_URI);
        vm.stopBroadcast();
        return moodNft;
    }

    // convert svg to base string programatically
    function svgToImageURI(string memory svg) public pure returns (string memory) {
        string memory baseURL = "data:image/svg+xml;base64,";
        string memory svgBase64Encoded = Base64.encode(bytes(string(abi.encodePacked(svg))));
        return string(string.concat(baseURL, svgBase64Encoded));
    }
}