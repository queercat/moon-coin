// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "./IERC20.sol";

contract MoonCoin is IERC20 {
    uint256 public totalSupply;

    string public name;
    string public symbol;
    uint8 public decimals;

    mapping(address => uint256) internal _balances;
    mapping(address => mapping(address => uint256)) internal _allowances;

    event Approval(address indexed owner, address indexed spender, uint256 amount);
    event Transfer(address indexed from, address indexed to, uint256 amount);

    constructor(string memory _name, string memory _symbol, uint8 _decimals, uint256 _totalSupply) {
        name = _name;
        symbol = _symbol;
        decimals = _decimals;
        totalSupply = _totalSupply;
    }

    function balanceOf(address account) external view returns (uint256 balance) {
        return _balances[account];
    }


    function allowance(address owner, address spender) external view returns (uint256 amount) {
        return _allowances[owner][spender];
    }

    function approve(address spender, uint256 amount) external returns (bool succeeded) {
        _allowances[msg.sender][spender] = amount;

        emit Approval(msg.sender, spender, amount);

        return true;
    }

    function transferFrom(address from, address to, uint256 amount) external returns (bool succeeded) {
        require(_allowances[from][msg.sender] >= amount, "sorry, you should try asking for more money!!!!");
        require(_balances[from] >= amount, unicode"they're broke lol 😔");

        _balances[from] = _balances[from] - amount;
        _balances[to] += amount;

        emit Transfer(from, to, amount);

        return true;
    }

    function transfer(address to, uint256 amount) external returns (bool succeeded) {
        require(_balances[msg.sender] >= amount, unicode"you're broke lol 😔");

        _balances[msg.sender] -= amount;
        _balances[to] += amount;

        emit Transfer(msg.sender, to, amount);

        return true;
    }
}