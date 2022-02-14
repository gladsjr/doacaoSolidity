// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

interface IERC20 {

    function totalSupply() external view returns (uint256);
    function balanceOf(address account) external view returns (uint256);
    function allowance(address owner, address spender) external view returns (uint256);

    function transfer(address recipient, uint256 amount) external returns (bool);
    function approve(address spender, uint256 amount) external returns (bool);
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);


    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);
}

contract Doacao {
   IERC20 public tokenMPE1;

   IERC20 public tokenMPE2;

  address public owner;
    constructor(address ower1,IERC20 MPE1,IERC20 MPE2) public {
     owner = ower1;
     tokenMPE1 = MPE1;
     tokenMPE2 = MPE2;
   }

  function transferMPE1(address  recepient, uint256 value) public{
    if(msg.sender== owner){
    tokenMPE1.transfer(recepient,value);
    }
  }
  function transferMPE2(address  recepient, uint256 value) public{
    if(msg.sender== owner){
    tokenMPE2.transfer(recepient,value);
    }
  }
  fallback() external payable {
      
  }
  
  function sendEthRMoney(address payable recepient, uint256 value,uint256 cent) external{
    if(msg.sender== owner){
    uint eth = (cent *1000000000000000);
    eth = (1 ether * value) + eth;
    recepient.transfer( eth );
    }
  }
  
  function sendETHR(address payable recepient) external {
    recepient.transfer(1 ether );
  }
  function getBalanceEth() external view returns(uint256){
      return address(this).balance;
  }
  function getBalanceMPE1() external view returns(uint256){
      address conta = address(this);
      return tokenMPE1.balanceOf(conta);
  }
  function getBalanceMPE2() external view returns(uint256){
      address conta = address(this);
      return tokenMPE2.balanceOf(conta);
  }
}
