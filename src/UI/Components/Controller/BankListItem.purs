module UI.Components.Controller.BankListItem where
import Prelude
import PrestoDOM
import UI.Components.Config.BankListItem

data Action = CardClicked Int

type State = {
    active :: Boolean,
    name :: String,
    logo :: String,
    index :: Int
}

initialState :: State
initialState = {
    active : true,
    name : "Axis Bank",
    logo : "bank_axis",
    index : 0
}

overrides "Clicked" push state = [onClick push $ const $ CardClicked state.index]
overrides _ push state = []