module UI.Merchants.RedBus.Controller.RedBusScreen where

import Effect
import Prelude
import PrestoDOM
import Types

import UI.Components.Controller.AddCard as AddCard
import UI.Components.Controller.PaymentOptions as PaymentOptions
import UI.Components.Controller.PopularBanks as PopularBanks
import UI.Components.Controller.ToolBar as ToolBar
import UI.Components.Controller.PrimaryButton as PrimaryButton

type ScreenInput  = Unit
type ScreenOutput = RedBusOutput

data Action = RedBusAction
    | ToolBarAction ToolBar.Action
    | PaymentOptionsAction PaymentOptions.Action
    | AddCardAction AddCard.Action
    | PopularBanksAction PopularBanks.Action
    | PrimaryButtonAction PrimaryButton.Action
    | OtherBanksAction
    | ExpandOrder

type State = 
    { active :: String
    , isExpanded :: Boolean
    }

initialState :: ScreenInput -> State
initialState input = 
    { active : "0"
    , isExpanded : false
    }

eval RedBusAction state = continue state
eval ExpandOrder state = continue $ state {isExpanded = (not state.isExpanded)}
eval OtherBanksAction state = exit OtherBanks
eval (PaymentOptionsAction (PaymentOptions.ToggleOption id)) state = continue $ state { active = id}
eval _ state = continue state

overrides "RedBus" push state = [onClick push $ const RedBusAction]
overrides _ push state = []