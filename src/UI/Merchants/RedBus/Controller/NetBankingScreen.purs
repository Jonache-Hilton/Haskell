module UI.Merchants.RedBus.Controller.NetBankingScreen where

import Effect
import Prelude
import PrestoDOM
import Types

import Effect.Console (logShow)
import UI.Components.Controller.BankListItem as BankListItem
import UI.Components.Controller.ToolBar as ToolBar
import UI.Components.Controller.SearchBox as SearchBox

type ScreenInput  = Unit
type ScreenOutput = Unit

data Action = Dream11Action
    | ToolBarAction ToolBar.Action
    | NetBankingAction BankListItem.Action
    | SearchBoxAction SearchBox.Action

type State = {
    redBusNetBankingState :: BankListItem.State
}

initialState :: ScreenInput -> State
initialState input = {
    redBusNetBankingState : BankListItem.initialState
}

eval _ state = continue state

overrides _ push state = []
