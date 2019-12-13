module UI.Merchants.Goibibo.Controller.CreditCardScreen where

import Effect
import Prelude
import PrestoDOM
import Types

import UI.Components.Controller.AddCard as AddCard
import UI.Components.Controller.AmountView as AmountView
import UI.Components.Controller.ToolBar as ToolBar
import UI.Components.Controller.PrimaryButton as PrimaryButton


type ScreenInput  = Unit
type ScreenOutput = Unit

data Action = CreditCardAction
    | ToolBarAction ToolBar.Action
    | AmountViewAction AmountView.Action 
    | AddCardAction AddCard.Action
    | PayButtonAction PrimaryButton.Action

type State = {
    orderSummaryState :: AmountView.State
}

initialState :: ScreenInput -> State
initialState input = {
    orderSummaryState : AmountView.initialState
}

-- eval GoibiboAction state = continue state
eval _ state = continue state

overrides _ push state = []