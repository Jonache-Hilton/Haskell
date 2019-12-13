module UI.Merchants.Vodafone.Controller.SelectBankScreen where

import Effect
import Prelude
import PrestoDOM
import Types
import UI.Types

import UI.Components.Config.BankListItem as BankListItemConfig
import UI.Components.Controller.BankListItem as BankListItem
import UI.Components.Controller.ToolBar as ToolBar
import UI.Components.Controller.ToolbarV2 as ToolbarV2
import UI.Components.Controller.SearchBox as SearchBox
import UI.Components.Controller.PrimaryButton as PrimaryButton

type ScreenInput  = VodaSelectBankScreenState
type ScreenOutput = Unit

data Action = VodafoneAction 
    | ToolbarV2Action ToolbarV2.Action
    | SearchBoxAction SearchBox.Action
    | BankListItemAction Int BankListItem.Action
    | PrimaryButtonAction PrimaryButton.Action

type State = {
    banks :: Array NetBank
    , selectedBank :: Int
}

initialState :: ScreenInput -> State
initialState (VodaSelectBankScreenState input) = {
    banks : input.banks
    , selectedBank : -1
}

eval (BankListItemAction i _) state = continue $ state {selectedBank = i}
eval _ state = continue state

overrides _ push state = []