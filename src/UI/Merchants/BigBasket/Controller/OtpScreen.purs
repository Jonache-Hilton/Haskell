module UI.Merchants.BigBasket.Controller.OtpScreen where

import Effect
import Prelude
import PrestoDOM
import UI.Types
import UI.Components.Controller.ToolBar as ToolBar
import UI.Components.Controller.AmountView as AmountView
import UI.Components.Controller.PaymentOptions as PaymentOptions
import UI.Components.Controller.Offers as Offers
import UI.Components.Controller.KeyBoard as KeyBoard
import Utils
import Effect.Console (logShow)
import Data.String

type ScreenInput  = BigBasketOtpScreenState
type ScreenOutput = BigBasketOtpScreenOutput

data Action = BigBasketAction
    | ToolBarAction ToolBar.Action
    | AmountViewAction AmountView.Action 
    | PaymentOptionsAction PaymentOptions.Action
    | OffersAction Offers.Action
    | CVV_CHANGED String
    | KeyBoardAction KeyBoard.Action
    | BackPressed

type State = {
    amount :: String
}

initialState :: ScreenInput -> State
initialState (BigBasketOtpScreenState input) = {
      amount : input.amount
}


eval BackPressed state = exit $ GoBackFromBBOtpScreen
eval BigBasketAction state = continue state
eval (PaymentOptionsAction (PaymentOptions.ToggleOption id)) state =  continue state
eval (KeyBoardAction (KeyBoard.KeyAction key)) state = continue state
eval (KeyBoardAction KeyBoard.Proceed) state = continue state 
eval (KeyBoardAction KeyBoard.Clear) state = continue state
eval _ state = continue state

overrides "BigBasket" push state = [onClick push $ const BigBasketAction]
overrides "MainLayout" push state = [onBackPressed push $ const BackPressed]
overrides _ push state = []