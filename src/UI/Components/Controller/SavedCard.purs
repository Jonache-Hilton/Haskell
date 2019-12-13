module UI.Components.Controller.SavedCard where

import Prelude
import PrestoDOM
import UI.Components.Config.SavedCard
import UI.Components.Controller.SecondaryButton as SecondaryButton

data Action = Clicked  | SecondaryButtonAction SecondaryButton.Action

type State = {
}

initialState :: State
initialState = {
}

overrides _ push state = []