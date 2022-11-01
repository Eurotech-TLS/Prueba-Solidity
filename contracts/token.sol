// SPDX-License-Identifier: MIT
/// @notice Almacena las posiciones GPS de la situación del coche identificado por carId
/// @dev Verifica el propietario y la edad.
/// @return positions el array con las posiciones almacenadas

pragma solidity ^0.8.6;
 
contract Primero{
   

    address public owner;
    string public carId = "";
    uint256 public ownerAge = 0;
    string[] public positions;
    bool isAdult = ownerAge <= 18;

    constructor(address _owner, string memory _carId){
        owner = _owner;
        carId = _carId;
    }

    function setOwner(address _newOwner, uint256 _newOwnerAge) public {
        require(msg.sender == owner, "Usted no es el propietario actual. ");
        require(_newOwnerAge > 18, "Es obligatorio ser mayor de edad");
        owner = _newOwner;
        ownerAge = _newOwnerAge;
    }

    function setPosition(string memory _newPos) public{
        require(msg.sender == owner, "Las actualizaciones deben ser hechas por el propietario");
        positions.push(_newPos);
    }

    function getPositions() public view returns(string[] memory){
        return positions;
    }

}
