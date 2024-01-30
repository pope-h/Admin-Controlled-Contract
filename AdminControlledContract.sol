//SPDX-License-Identifier: UNLINCENSED
pragma solidity 0.8.22;

contract AdminControlled {
    address public admin;
    uint256 public value;

    modifier onlyAdmin() {
        require(msg.sender == admin, "Caller is not the admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function changeAdmin(address newAdmin) public onlyAdmin {
        require(newAdmin != address(0), "New admin cannot be the zero address");
        admin = newAdmin;
    }

    function setValue(uint256 newValue) public onlyAdmin {
        value = newValue;
    }

    function getValue() public view onlyAdmin returns (uint256) {
        return value;
    }
}