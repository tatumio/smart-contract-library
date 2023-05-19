// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/security/Pausable.sol";
import "@openzeppelin/contracts/access/AccessControl.sol";
import "@openzeppelin/contracts/token/ERC20/presets/ERC20PresetFixedSupply.sol";

contract TatumErc20 is ERC20, ERC20PresetFixedSupply, Pausable, AccessControl {
    bytes32 public constant PAUSER_ROLE = keccak256("PAUSER_ROLE");
    bytes32 public constant MINTER_ROLE = keccak256("MINTER_ROLE");
    uint8 decimals_;

    constructor(string memory name_, string memory symbol_, uint8 decimals__, uint256 initialSupply, address initialOwner, address admin, address minter, address pauser) ERC20PresetFixedSupply(name_, symbol_, initialSupply, initialOwner) {
        _grantRole(DEFAULT_ADMIN_ROLE, admin);
        _grantRole(MINTER_ROLE, admin);
        if (admin != minter) {
            _grantRole(MINTER_ROLE, minter);
        }
        _grantRole(PAUSER_ROLE, pauser);
        decimals_ = decimals__;
    }

    function decimals() public view virtual override returns (uint8) {
        return decimals_;
    }

    function pause() public onlyRole(PAUSER_ROLE) {
        _pause();
    }

    function unpause() public onlyRole(PAUSER_ROLE) {
        _unpause();
    }

    function mint(address to, uint256 amount) public onlyRole(MINTER_ROLE) {
        _mint(to, amount);
    }

    function _beforeTokenTransfer(address from, address to, uint256 amount)
    internal
    whenNotPaused
    override
    {
        super._beforeTokenTransfer(from, to, amount);
    }
}
