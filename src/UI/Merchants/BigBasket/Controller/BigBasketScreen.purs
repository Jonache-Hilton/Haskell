module UI.Merchants.BigBasket.Controller.BigBasketScreen where

import Effect
import Prelude
import PrestoDOM
import UI.Types

import Effect.Console (logShow)
import UI.Utils
import PrestoDOM.Events (onBackPressed)
import UI.Components.Controller.Offers as Offers
import UI.Components.Controller.AmountView as AmountView
import UI.Components.Controller.PaymentOptions as PaymentOptions
import UI.Components.Controller.ToolBar as ToolBar

type ScreenInput  = BigBasketScreenState
type ScreenOutput = BigBasketScreenOutput

data Action = BigBasketAction
    | ToolBarAction ToolBar.Action
    | AmountViewAction AmountView.Action 
    | PaymentOptionsAction PaymentOptions.Action
    | OffersAction Offers.Action
    | Happened 
    | BackPressed
    | DefaultOption 

type State = {
      amount :: String
    , preferredOptions :: Array String
    , orderAmount :: String 
    , bbWalletAmount :: String
    , savedOptionDetails :: Array SavedOptionDetails  
}

initialState :: ScreenInput -> State
initialState (BigBasketScreenState input) = {
      amount : input.amount
    , preferredOptions : input.preferredOptions
    , orderAmount : input.orderAmount 
    , bbWalletAmount : input.bbWalletAmount
    , savedOptionDetails : input.savedOptionDetails
}



eval BackPressed state = exit $ GoBackFromBigBasketScreen
eval DefaultOption state = exit $ BBDefaultOption
eval Happened state = continue $ state {amount = "1111.0"}
eval BigBasketAction state = continue state
eval (PaymentOptionsAction (PaymentOptions.ToggleOption id)) state = do 
    case id of  
        "NetBanking" -> exit $ BBNetBanking
        -- "Wallet" -> exit $ BBWallet
        "Payzapp" -> exit $ BBPayzapp
        _ -> continue state 
-- eval BackPressed state = exit $ PreferredOptionID 0
eval _ state = continue state

overrides "BigBasket" push state = [onClick push $ const BigBasketAction]
overrides "MainLayout" push state = [onBackPressed push $ const BackPressed]
overrides _ push state = []
