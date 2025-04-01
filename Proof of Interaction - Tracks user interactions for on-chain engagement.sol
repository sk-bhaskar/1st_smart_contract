pragma solidity ^0.8.0;

contract DynamicNFT {
    struct NFT {
        uint256 id;
        uint256 creationTime;
        uint256 attribute;
    }

    mapping(uint256 => NFT) public nfts;
    uint256 public nextId;

    function mint() public {
        nfts[nextId] = NFT(nextId, block.timestamp, 1);
        nextId++;
    }

    function getAttribute(uint256 id) public view returns (uint256) {
        require(id < nextId, "NFT does not exist");
        return (block.timestamp - nfts[id].creationTime) / 60 + 1;
    }
}
