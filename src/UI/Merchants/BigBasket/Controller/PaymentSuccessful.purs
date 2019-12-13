module UI.Merchants.BigBasket.Controller.PaymentSuccessful where 


import Effect
import Prelude
import PrestoDOM
import UI.Types
import UI.Components.Controller.ToolBar as ToolBar
import UI.Components.Controller.AmountView as AmountView 
import UI.Components.Controller.PaymentOptions as PaymentOptions
import UI.Components.Controller.Offers as Offers
import UI.Components.Controller.KeyBoard as KeyBoard
import UI.Utils
import Effect.Console (logShow)
import Data.String

type ScreenInput  = BigBasketPaymentSuccessfulState
type ScreenOutput = BigBasketPaymentSuccessfulOutput

data Action = BigBasketAction
    | ToolBarAction ToolBar.Action
    | AmountViewAction AmountView.Action 
    | PaymentOptionsAction PaymentOptions.Action
    | OffersAction Offers.Action
    | CVV_CHANGED String
    | KeyBoardAction KeyBoard.Action
    | BackPressed

type State = {
    orderSummaryState :: AmountView.State
    , amount :: String
    , paymentStatus :: String 
    , paymentStatusIcon :: String
}

initialState :: ScreenInput -> State
initialState (BigBasketPaymentSuccessfulState input) = {
      orderSummaryState : AmountView.initialState
    , amount : input.amount
    , paymentStatus : input.paymentStatus
    , paymentStatusIcon : input.paymentStatusIcon 
}

eval BackPressed state = exit $ GoBackFromBBPaymentSuccessful
eval _ state = continue state

overrides "BigBasket" push state = [onClick push $ const BigBasketAction]
overrides "MainLayout" push state = [onBackPressed push $ const BackPressed]
overrides _ push state = []