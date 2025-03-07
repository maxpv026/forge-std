// SPDX-License-Identifier: MIT
pragma solidity >=0.6.2 <0.9.0;

pragma experimental ABIEncoderV2;

abstract contract StdInvariant {
    // Struct to represent a set of function selectors for a specific contract address.
    struct FuzzSelector {
        address addr;
        bytes4[] selectors;
    }

    // Struct to represent a set of artifacts for a specific contract address.
    struct FuzzInterface {
        address addr;
        string[] artifacts;
    }

    // Arrays to store addresses, strings, and structs for excluded and targeted contracts, senders, artifacts, and selectors.
    address[] private _excludedContracts;
    address[] private _excludedSenders;
    address[] private _targetedContracts;
    address[] private _targetedSenders;
    string[] private _excludedArtifacts;
    string[] private _targetedArtifacts;
    FuzzSelector[] private _targetedArtifactSelectors;
    FuzzSelector[] private _targetedSelectors;
    FuzzInterface[] private _targetedInterfaces;

    // Functions for users:
    // These are intended to be called in tests.

    function excludeContract(address newExcludedContract_) internal {
        _excludedContracts.push(newExcludedContract_);
    }

    function excludeSender(address newExcludedSender_) internal {
        _excludedSenders.push(newExcludedSender_);
    }

    function excludeArtifact(string memory newExcludedArtifact_) internal {
        _excludedArtifacts.push(newExcludedArtifact_);
    }

    function targetArtifact(string memory newTargetedArtifact_) internal {
        _targetedArtifacts.push(newTargetedArtifact_);
    }

    function targetArtifactSelector(FuzzSelector memory newTargetedArtifactSelector_) internal {
        _targetedArtifactSelectors.push(newTargetedArtifactSelector_);
    }

    function targetContract(address newTargetedContract_) internal {
        _targetedContracts.push(newTargetedContract_);
    }

    function targetSelector(FuzzSelector memory newTargetedSelector_) internal {
        _targetedSelectors.push(newTargetedSelector_);
    }

    function targetSender(address newTargetedSender_) internal {
        _targetedSenders.push(newTargetedSender_);
    }

    function targetInterface(FuzzInterface memory newTargetedInterface_) internal {
        _targetedInterfaces.push(newTargetedInterface_);
    }

    // Functions for forge:
    // These are called by forge to run invariant tests and don't need to be called in tests.

    function excludeArtifacts() public view returns (string[] memory excludedArtifacts_) {
        excludedArtifacts_ = _excludedArtifacts;
    }

    function excludeContracts() public view returns (address[] memory excludedContracts_) {
        excludedContracts_ = _excludedContracts;
    }

    function excludeSenders() public view returns (address[] memory excludedSenders_) {
        excludedSenders_ = _excludedSenders;
    }

    function targetArtifacts() public view returns (string[] memory targetedArtifacts_) {
        targetedArtifacts_ = _targetedArtifacts;
    }

    function targetArtifactSelectors() public view returns (FuzzSelector[] memory targetedArtifactSelectors_) {
        targetedArtifactSelectors_ = _targetedArtifactSelectors;
    }

    function targetContracts() public view returns (address[] memory targetedContracts_) {
        targetedContracts_ = _targetedContracts;
    }

    function targetSelectors() public view returns (FuzzSelector[] memory targetedSelectors_) {
        targetedSelectors_ = _targetedSelectors;
    }

    function targetSenders() public view returns (address[] memory targetedSenders_) {
        targetedSenders_ = _targetedSenders;
    }

    function targetInterfaces() public view returns (FuzzInterface[] memory targetedInterfaces_) {
        targetedInterfaces_ = _targetedInterfaces;
    }
}
