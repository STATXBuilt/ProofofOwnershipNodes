// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title ProofOfOwnership Registry
/// @notice Fresh, self-contained implementation for tracking ownership of nodes
/// @dev Does not affect any previously deployed contracts; ready for new repo
contract ProofOfOwnershipRegistry {
    struct Node {
        address owner;
        string metadataURI; // e.g., JSON with node info
        bool active;
        uint256 createdAt;
    }

    uint256 public nodeCount;
    mapping(uint256 => Node) public nodes;

    // Events
    event NodeRegistered(uint256 indexed nodeId, address indexed owner, string metadataURI);
    event NodeStatusUpdated(uint256 indexed nodeId, bool active);
    event NodeMetadataUpdated(uint256 indexed nodeId, string metadataURI);

    /// @notice Register a new node with metadata
    /// @param metadataURI Arbitrary string to store node info (e.g., JSON)
    function registerNode(string calldata metadataURI) external returns (uint256) {
        nodeCount++;
        nodes[nodeCount] = Node({
            owner: msg.sender,
            metadataURI: metadataURI,
            active: true,
            createdAt: block.timestamp
        });

        emit NodeRegistered(nodeCount, msg.sender, metadataURI);
        return nodeCount;
    }

    /// @notice Update the active status of a node
    /// @param nodeId The node ID to update
    /// @param active True if active, false if inactive
    function setNodeStatus(uint256 nodeId, bool active) external {
        require(msg.sender == nodes[nodeId].owner, "Not node owner");
        nodes[nodeId].active = active;
        emit NodeStatusUpdated(nodeId, active);
    }

    /// @notice Update metadata for a node
    /// @param nodeId The node ID to update
    /// @param metadataURI The new metadata string
    function updateNodeMetadata(uint256 nodeId, string calldata metadataURI) external {
        require(msg.sender == nodes[nodeId].owner, "Not node owner");
        nodes[nodeId].metadataURI = metadataURI;
        emit NodeMetadataUpdated(nodeId, metadataURI);
    }

    /// @notice Retrieve node info
    /// @param nodeId The node ID to fetch
    function getNode(uint256 nodeId) external view returns (Node memory) {
        return nodes[nodeId];
    }
}
