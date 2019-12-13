module UI.Merchants.BigBasket.Controller.CvvScreen where

import Data.String
import Effect
import Prelude
import PrestoDOM
import UI.Types

import Debug.Trace (spy)
import Effect.Console (logShow)
import Utils
import UI.Components.Controller.KeyBoard as KeyBoard
import UI.Components.Controller.Offers as Offers
import UI.Components.Controller.PaymentOptions as PaymentOptions
import UI.Components.Controller.ToolBar as ToolBar

type ScreenInput  = BigBasketCvvScreenState
type ScreenOutput = BigBasketCvvScreenOutput

data Action = BigBasketAction
    | ToolBarAction ToolBar.Action
    | PaymentOptionsAction PaymentOptions.Action
    | OffersAction Offers.Action
    | CVV_CHANGED String
    | KeyBoardAction KeyBoard.Action
    | CvvEntered 
    | BackPressed

type State = {
      amount :: String 
    , bankName :: String 
    , cardNumber :: String 
    , offer :: String 
    , bankIcon :: String 
    , keyBoardClearIcon :: String 
    , keyBoardProceedIcon :: String 
    , cvv :: String 
    , cardTypeIcon :: String 
}

initialState :: ScreenInput -> State
initialState (BigBasketCvvScreenState input) = 
    { amount : input.amount 
    , bankName : input.bankName
    , cardNumber : input.cardNumber
    , offer : input.offer 
    , bankIcon : input.bankIcon 
    , keyBoardClearIcon : input.keyBoardClearIcon 
    , keyBoardProceedIcon : input.keyBoardProceedIcon
    , cardTypeIcon : input.cardTypeIcon
    , cvv : ""
    }

eval BackPressed state = exit $ GoBackFromBBCvvScreen
eval BigBasketAction state = continue state
eval (CvvEntered) state = exit ShowSuccess 
eval (CVV_CHANGED cv) state = continue $ state {cvv = cv}
eval (PaymentOptionsAction (PaymentOptions.ToggleOption id)) state = do 
    _ <- pure $ logShow id 
    _ <- pure $ log "getOS"  
    _ <- pure $ logShow $ getOS unit  
    continue state
eval (KeyBoardAction (KeyBoard.KeyAction key)) state = continue $ state {cvv = (state.cvv <> (show key))}
eval (KeyBoardAction KeyBoard.Proceed) state = continue $ state {cvv="123"} 
eval (KeyBoardAction KeyBoard.Clear) state = do
    _ <- pure $ log $ dropLastChar state.cvv
    continue $ state {cvv=dropLastChar state.cvv}
eval _ state = continue state

overrides "BigBasket" push state = [onClick push $ const BigBasketAction]
overrides "MainLayout" push state = [onBackPressed push $ const BackPressed]
overrides _ push state = []