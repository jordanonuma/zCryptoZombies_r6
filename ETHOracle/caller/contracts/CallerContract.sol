pragma solidity 0.5.0;

contract CallerContract {
    address private oracleAddress;

    function setOraclInstanceAddress(address _oracleInstanceAddress) public {
        oracleAddress = _oracleInstanceAddress;
    } //end function setOracleInstanceAddress()
} //end contract CallerContract{}