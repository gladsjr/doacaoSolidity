// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Doacao {


  fallback() external payable {
      
  }
  function sendEthRMoney(address payable recepient, uint256 value,uint256 cent) external{
    uint eth = (cent *1000000000000000);
    eth = (1 ether * value) + eth;
    recepient.transfer( eth );
  }
  
  function sendETHR(address payable recepient) external {
    recepient.transfer(1 ether );
  }
  function getBalance() external view returns(uint256){
      return address(this).balance;
  }
}
