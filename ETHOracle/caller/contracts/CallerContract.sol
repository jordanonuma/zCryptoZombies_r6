pragma solidity 0.5.0;
import "./EthPriceOracleInterface.sol";
import "../../../Ownable.sol";

contract CallerContract is Ownable {
    address private oracleAddress;

    function setOraclInstanceAddress(address _oracleInstanceAddress) public {
        oracleAddress = _oracleInstanceAddress;
        oracleInstance = EthPriceOracleInterface(oracleAddress);
    } //end function setOracleInstanceAddress()
} //end contract CallerContract{}