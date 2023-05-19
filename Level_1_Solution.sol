
/// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.17;

/*
  interface Isolution1 {
    function solution(uint256[2] calldata firstArray, uint256[2] calldata secondArray) external pure returns (uint256[2] calldata finalArray);
  }
*/

contract Level_1_Solution {

    function solution(uint256[2][2] calldata x, uint256[2][2] calldata y) external pure returns (uint256[2][2] memory finalArray) {
    
        unchecked{
        for (uint i = 0; i < 2; i++) {
            for (uint j = 0; j < 2; j++) {
                finalArray[i][j] = x[i][j] + y[i][j];
            }
        }
        }
        //return finalArray;
    }      
}

