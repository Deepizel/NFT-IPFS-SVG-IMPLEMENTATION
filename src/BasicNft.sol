//SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";
// import {ERC721URIStorage} from "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
// import {Counters} from "@openzeppelin/contracts/utils/Counters.sol";

contract BasicNft is ERC721 {

    uint256 private s_tokenCounter;
    mapping(uint256 => string) private s_tokenIdToUri;
    constructor() ERC721("Dogie", "k-Dwag") {
        s_tokenCounter = 0;
    }

    // function mint() public {
    //     // _mint(msg.sender, 1);
    // }
// import mint function from ERC721URIStorage
function mintNft(string memory tokenUri) public {
    s_tokenIdToUri[s_tokenCounter] = tokenUri;
    // mint nft
    _safeMint(msg.sender, s_tokenCounter);
    // increase token counter
    s_tokenCounter ++;
}
    function tokenURI(uint256 tokenId) public override view returns (string memory) {
        // return "ipfs://QmQnpDbTwY8X4mJZfva3yKKSbpJMnLpryueCQyqinw8BSG";
        // return the mapped token url to the tokenId
        return s_tokenIdToUri[tokenId];
    }

}