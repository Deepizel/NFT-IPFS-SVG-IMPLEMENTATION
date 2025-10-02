// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import {Base64} from "@openzeppelin/contracts/utils/Base64.sol";

contract MoodNft is ERC721 {
    uint256 private s_tokenCounter;
    string private s_sadSvgImageUri;
    string private s_happySvgImageUri;

    enum mood {
        Sad,
        Happy
    }

    mapping(uint256 => mood) private s_tokenIdToMood;

    constructor(string memory sadSvgImageUri, string memory happySvgImageUri) ERC721("SvgNft", "MNT") {
        s_tokenCounter = 0;
        s_sadSvgImageUri = sadSvgImageUri;
        s_happySvgImageUri = happySvgImageUri;
    }

    function mintNft() public {
        // _mint(msg.sender, s_tokenCounter);
        _safeMint(msg.sender, s_tokenCounter);
        s_tokenIdToMood[s_tokenCounter] = mood.Happy;
        s_tokenCounter++;
    }

    function _baseURI() internal pure override returns (string memory) {
            return "data:application/json;base64,";
    }

    function flipMood(uint256 tokenId) public {
    // Fetch the owner of the token
    address owner = ownerOf(tokenId);
    // Only want the owner of NFT to change the mood.
    _checkAuthorized(owner, msg.sender, tokenId);

    if (s_tokenIdToMood[tokenId] == mood.Happy) {
        s_tokenIdToMood[tokenId] = mood.Sad;
    } else {
        s_tokenIdToMood[tokenId] = mood.Happy;
    }
}
    function tokenURI(uint256 tokenId) public override view returns (string memory) {

        string memory imageURI;
        if(s_tokenIdToMood[tokenId] == mood.Happy) {
            imageURI = s_happySvgImageUri;
        } else {
            imageURI = s_sadSvgImageUri;
        }
        
          // Build metadata JSON            
        // Return as base64-encoded JSON
        return string(
            abi.encodePacked(
                _baseURI(),
                Base64.encode(
                    bytes(
                        abi.encodePacked(
                            '{',
                                '"name": "', name(), '",',
                                '"description": "An NFT that reflects mood of the owner when minted",',
                                '"attributes": [',
                                    '{',
                                        '"trait_type": "Moodies",',
                                        '"value": "100"',
                                    '}',
                                '],',
                                '"image": "', imageURI, '"',
                            '}'
                        )
                    )
                )
            )
        );
    }
}




