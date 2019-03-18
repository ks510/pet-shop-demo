pragma solidity ^0.5.0;

import "truffle/Assert.sol"; // assertion library
import "truffle/DeployedAddresses.sol"; // getting address of deployed contract
import "../contracts/Adoption.sol"; // the contract this is testing

contract TestAdoption {
  // Address of the Adoption contract to be tested
  Adoption adoption = Adoption(DeployedAddresses.Adoption());
  // The id of the pet that will be used for testing adoption functions
  uint expectedPetId = 8;
  // The expected owner of adopted pet is this contract (sender)
  address expectedAdopter = address(this);

  function testUserCanAdoptPet() public {
    uint returnedId = adoption.adopt(expectedPetId);
    Assert.equal(returnedId, expectedPetId, "Adoption of the expected pet should match what is returned.");
  }

  function testGetAdopterAddressByPetId() public {
    address adopter = adoption.adopters(8);
    Assert.equal(adopter, expectedAdopter, "Owner of the expected pet should be this test contract.");
  }

  function testGetAdopterAddressByPetIdInArray() public {
    // store adopters in memory rather than contract's storage (copy of array)
    address[16] memory adopters = adoption.getAdopters();
    Assert.equal(adopters[expectedPetId], expectedAdopter, "Owner of the expected pet should be this test contract.");
  }
}
