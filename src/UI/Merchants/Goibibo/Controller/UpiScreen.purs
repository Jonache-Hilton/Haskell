module UI.Merchants.Goibibo.Controller.UpiScreen where

import Effect
import Prelude
import PrestoDOM
import Types

import UI.Components.Config.BankListItem as BankListItemConfig
import UI.Components.Controller.BankListItem as BankListItemig
import UI.Components.Controller.AmountView as AmountView
import UI.Components.Controller.PaymentOptions as PaymentOptions
import UI.Components.Controller.ToolBar as ToolBar
import UI.Components.Controller.EditTextV2 as EditTextV2
import UI.Components.Controller.PrimaryButton as PrimaryButton

type ScreenInput  = Unit
type ScreenOutput = Unit

data Action = Upi
    | ToolBarAction ToolBar.Action
    | AmountViewAction AmountView.Action 
    | VpaAction EditTextV2.Action
    | VerifyButtonAction PrimaryButton.Action

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