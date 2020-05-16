pragma solidity 0.5.0;
import "./EthPriceOracleInterface.sol";

contract EthPriceOracleInterface {
  function getLatestEthPrice() public returns (uint256);
} //end contract EthPriceOracleInterface{}