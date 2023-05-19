// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.17;

/*
  interface Isolution {
    function solution() external pure returns (uint8);
}
*/

contract Level_0_Solution {

	  function solution() external pure returns (uint8){
        //return 42; 
        assembly{
        mstore(0x80,42) // store 42 in memory
        return(0x80, 0x20) 
        }
      }
}