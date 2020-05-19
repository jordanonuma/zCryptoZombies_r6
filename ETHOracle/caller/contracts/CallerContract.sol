pragma solidity 0.5.0;
import "./EthPriceOracleInterface.sol";
import "../../../Ownable.sol";

contract CallerContract is Ownable {
    EthPriceOracleInterface private oracleInstance;
    address private oracleAddress;
    mapping(uint256=>bool) myRequests;
    event newOracleAddressEvent(address oracleAddress);
    event ReceivedNewRequestIdEvent(uint256 id);

    function setOraclInstanceAddress(address _oracleInstanceAddress) public onlyOwner {
        oracleAddress = _oracleInstanceAddress;
        oracleInstance = EthPriceOracleInterface(oracleAddress);
        emit newOracleAddressEvent(oracleAddress);
    } //end function setOracleInstanceAddress()

    function updateETHPrice() public {
        uint id = oracleInstance.getLatestEthPrice();
        myRequests[id] == true;
        emit ReceivedNewRequestIdEvent(id);
    } //end function updateETHPrice()
} //end contract CallerContract{}