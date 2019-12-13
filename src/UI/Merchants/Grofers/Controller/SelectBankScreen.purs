module UI.Merchants.Grofers.Controller.SelectBankScreen where

import Effect
import Prelude
import PrestoDOM
import Types
import UI.Types

import UI.Components.Config.BankListItem as BankListItemConfig
import UI.Components.Controller.BankListItem as BankListItem
import UI.Components.Controller.ToolBar as ToolBar
import UI.Components.Controller.SearchBox as SearchBox

type ScreenInput  = GrofersSelectBankScreenState
type ScreenOutput = Unit

data Action = GrofersAction 
    | ToolBarAction ToolBar.Action
    | SearchBoxAction SearchBox.Action
    | BankListItemAction Int BankListItem.Action

type State = {
    banks :: Array NetBank
    , selectedBank :: Int
}

initialState :: ScreenInput -> State
initialState (GrofersSelectBankScreenState input) = {
    banks : input.banks
    , selectedBank : -1
}

eval (BankListItemAction i _) state = continue $ state {selectedBank = i}
eval _ state = continue state

overrides _ push state = []