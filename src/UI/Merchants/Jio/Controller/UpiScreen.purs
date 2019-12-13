module UI.Merchants.Jio.Controller.UpiScreen where

import Effect
import Prelude
import PrestoDOM
import Types

import UI.Components.Controller.ToolBar as ToolBar
import UI.Components.Controller.PrimaryButton as PrimaryButton
import UI.Components.Controller.EditText as EditText

type ScreenInput  = Unit
type ScreenOutput = Unit

data Action = UpiAction
    | ToolBarAction ToolBar.Action
    | PayButtonAction PrimaryButton.Action
    | EditTextAction EditText.Action

type State = {
}

initialState :: ScreenInput -> State
initialState input = {
}

eval UpiAction state = continue state
eval _ state = continue state

overrides _ push state = []