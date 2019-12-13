module UI.Merchants.Dream11.Controller.WalletsScreen where

import Effect
import Prelude
import PrestoDOM
import Types

import Effect.Console (logShow)
import UI.Components.Controller.PaymentOptionsV2 as PaymentOptionsV2
import UI.Components.Controller.ToolBar as ToolBar
import UI.Components.Controller.AmountView as AmountView

type ScreenInput  = Unit
type ScreenOutput = Unit

data Action = Dream11Action
    | ToolBarAction ToolBar.Action
    | WalletsAction PaymentOptionsV2.Action
    | AmountViewAction AmountView.Action


type State = {
    dream11AmountViewState :: AmountView.State
}

initialState :: ScreenInput -> State
initialState input = {
    dream11AmountViewState : AmountView.initialState
}

eval Dream11Action state = continue state
eval (WalletsAction _) state = exit unit
eval _ state = continue state

overrides "Dream11" push state = [onClick push $ const Dream11Action]
overrides _ push state = []
