// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.17;

//interface Isolution6 {
  //  function solution(
    //  bytes32 messageHash, 
      //uint8 v, 
      //bytes32 r, 
      //bytes32 s
      //) external pure 
    //returns (address signer);
//}

contract Level_6_Solution {
        
    function solution(
        bytes32 messageHash, 
        uint8 v, 
        bytes32 r, 
        bytes32 s    
    ) external view returns (address signer) {
        bytes32 prefixedHash = keccak256(abi.encodePacked("\x19Ethereum Signed Message:\n32", messageHash));

        assembly {
            let p := mload(0x40)
            mstore(p, prefixedHash)
            mstore(add(p, 32), v)
            mstore(add(p, 64), r)
            mstore(add(p, 96), s)

            let success := staticcall(gas(), 0x01, p, 128, p, 32)
            signer := mload(p)

            // Free memory
            mstore(0x40, add(p, 128))

            // Check if the call was successful
            if iszero(success) {
                revert(0, 0)
            }
        }
    }
}
