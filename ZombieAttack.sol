pragma solidity >=0.5.0 <0.6.0;
import "./ZombieHelper.sol";

contract ZombieAttack is ZombieHelper {
    uint randNonce = 0;
    uint attackVictoryProbability = 70; //i.e. 70% chance of winning

    function randMod(uint _modulus) internal returns(uint) {
        randNonce++;
        return uint(keccak256(abi.encodePacked(now, msg.sender, randNonce))) % _modulus;
    } //end function randMod()

    function attack(uint _zombieId, uint _targetId) external {
    
    } //end function attack()
} //end contract ZombieAttack{}