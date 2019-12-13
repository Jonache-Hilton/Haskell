module UI.Merchants.Grofers.Controller.SelectUPIScreen where

import Effect
import Prelude
import PrestoDOM
import Types
import UI.Types

import UI.Components.Controller.PaymentOptions as PaymentOptions

type ScreenInput  = Unit
type ScreenOutput = Unit

data Action = GrofersAction 
    | PaymentOptionsAction PaymentOptions.Action

type State = {
}

initialState :: ScreenInput -> State
initialState input = {
}

eval _ state = continue state

overrides _ push state = []