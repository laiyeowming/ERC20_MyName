// SPDX-License-Identifier: MIT
pragma solidity ^0.5.0;
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/docs-v2.x/contracts/token/ERC20/ERC20Capped.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/docs-v2.x/contracts/token/ERC20/ERC20Detailed.sol";


contract MyName is ERC20Capped, ERC20Detailed {
    uint256 private _cap = (1000000*(10**18));

    constructor()
        ERC20Capped(_cap)
        ERC20Detailed("LaiYM", "LYM", 18) public {
    }

    function cap() public view returns (uint256) {
        return _cap;
    }

    function _mint(address account, uint256 value) internal {
        require(totalSupply().add(value) <= _cap, "ERC20Capped: cap exceeded");
        super._mint(account, value);
    }

}