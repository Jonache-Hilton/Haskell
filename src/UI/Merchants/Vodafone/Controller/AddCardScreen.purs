module UI.Merchants.Vodafone.Controller.AddCardScreen where

import Effect
import Prelude
import PrestoDOM
import Types

import Effect.Console (logShow)
import UI.Components.Controller.AddCard as AddCard
import UI.Components.Controller.PaymentOptions (Action(..))
import UI.Components.Controller.PaymentOptions as PaymentOptions
import UI.Components.Controller.ToolBar as ToolBar
import UI.Components.Controller.ToolbarV2 as ToolbarV2
import UI.Components.Controller.PrimaryButton as PrimaryButton

type ScreenInput  = Unit
type ScreenOutput = Unit

data Action = VodafoneAction
    | ToolbarV2Action ToolbarV2.Action
    | AddCardAction AddCard.Action
    | PrimaryButtonAction PrimaryButton.Action

type State = {
    vodafoneAddCardState :: AddCard.State
}

initialState :: ScreenInput -> State
initialState input = {
    vodafoneAddCardState : AddCard.initialState
}

eval VodafoneAction state = continue state
eval (AddCardAction _) state = exit unit
eval _ state = continue state

overrides "Vodafone" push state = [onClick push $ const VodafoneAction]
overrides _ push state = []
