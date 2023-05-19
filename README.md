## Tatum Smart Contracts

This repository contains three Solidity smart contracts: ERC20, ERC721, and ERC1155. These contracts are used in the Tatum SDK, a powerful blockchain infrastructure provider. Tatum offers a range of services to simplify blockchain development and integration, making it easier for developers to build decentralized applications.

### Contracts

The following contracts are included in this repository:

- **Erc20.sol**: An implementation of the ERC20 token standard. This contract allows users to create and manage their own fungible tokens on the Ethereum blockchain. It is based on the OpenZeppelin library version 4.8.3.

- **Erc721.sol**: An implementation of the ERC721 token standard. This contract enables the creation and management of unique, non-fungible tokens (NFTs) on the Ethereum blockchain. It is based on the OpenZeppelin library version 4.8.3.

- **Erc1155.sol**: An implementation of the ERC1155 token standard. This contract provides a more flexible token standard that allows for the creation of both fungible and non-fungible tokens on the Ethereum blockchain. It is based on the OpenZeppelin library version 4.8.3.

### Usage

To use these contracts in your project, you can either copy the source code directly or import the compiled bytecode and ABI files.

#### Solidity Source Code

The Solidity source code for each contract can be found in the `src` folder of this repository. You can simply copy the desired contract's source code and include it in your project.

#### Bytecode and ABI

If you prefer to use the compiled bytecode and ABI files, you can find them in the `bytecode` and `abi` folders respectively. These files can be used for contract deployment and interaction. Make sure to include the appropriate bytecode and ABI for the contract you want to use in your project.

### Verification on Etherscan

If you want to verify the contracts on Etherscan, you can find the Solidity source code in the `sources-for-verification` folder. This source code can be used for contract verification to ensure transparency and trustworthiness.

During verification on Etherscan, please ensure that the optimization is enabled and set to **200 runs** to match the compiler settings.

### Compiler Version

The contracts in this repository were compiled using the **Solidity compiler version 0.8.19+commit.7dd6d404**.

### Additional Resources

For more information on using these contracts and integrating with the Tatum SDK, you can refer to the [Tatum SDK GitHub Repository](https://github.com/tatumio/tatum-js).

For more information about Tatum and its blockchain infrastructure services, visit the [Tatum Website](https://tatum.com).

Please note that this repository and the contracts contained within it are provided by Tatum, and any inquiries or support requests should be directed to the Tatum team.
