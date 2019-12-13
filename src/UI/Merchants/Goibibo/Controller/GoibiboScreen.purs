module UI.Merchants.Goibibo.Controller.GoibiboScreen where

import Effect
import Prelude
import PrestoDOM
import Types

import UI.Components.Config.BankListItem as BankListItemConfig
import UI.Components.Controller.BankListItem as BankListItemig
import UI.Components.Controller.ToolBar as ToolBar
import UI.Components.Controller.AmountView as AmountView
import UI.Components.Controller.PaymentOptions as PaymentOptions

type ScreenInput  = Unit
type ScreenOutput = GoibiboOutput

data Action = GoibiboAction
    | ToolBarAction ToolBar.Action
    | AmountViewAction AmountView.Action 
    | PaymentOptionsAction PaymentOptions.Action

type State = {
    orderSummaryState :: AmountView.State
}

initialState :: ScreenInput -> State
initialState input = {
    orderSummaryState : AmountView.initialState
}

eval GoibiboAction state = continue state
eval (PaymentOptionsAction (PaymentOptions.ToggleOption id)) state = do
    case id of
        "1" -> exit GoibiboUpi
        "2" -> exit GoibiboCreditCard
        "3" -> exit GoibiboDebitCard
        "4" -> exit GoibiboNetBanking
        _ -> exit GoibiboUpi
eval _ state = continue state

overrides "Goibibo" push state = [onClick push $ const GoibiboAction]
overrides _ push state = []