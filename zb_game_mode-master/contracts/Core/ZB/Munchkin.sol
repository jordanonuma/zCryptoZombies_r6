pragma solidity 0.4.25;

import "./ZB/ZBGameMode.sol";

contract ExampleGame is ZBGameMode  {

    function beforeMatchStart(bytes serializedGameState) external {
        GameState memory gameState;
        gameState.init(serializedGameState);

        ZBSerializer.SerializedGameStateChanges memory changes;
        changes.init();

        changes.emit();
    } // end function beforeMatchStart()

    function isLegalCard(CardInstance card) internal view returns(bool) {
        return(!bannedCards[card.mouldName]);
    } //end function isLegalCard()

} //end contract ExampleGame{}
