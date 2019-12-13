module UI.Merchants.Grofers.Controller.NewCardScreen where

import Effect
import Prelude
import PrestoDOM
import Types

import UI.Components.Config.BankListItem as BankListItemConfig
import UI.Components.Controller.BankListItem as BankListItemig
import UI.Components.Controller.ToolBar as ToolBar
import UI.Components.Controller.AmountView as AmountView
import UI.Components.Controller.PaymentOptions as PaymentOptions
import UI.Components.Controller.AddCard as AddCard

type ScreenInput  = Unit
type ScreenOutput = Unit

data Action = GrofersAction 
    | ToolBarAction ToolBar.Action
    | AmountViewAction AmountView.Action 
    | PaymentOptionsAction PaymentOptions.Action
    | NewCardAction PaymentOptions.Action
    | AddCardAction AddCard.Action

type State = {
    orderSummaryState :: AmountView.State
}

initialState :: ScreenInput -> State
initialState input = {
    orderSummaryState : AmountView.initialState
}

eval _ state = continue state

overrides _ push state = []