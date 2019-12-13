module UI.Merchants.BigBasket.Controller.NetBankingScreen where

import Effect
import Prelude
import PrestoDOM
import Types
import UI.Types

import Effect.Console (logShow)
import UI.Components.Controller.BankListItem as BankListItem
import UI.Components.Controller.ToolBar as ToolBar
import UI.Components.Controller.SearchBox as SearchBox
import UI.Components.Controller.PrimaryButton as PrimaryButton
import UI.Components.Controller.BankCard as BankCard


type ScreenInput  = BBNetBankingScreenState
type ScreenOutput = BigBasketNetBankingScreenOutput

data Action = Dream11Action
    | ToolBarAction ToolBar.Action
    | BankListItemAction Int BankListItem.Action
    | SearchBoxAction SearchBox.Action
    | PrimaryButtonAction PrimaryButton.Action
    | BankCardAction BankCard.Action
    | BackPressed

type State = {
    -- popularBankState :: PopularBanksV2.State
    banks :: Array NetBank
    , selectedBank :: Int
}

initialState :: ScreenInput -> State
initialState (BBNetBankingScreenState input) = {
    -- popularBankState : PopularBanksV2.initialState
    banks : input.banks
    , selectedBank : -1
}

eval BackPressed state = exit $ GoBackFromBBNetBankingScreeen
eval (BankListItemAction i _) state = continue $ state {selectedBank = i}
eval _ state = continue state

overrides "MainLayout" push state = [onBackPressed push $ const BackPressed]
overrides _ push state = []
