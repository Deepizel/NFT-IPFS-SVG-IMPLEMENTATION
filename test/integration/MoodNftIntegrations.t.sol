// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Test, console} from "forge-std/Test.sol";
import {MoodNft} from "../../src/MoodNft.sol";
import {DeployMoodNft} from "../../script/DeployMoodNft.s.sol";

contract MoodNftIntegrationsTest is Test {
    MoodNft moodNft;
   string public constant HAPPY_SVG_IMAGE_URI = "data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCAyMDAgMjAwIiB3aWR0aD0iMjAwIiBoZWlnaHQ9IjIwMCIgcm9sZT0iaW1nIiBhcmlhLWxhYmVsbGVkYnk9InRpdGxlIGRlc2MiPgogIDx0aXRsZSBpZD0idGl0bGUiPlNtaWxleSBmYWNlPC90aXRsZT4KICA8ZGVzYyBpZD0iZGVzYyI+WWVsbG93IGNpcmN1bGFyIHNtaWxleSBmYWNlIHdpdGggdHdvIGV5ZXMgYW5kIGEgY3VydmVkIG1vdXRoPC9kZXNjPgoKICA8IS0tIGZhY2UgLS0+CiAgPGNpcmNsZSBjeD0iMTAwIiBjeT0iMTAwIiByPSI5MCIgZmlsbD0iI0ZGRDkzQiIgc3Ryb2tlPSIjRjRCNDAwIiBzdHJva2Utd2lkdGg9IjYiLz4KCiAgPCEtLSBsZWZ0IGV5ZSAtLT4KICA8ZWxsaXBzZSBjeD0iNzAiIGN5PSI4MCIgcng9IjEyIiByeT0iMTYiIGZpbGw9IiMyRDJEMkQiLz4KCiAgPCEtLSByaWdodCBleWUgLS0+CiAgPGVsbGlwc2UgY3g9IjEzMCIgY3k9IjgwIiByeD0iMTIiIHJ5PSIxNiIgZmlsbD0iIzJEMkQyRCIvPgoKICA8IS0tIG1vdXRoIC0tPgogIDxwYXRoIGQ9Ik01NSAxMjAgUTEwMCAxNjAgMTQ1IDEyMCIgc3Ryb2tlPSIjMkQyRDJEIiBzdHJva2Utd2lkdGg9IjgiIGZpbGw9InRyYW5zcGFyZW50IiBzdHJva2UtbGluZWNhcD0icm91bmQiLz4KCiAgPCEtLSBzbGlnaHQgY2hlZWsgaGlnaGxpZ2h0cyAtLT4KICA8ZWxsaXBzZSBjeD0iNjIiIGN5PSIxMTAiIHJ4PSI2IiByeT0iMyIgZmlsbD0iI0ZGRTY4MCIgb3BhY2l0eT0iMC45Ii8+CiAgPGVsbGlwc2UgY3g9IjEzOCIgY3k9IjExMCIgcng9IjYiIHJ5PSIzIiBmaWxsPSIjRkZFNjgwIiBvcGFjaXR5PSIwLjkiLz4KPC9zdmc+Cg==";
   address public USER = makeAddr("user");
   string public constant SAD_SVG_IMAGE_URI = "data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCAyMDAgMjAwIiB3aWR0aD0iMjAwIiBoZWlnaHQ9IjIwMCIgcm9sZT0iaW1nIiBhcmlhLWxhYmVsbGVkYnk9InRpdGxlIGRlc2MiPgogIDx0aXRsZSBpZD0idGl0bGUiPlNhZCBmYWNlPC90aXRsZT4KICA8ZGVzYyBpZD0iZGVzYyI+WWVsbG93IGNpcmN1bGFyIHNhZCBmYWNlIHdpdGggdHdvIGV5ZXMgYW5kIGEgZG93bndhcmQgY3VydmVkIG1vdXRoPC9kZXNjPgoKICA8IS0tIGZhY2UgLS0+CiAgPGNpcmNsZSBjeD0iMTAwIiBjeT0iMTAwIiByPSI5MCIgZmlsbD0iI0ZGRDkzQiIgc3Ryb2tlPSIjRjRCNDAwIiBzdHJva2Utd2lkdGg9IjYiLz4KCiAgPCEtLSBsZWZ0IGV5ZSAtLT4KICA8ZWxsaXBzZSBjeD0iNzAiIGN5PSI4MCIgcng9IjEyIiByeT0iMTYiIGZpbGw9IiMyRDJEMkQiLz4KCiAgPCEtLSByaWdodCBleWUgLS0+CiAgPGVsbGlwc2UgY3g9IjEzMCIgY3k9IjgwIiByeD0iMTIiIHJ5PSIxNiIgZmlsbD0iIzJEMkQyRCIvPgoKICA8IS0tIG1vdXRoIChmcm93bikgLS0+CiAgPHBhdGggZD0iTTU1IDE0MCBRMTAwIDEwMCAxNDUgMTQwIiBzdHJva2U9IiNlNDcwNzAiIHN0cm9rZS13aWRkdGg9IjgiIGZpbGw9InRyYW5zcGFyZW50IiBzdHJva2UtbGluZWNhcD0icm91bmQiLz4KPC9zdmc+Cg==";
    DeployMoodNft deployer;

    function setUp() public {
        deployer = new DeployMoodNft();
        moodNft = deployer.run();
        // moodNft = new MoodNft(SAD_SVG_IMAGE_URI, HAPPY_SVG_IMAGE_URI);
    }

    function testViewTokenURIintegration() public {
        vm.prank(USER);
        moodNft.mintNft();
        console.log(moodNft.tokenURI(0));
    }
    
    
    function testFlipMoodIntegration() public {
        vm.startPrank(USER);
        moodNft.mintNft();
        moodNft.flipMood(0);
        // we should not be equating the image uri because the image uri is base64 encoded
        // assertEq(moodNft.tokenURI(0), SAD_SVG_IMAGE_URI);
        console.log(moodNft.tokenURI(0));
        vm.stopPrank();
    }
 
}