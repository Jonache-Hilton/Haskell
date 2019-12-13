module UI.Merchants.Dream11.Controller.AddCardScreen where

import Effect
import Prelude
import PrestoDOM
import Types

import Effect.Console (logShow)
import UI.Components.Controller.AddCard as AddCard
import UI.Components.Controller.PaymentOptions (Action(..))
import UI.Components.Controller.PaymentOptions as PaymentOptions
import UI.Components.Controller.ToolBar as ToolBar
import UI.Components.Controller.PrimaryButton as PrimaryButton

type ScreenInput  = Unit
type ScreenOutput = Unit

data Action = Dream11Action
    | ToolBarAction ToolBar.Action
    | AddCardAction AddCard.Action
    | PrimaryButtonAction PrimaryButton.Action

type State = {
    dream11AddCardState :: AddCard.State
}

initialState :: ScreenInput -> State
initialState input = {
    dream11AddCardState : AddCard.initialState
}

eval Dream11Action state = continue state
eval (AddCardAction _) state = exit unit
eval _ state = continue state

overrides "Dream11" push state = [onClick push $ const Dream11Action]
overrides _ push state = []
