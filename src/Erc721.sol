// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Burnable.sol";
import "@openzeppelin/contracts/access/AccessControl.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract TatumErc721 is ERC721, ERC721URIStorage, ERC721Burnable, AccessControl, Ownable {
    bytes32 public constant MINTER_ROLE = keccak256("MINTER_ROLE");
    string private _baseUri;

    constructor(string memory name, string memory symbol, string memory baseURI, address admin, address minter) ERC721(name, symbol) {
        _grantRole(DEFAULT_ADMIN_ROLE, admin);
        _grantRole(MINTER_ROLE, admin);
        if (admin != minter) {
            _grantRole(MINTER_ROLE, minter);
        }
        transferOwnership(admin);
        _baseUri = baseURI;
    }

    function _baseURI() internal view override returns (string memory) {
        return _baseUri;
    }

    function mintWithTokenURI(
        address to,
        uint256 tokenId,
        string memory uri
    ) public onlyRole(MINTER_ROLE) {
        safeMint(to, tokenId, uri);
    }


    function safeMint(address to, uint256 tokenId, string memory uri)
    public
    onlyRole(MINTER_ROLE)
    {
        _safeMint(to, tokenId);
        _setTokenURI(tokenId, uri);
    }

    function mintMultiple(
        address[] memory to,
        uint256[] memory tokenId,
        string[] memory uri
    ) public onlyRole(MINTER_ROLE) {
        safeMintBatch(to, tokenId, uri);
    }

    function safeMintBatch(address[] memory to, uint256[] memory tokenId, string[] memory uri)
    public
    onlyRole(MINTER_ROLE)
    {
        for (uint256 i = 0; i < to.length; i++) {
            _safeMint(to[i], tokenId[i]);
            _setTokenURI(tokenId[i], uri[i]);
        }
    }

    // The following functions are overrides required by Solidity.

    function _burn(uint256 tokenId) internal override(ERC721, ERC721URIStorage) {
        super._burn(tokenId);
    }

    function tokenURI(uint256 tokenId)
    public
    view
    override(ERC721, ERC721URIStorage)
    returns (string memory)
    {
        return super.tokenURI(tokenId);
    }

    function supportsInterface(bytes4 interfaceId)
    public
    view
    override(ERC721, AccessControl)
    returns (bool)
    {
        return super.supportsInterface(interfaceId);
    }
}