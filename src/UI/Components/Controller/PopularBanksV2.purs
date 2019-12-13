module UI.Components.Controller.PopularBanksV2 where 

import Prelude
import PrestoDOM

data Action = BankSelected Int

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

overrides "Selected" push state = [onClick push $ const $ BankSelected state.index]
overrides _ push state = []