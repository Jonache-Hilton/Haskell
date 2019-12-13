module UI.Merchants.Grofers.Controller.GrofersScreen where

import Effect
import Prelude
import PrestoDOM
import Types
import UI.Types

import UI.Components.Config.BankListItem as BankListItemConfig
import UI.Components.Controller.BankListItem as BankListItemig
import UI.Components.Controller.ToolBar as ToolBar
import UI.Components.Controller.AmountView as AmountView
import UI.Components.Controller.PaymentOptions as PaymentOptions
import UI.Components.Controller.PopularBanks as PopularBanks

type ScreenInput  = Unit
type ScreenOutput = GrofersScreenOutput

data Action = GrofersAction 
    | ToolBarAction ToolBar.Action
    | AmountViewAction AmountView.Action 
    | PaymentOptionsAction PaymentOptions.Action
    | NewCardAction PaymentOptions.Action
    | PopularBanksAction PopularBanks.Action
    | ViewBanks
    | SelectUPIAction PaymentOptions.Action

type State = {
    orderSummaryState :: AmountView.State
}

initialState :: ScreenInput -> State
initialState input = {
    orderSummaryState : AmountView.initialState
}

eval (NewCardAction _) state = exit NewCard
eval ViewBanks state = exit ViewNetBanks
eval (SelectUPIAction _) state = exit ChooseUPI
eval _ state = continue state

overrides "ViewBanks" push state = [onClick push $ const ViewBanks]
overrides _ push state = []