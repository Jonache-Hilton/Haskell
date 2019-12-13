module UI.Merchants.Dream11.Controller.Dream11Screen where

import Effect
import Prelude
import PrestoDOM
import Types

import UI.Components.Config.BankListItem as BankListItemConfig
import UI.Components.Config.BankListItem as BankListItemConfig
import UI.Components.Controller.BankListItem as BankListItemig
import UI.Components.Controller.BankListItem as BankListItemig
import UI.Components.Controller.AmountView (Action(..))
import UI.Components.Controller.AmountView as AmountView
import UI.Components.Controller.AmountView as AmountView
import UI.Components.Controller.PaymentOptions as PaymentOptions
import UI.Components.Controller.ToolBar as ToolBar
import UI.Components.Controller.ToolBar as ToolBar

type ScreenInput  = Unit
type ScreenOutput = Dream11Output

data Action = Dream11Action
    | ToolBarAction ToolBar.Action
    | AmountViewAction AmountView.Action 
    | PaymentOptionsAction PaymentOptions.Action

type State = {
    amountViewState :: AmountView.State
}

initialState :: ScreenInput -> State
initialState input = {
    amountViewState : AmountView.initialState
}

eval Dream11Action state = continue state
eval (PaymentOptionsAction (PaymentOptions.ToggleOption id)) state = do
  case id of
    "1" -> exit DebitCredit
    "2" -> exit NetBanking
    "3" -> exit Wallets
    _ -> continue state
eval _ state = continue $ state 

overrides "Dream11" push state = [onClick push $ const Dream11Action]
overrides _ push state = []