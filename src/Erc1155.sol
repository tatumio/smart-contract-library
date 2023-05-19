// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/token/ERC1155/extensions/ERC1155Burnable.sol";
import "@openzeppelin/contracts/access/AccessControl.sol";
import "@openzeppelin/contracts/token/ERC1155/extensions/ERC1155URIStorage.sol";

contract TatumErc1155 is ERC1155, ERC1155Burnable, AccessControl, ERC1155URIStorage {
    bytes32 public constant MINTER_ROLE = keccak256("MINTER_ROLE");

    constructor(address admin, address minter, string memory baseUri) ERC1155(baseUri) {
        _grantRole(DEFAULT_ADMIN_ROLE, admin);
        _grantRole(MINTER_ROLE, admin);
        if (admin != minter) {
            _grantRole(MINTER_ROLE, minter);
        }
        _setBaseURI(baseUri);
    }

    function uri(uint256 tokenId) public view virtual override(ERC1155, ERC1155URIStorage) returns (string memory) {
        return ERC1155URIStorage.uri(tokenId);
    }

    function mint(address account, uint256 id, uint256 amount, string memory url, bytes memory data)
    public
    onlyRole(MINTER_ROLE)
    {
        _mint(account, id, amount, data);
        _setURI(id, url);
    }

    function mintBatch(address to, uint256[] memory ids, uint256[] memory amounts, string[] memory uris, bytes memory data)
    public
    onlyRole(MINTER_ROLE)
    {
        _mintBatch(to, ids, amounts, data);
        for (uint256 i = 0; i < ids.length; i++) {
            _setURI(ids[i], uris[i]);
        }
    }

    // The following functions are overrides required by Solidity.

    function supportsInterface(bytes4 interfaceId)
    public
    view
    override(ERC1155, AccessControl)
    returns (bool)
    {
        return super.supportsInterface(interfaceId);
    }
}