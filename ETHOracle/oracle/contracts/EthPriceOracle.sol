pragma solidity 0.5.0;
import "../../../Ownable.sol";
import "./CallerContractInterface.sol";
contract EthPriceOracle is Ownable {
    uint private randNonce = 0;
    uint private modulus = 1000;
    mapping(uint256=>bool) pendingRequests;
    event GetLatestEthPriceEvent(address callerAddress, uint id);
    event SetLatestEthPriceEvent(uint256 ethPrice, address callerAddress);
  
    function getLatestEthPrice() public returns(uint256) {
        randNonce++;
        uint id = uint(keccak256(abi.encodePacked(now, msg.sender, randNonce))) % modulus;
        pendingRequests[id] = true;
        emit GetLatestEthPriceEvent(msg.sender, id);
        return id;
    } //end function getLatestEthPrice()

    function setLatestEthPrice(uint256 _ethPrice, address _callerAddress, uint256 _id) public onlyOracle() {
        require(pendingRequests[_id], "This request is not in my pending list.");
        delete pendingRequests[_id];

        CallerContractInterface CallerContractInstance;
    } //end function setLatestEthPrice()
} //end contract EthPriceOracle{}
