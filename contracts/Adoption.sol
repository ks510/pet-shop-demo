pragma solidity ^0.5.0;

contract Adoption {
  address[16] public adopters; // store up to 16 adoptions

  // adopting a pet, use the pet id as key
  function adopt(uint _petId) public returns (uint) {
    require(_petId >= 0 && _petId <= 15); //ensure id is in range of array
    adopters[_petId] = msg.sender; // adopter is sender of this function
    return _petId; // return pet id for confirmation
  }

  // retrieve a copy of the array of adopters
  // view means this function will not change the state of contract
  function getAdopters() public view returns (address[16] memory) {
    return adopters;
  }
}
