// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.17;


//interface Isolution5 {
  //  function solution(bytes32 b, bytes32 ex, bytes32 modulus) external returns (bytes32 result);
//}


contract Level_5_Solution {
        
function solution(bytes32 b, bytes32 ex, bytes32 modulus) external returns (bytes32 result) {
        
    assembly {
            // Prepare the input and output buffers
            let input := mload(0x40)
            mstore(input, 0x60) // Length of input buffer
            mstore(add(input, 0x20), 0x20) // Offset of base
            mstore(add(input, 0x40), 0x20) // Offset of exponent
            mstore(add(input, 0x60), 0x20) // Offset of modulus
            mstore(add(input, 0x80), b) // Base
            mstore(add(input, 0xA0), ex) // Exponent
            mstore(add(input, 0xC0), modulus) // Modulus

            let output := mload(0x80)

            // Call the modular exponentiation precompiled contract at address 0x05
            if iszero(call(not(0), 0x05, 0, input, 0xE0, output, 0x20)) {
                revert(0, 0)
            }

            // Retrieve the result from the output buffer
            result := mload(output)
        }
    }
}