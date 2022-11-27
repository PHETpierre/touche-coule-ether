// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

import 'hardhat/console.sol';

abstract contract Ship {
  function update(uint x, uint y) public virtual;
  function fire() public virtual returns (uint, uint);
  function place(uint width, uint height) public virtual returns (uint, uint);
}

contract MyShip is Ship{

  uint private abs;
  uint private ord;
  uint randLocal = 0; 

  constructor(){

    abs = 0;
    ord = 0;

  }

  function update(uint x, uint y) public override virtual{
    abs = x;
    ord = y;
  }

  function fire() public virtual override returns (uint, uint){
    return (abs, ord);
  }

  function place(uint width, uint height) public virtual override returns (uint, uint){
    abs = randomNumber(50);
    ord = randomNumber(50);
    return (abs, ord);
  }

  function randomNumber (uint _modulus) internal returns (uint){
    randLocal++;
    return uint(keccak256(abi.encodePacked(block.timestamp, msg.sender, randLocal)))%_modulus;
  }

}

contract MyShip2 is Ship{

  uint private abs;
  uint private ord;
  uint randLocal = 0;

  constructor(){

    abs = 1;
    ord = 0;

  }

  function update(uint x, uint y) public override virtual{
      abs = x;
      ord = y;
  }

  function fire() public virtual override returns (uint, uint){
    return (abs, ord);
  }

  function place(uint width, uint height) public virtual override returns (uint, uint){
    abs = randomNumber(50);
    ord = randomNumber(50);
    return (abs, ord);
  }

  function randomNumber (uint _modulus) internal returns (uint){
    randLocal++;
    return uint(keccak256(abi.encodePacked(block.timestamp, msg.sender, randLocal)))%_modulus;
  }



}
