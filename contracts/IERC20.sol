// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

interface IERC20 {
    function totalSupply() external view returns (uint256);
    function balanceOf(address account) external view returns (uint256 balance);
    function transfer(address recipient, uint256 amount) external returns (bool succeeded);
    function allowance(address owner, address spender) external view returns (uint256 amount);
    function approve(address spender, uint256 amount) external returns (bool succeeded);
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool succeeded);
}