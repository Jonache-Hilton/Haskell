module UI.Merchants.Goibibo.Controller.NetBankingScreen where

import Effect
import Prelude
import PrestoDOM
import Types

import UI.Components.Config.BankListItem as BankListItemConfig
import UI.Components.Controller.BankListItem as BankListItem
import UI.Components.Controller.PopularBanksV2 as PopularBanksV2
import UI.Components.Controller.ToolBar as ToolBar
import UI.Components.Controller.AmountView as AmountView
import UI.Components.Controller.PaymentOptions as PaymentOptions

type ScreenInput  = Unit
type ScreenOutput = Unit

data Action = NetBankingAction
    | ToolBarAction ToolBar.Action
    | AmountViewAction AmountView.Action 
    | PopularBanksAction PopularBanksV2.Action
    | BankListItemAction BankListItem.Action

type State = {
    amountViewState :: AmountView.State
    , popularBankState :: PopularBanksV2.State
    , bankListItemState :: BankListItem.State
    , searchBoxActive :: Boolean
}

initialState :: ScreenInput -> State
initialState input = 
    { amountViewState : AmountView.initialState
    , popularBankState : PopularBanksV2.initialState
    , bankListItemState : BankListItem.initialState
    , searchBoxActive : true
    }

eval (ToolBarAction (ToolBar.ActionIconClicked)) state = continue $ state {searchBoxActive = not state.searchBoxActive}
eval _ state = continue state

overrides _ push state = []