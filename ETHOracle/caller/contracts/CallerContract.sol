pragma solidity 0.5.0;

contract CallerContract {
    address private oracleAddress;
    function setOracleAddress(address _oracleInstanceAddress) public {
        oracleAddress = _oracleInstanceAddress;
    } //end function setOracleAddress()
} //end contract CallerContract{}