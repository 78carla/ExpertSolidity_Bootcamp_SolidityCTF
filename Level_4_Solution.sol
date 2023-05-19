// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.1;

/*
interface Isolution {
    function solution(uint256 value) external;
}
*/

contract Level_4_Solution {
        
    function solution(uint256 value) external {

    assembly {
            sstore(3, value)
        }
    }
    
}
