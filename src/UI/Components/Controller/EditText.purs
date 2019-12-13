module UI.Components.Controller.EditText where

import Prelude
import PrestoDOM
import UI.Components.Config.AddCard

data Action = Changed | TextChanged String 

type State = {
}

initialState :: State
initialState = {
}

overrides _ push state = []