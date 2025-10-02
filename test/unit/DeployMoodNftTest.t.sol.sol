// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Test} from "forge-std/Test.sol";
import {DeployMoodNft} from "../../script/DeployMoodNft.s.sol";
import {MoodNft} from "../../src/MoodNft.sol";

contract DeployMoodNftTest is Test {
    DeployMoodNft deployMoodNft;
    // function run() external returns () {
    // }

    function testConvertSvgToImageUri() public {
       DeployMoodNft deployMoodNft = new DeployMoodNft();
        string memory expectedUri = "data:image/svg+xml;base64,PHN2ZyB4bWxucz0naHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmcnIHZpZXdCb3g9JzAgMCAyMDAgMjAwJz48dGV4dCB4PSc1MCUnIHk9JzUwJScgdGV4dC1hbmNob3I9J21pZGRsZScgZG9taW5hbnQtYmFzZWxpbmU9J21pZGRsZSc+U3ZnTmZ0PC90ZXh0Pjwvc3ZnPg==";
        string memory svg = "<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 200 200'><text x='50%' y='50%' text-anchor='middle' dominant-baseline='middle'>SvgNft</text></svg>";
        string memory convertedUri = deployMoodNft.svgToImageURI(svg);
        assertEq(convertedUri, expectedUri);
    }
}