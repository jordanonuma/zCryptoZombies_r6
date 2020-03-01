pragma solidity >=0.5.0 <0.6.0;
import "./ZombieFactory.sol";

contract KittyInterface {
    function getKitty(uint256 _id) external view returns (
        bool isGestating,
        bool isReady,
        uint256 cooldownIndex,
        uint256 nextActionAt,
        uint256 siringWithId,
        uint256 birthTime,
        uint256 matronId,
        uint256 sireId,
        uint256 generation,
        uint256 genes
    ) //end function getKitty();
} //end contract KittyInteface{}

contract ZombieFeeding is ZombieFactory {
    address ckAddress = 0x06012c8cf97BEaD5deAe237070F9587f8E7A266d;
    KittyInterface kittyContract = KittyInterface(ckAddress);

    function feedAndMultiply (uint _zombieId, uint _targetDna) public {
        require(msg.sender == zombieToOwner[_zombieId]);
        Zombie storage myZombie = zombies[_zombieId];

        uint _targetDna = _targetDna % dnaModulus;
        newDna = (myZombie.dna +_targetDna)/2;
        _createZombie("NoName", newDna);
    } //end function feedAndMultiply()

    function feedOnKitty(uint _zombieId, uint _kittyId) public {
        uint kittyDna;
        (,,,,,,,,, kittyDna) = kittyContract.getKitty(_kittyID);
        feedAndMultiply(_zombieId, kittyDna);
    } //end function feedOnKitty()
} //end ZombieFeeding{}