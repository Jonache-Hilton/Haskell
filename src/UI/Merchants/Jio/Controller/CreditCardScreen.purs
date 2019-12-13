module UI.Merchants.Jio.Controller.CreditCardScreen where

import Effect
import Prelude
import PrestoDOM
import Types

import UI.Components.Config.BankListItem as BankListItemConfig
import UI.Components.Controller.BankListItem as BankListItemig
import UI.Components.Controller.ToolBar as ToolBar
import UI.Components.Controller.AmountView as AmountView
import UI.Components.Controller.PaymentOptions as PaymentOptions
import UI.Components.Controller.AddCardV2 as AddCardV2
import UI.Components.Controller.PrimaryButton as PrimaryButton

type ScreenInput  = Unit
type ScreenOutput = Unit

data Action = CreditCardAction
    | ToolBarAction ToolBar.Action
    | AmountViewAction AmountView.Action
    | AddCardAction AddCardV2.Action
    | PayButtonAction PrimaryButton.Action

type State = {
    orderSummaryState :: AmountView.State
}

initialState :: ScreenInput -> State
initialState input = {
    orderSummaryState : AmountView.initialState
}

eval CreditCardAction state = continue state
eval _ state = continue state

overrides _ push state = []