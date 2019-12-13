module UI.Merchants.Dream11.Controller.NetBankingScreen where

import Effect
import Prelude
import PrestoDOM
import Types

import Effect.Console (logShow)
import UI.Components.Controller.BankListItem as BankListItem
import UI.Components.Controller.ToolBar as ToolBar
import UI.Components.Controller.AmountView as AmountView
import UI.Components.Controller.SearchBox as SearchBox


type ScreenInput  = Unit
type ScreenOutput = Unit

data Action = Dream11Action
    | ToolBarAction ToolBar.Action
    | NetBankingAction BankListItem.Action
    | AmountViewAction AmountView.Action
    | SearchBoxAction SearchBox.Action

type State = {
    dream11NetBankingState :: BankListItem.State
    , dream11AmountViewState :: AmountView.State
}

initialState :: ScreenInput -> State
initialState input = {
    dream11NetBankingState : BankListItem.initialState
    , dream11AmountViewState : AmountView.initialState
}

eval Dream11Action state = continue state
eval (NetBankingAction _) state = exit unit
eval _ state = continue state

overrides "Dream11" push state = [onClick push $ const Dream11Action]
overrides _ push state = []
