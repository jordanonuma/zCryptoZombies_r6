pragma solidity >=0.5.0 <0.6.0;
import "./ZombieAttack.sol";
import "./ERC721.sol";

contract ZombieOwnership is ZombieAttack, ERC721 {

  function balanceOf(address _owner) external view returns (uint256) {

  } //end function balanceOf()

} //end contract ZombieOwnership{}