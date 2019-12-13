module UI.Controller.Screens.TestingScreen where

import Effect
import Prelude
import PrestoDOM
import Types

import UI.Components.Controller.SecondaryButton as SecondaryButton
import UI.Components.Config.SecondaryButton as SecondaryButtonConfig
import UI.Components.Controller.BankListItem as BankListItem
import UI.Components.Controller.ToolBar as ToolBar
import UI.Components.Controller.AmountView as AmountView
import UI.Components.Controller.PaymentOptions as PaymentOptions
import UI.Components.Controller.PaymentOptionsV2 as PaymentOptionsV2
import UI.Components.Controller.AddCardV2 as AddCardV2
import UI.Components.Controller.SavedCard as SavedCard

type ScreenInput  = Unit

type ScreenOutput = Unit

data Action = TestingAction
    | ToolBarAction ToolBar.Action
    | AmountViewAction AmountView.Action 
    | PaymentOptionsAction PaymentOptions.Action
    | PaymentOptionsV2Action PaymentOptionsV2.Action
    | AddCardAction AddCardV2.Action
    | SavedCardAction SavedCard.Action
    | SecondaryButtonAction SecondaryButton.Action

type State =  {}

initialState :: ScreenInput -> State
initialState input = {}

eval _ state = continue state

overrides _ push state = []