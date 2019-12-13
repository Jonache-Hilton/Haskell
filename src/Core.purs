module Core where

import Prelude 
import DummyData
import Control.Transformers.Back.Trans
import Effect.Class
import Presto.Core.Flow
import PrestoDOM
import Presto.Core.Flow (Flow, initUI, runScreen)
import PrestoDOM
import Types
import Utils
import UI.Types
import Control.Monad.Except.Trans (ExceptT(..), runExceptT)
import Data.Either (Either(..))
import Debug.Trace (spy)
import Effect (Effect)
import Engineering.Helpers.Commons (liftFlow, liftRunScreen)
import Engineering.Types.App (FlowBT, PaymentPageError, liftFlowBT)
import Foreign (Foreign)
import Partial.Unsafe (unsafePartial)

import UI.Merchants.Airtel.View.AirtelScreen as AirtelScreen
import UI.Merchants.Airtel.View.AirtelCardScreen as AirtelCardScreen
import UI.Merchants.Airtel.View.AirtelNetBankingScreen as AirtelNetBankingScreen
import UI.Merchants.BigBasket.View.BigBasketScreen as BigBasketScreen
import UI.Merchants.BigBasket.View.CvvScreen as CvvScreen
import UI.Merchants.BigBasket.View.OtpScreen as BigBasketOtpScreen
import UI.Merchants.BigBasket.View.PaymentSuccessful as PaymentSuccessful
import UI.Merchants.BigBasket.View.NetBankingScreen as BigBasketNetBankingScreen
import UI.Merchants.BigBasket.View.WalletScreen as BigBasketWalletScreen
import UI.Merchants.Dream11.View.AddCardScreen as AddCardScreen
import UI.Merchants.Dream11.View.Dream11Screen as Dream11Screen
import UI.Merchants.Dream11.View.NetBankingScreen as NetBankingScreen
import UI.Merchants.Dream11.View.WalletsScreen as WalletsScreen
import UI.Merchants.Dream11.View.NetBankingScreen as Dream11NetBankingScreen
import UI.Merchants.Goibibo.View.CreditCardScreen as GoibiboCreditCardScreen
import UI.Merchants.Goibibo.View.DebitCardScreen as GoibiboDebitCardScreen
import UI.Merchants.Goibibo.View.GoibiboScreen as GoibiboScreen
import UI.Merchants.Goibibo.View.NetBankingScreen as GoibiboNetBankingScreen
import UI.Merchants.Goibibo.View.UpiScreen as GoibiboUpiScreen
import UI.Merchants.Grofers.View.GrofersScreen as GrofersScreen
import UI.Merchants.Grofers.View.NewCardScreen as GrofersNewCardScreen
import UI.Merchants.Grofers.View.SelectBankScreen as GrofersSelectBankScreen
import UI.Merchants.Grofers.View.SelectUPIScreen as GrofersSelectUPIScreen
import UI.Merchants.Jio.View.JioScreen as JioScreen
import UI.Merchants.Jio.View.CreditCardScreen as JioCreditCardScreen
import UI.Merchants.Jio.View.DebitCardScreen as JioDebitCardScreen
import UI.Merchants.Jio.View.UpiScreen as JioUpiScreen
import UI.Merchants.Ola.View.OlaScreen as OlaScreen
import UI.Merchants.RedBus.View.NetBankingScreen as RedBusNetBankingScreen
import UI.Merchants.RedBus.View.RedBusScreen as RedBusScreen
import UI.Merchants.Stock.View.StockScreen as StockScreen
import UI.Merchants.SpiceJet.View.SpiceJetScreen as SpiceJetScreen
import UI.Merchants.Vodafone.View.AddCardScreen as VodaAddCardScreen
import UI.Merchants.Vodafone.View.SelectBankScreen as VodaSelectBankScreen
import UI.Merchants.Vodafone.View.VodafoneScreen as VodafoneScreen
import UI.View.Screens.MainScreen as MainScreen
import UI.View.Screens.TestingScreen as TestingScreen
import UI.Merchants.Idea.View.IdeaScreen as IdeaScreen

screenFont = "Roboto-Bold"

foreign import showPanel :: Foreign -> Foreign -> (Foreign -> Effect Unit) -> Effect Unit

runApp :: Flow Unit
runApp = unsafePartial $ do
  let screenInput = {}
  output <- runScreen (MainScreen.screen (MainScreenState screenInput))
  _ <- case output of
    (Dream11 screenState) -> dream11App
    (Airtel screenState) -> airtelApp
    (RedBus screenState) -> redBusApp
    (Goibibo screenState) -> goibiboApp
    (SpiceJet screenState) -> spiceJetApp
    (Jio screenState) -> jioApp
    (BigBasket screenState) -> bigBasketApp
    (Vodafone screenState) -> vodafoneApp
    (Grofers screenState) -> grofersApp
    (Ola screenState) -> olaApp
    (Idea screenState) -> ideaApp
    (Stock screenState) -> stockApp
    (Testing screenState) -> testingApp
  pure unit

ideaApp :: Flow Unit
ideaApp = unsafePartial $ do
  _ <- runScreen (IdeaScreen.screen unit)
  pure unit


dream11App :: Flow Unit
dream11App = unsafePartial $ do
  output <- initUI *> runScreen (Dream11Screen.screen unit)
  _ <- case output of
    DebitCredit -> runScreen (AddCardScreen.screen unit)
    NetBanking -> runScreen (Dream11NetBankingScreen.screen unit)
    Wallets -> runScreen (WalletsScreen.screen unit)
    _ -> runScreen (AddCardScreen.screen unit)
  pure unit

testingApp :: Flow Unit
testingApp = unsafePartial $ do
  _ <- runScreen (TestingScreen.screen unit)
  pure unit
  
airtelApp :: Flow Unit
airtelApp = unsafePartial $ do
  output <- runScreen (AirtelScreen.screen unit)
  _ <- case output of 
      GoToAirtelNB -> runScreen (AirtelNetBankingScreen.screen unit)
      AirtelCard -> runScreen (AirtelCardScreen.screen unit)
      _ -> pure unit 
  pure unit

redBusApp :: Flow Unit
redBusApp = unsafePartial $ do
  output <- runScreen (RedBusScreen.screen unit)
  _ <- case output of
    OtherBanks -> runScreen (RedBusNetBankingScreen.screen unit)
    _ -> runScreen (RedBusNetBankingScreen.screen unit)
  pure unit

goibiboApp :: Flow Unit
goibiboApp = unsafePartial $ do
  output <- runScreen (GoibiboScreen.screen unit)
  _ <- case output of
    GoibiboUpi -> runScreen (GoibiboUpiScreen.screen unit)
    GoibiboCreditCard -> runScreen (GoibiboCreditCardScreen.screen unit)
    GoibiboDebitCard -> runScreen (GoibiboDebitCardScreen.screen unit)
    GoibiboNetBanking -> runScreen (GoibiboNetBankingScreen.screen unit)
    _ -> runScreen (GoibiboNetBankingScreen.screen unit)
  pure unit

spiceJetApp :: Flow Unit
spiceJetApp = unsafePartial $ do
  _ <- runScreen (SpiceJetScreen.screen unit)
  pure unit

jioApp :: Flow Unit
jioApp = unsafePartial $ do
  output <- runScreen (JioScreen.screen unit)
  _ <- case output of
    JioCreditCard -> runScreen (JioCreditCardScreen.screen unit)
    JioDebitCard -> runScreen (JioDebitCardScreen.screen unit)
    JioUpi -> runScreen (JioUpiScreen.screen unit)
    _ -> runScreen (JioCreditCardScreen.screen unit)
  pure unit


vodafoneApp :: Flow Unit
vodafoneApp = unsafePartial $ do
  output <- runScreen (VodafoneScreen.screen unit)
  _ <- case output of
    VodaDebitCredit -> runScreen (VodaAddCardScreen.screen unit)
    VodaViewNetBanks -> runScreen (VodaSelectBankScreen.screen (VodaSelectBankScreenState {banks : mapOfBankAndIIN}))
    _ -> runScreen (VodaAddCardScreen.screen unit)
  pure unit

grofersApp :: Flow Unit
grofersApp = unsafePartial $ do
  output <- runScreen (GrofersScreen.screen unit)
  _ <- case output of
    NewCard -> runScreen (GrofersNewCardScreen.screen unit)
    ViewNetBanks -> runScreen (GrofersSelectBankScreen.screen (GrofersSelectBankScreenState {banks : mapOfBankAndIIN}))
    ChooseUPI -> runScreen (GrofersSelectUPIScreen.screen unit)
  pure unit

stockApp :: Flow Unit
stockApp = unsafePartial $ do
  _ <- runScreen (StockScreen.screen unit)
  pure unit

olaApp :: Flow Unit
olaApp = unsafePartial $ do
  _ <- runScreen (OlaScreen.screen unit)
  pure unit

bigBasketNetBanking :: FlowBT PaymentPageError Unit 
bigBasketNetBanking = do 
  _ <- liftFlowBT $ liftFlow $ setScreen "BigBasketNetBankingScreen"
  result <- liftRunScreen BackPoint $ BigBasketNetBankingScreen.screen $ BBNetBankingScreenState {banks : mapOfBankAndIIN}
  pure unit

bigBasketWallet :: FlowBT PaymentPageError Unit 
bigBasketWallet = do 
  _ <- liftFlowBT $ liftFlow $ setScreen "BigBasketWalletScreen"
  result <- liftRunScreen BackPoint $ BigBasketWalletScreen.screen $ WalletScreenState {amount : "1234"}
  pure unit 

bigBasketCvv :: FlowBT PaymentPageError Unit 
bigBasketCvv = do
  _ <- liftFlowBT $ liftFlow $ setScreen "BigBasketCvvScreen"
  output <- liftRunScreen BackPoint $ CvvScreen.screen $ BigBasketCvvScreenState { 
        amount : "1400" 
        , bankName : "Kotak Credit Card" 
        , cardNumber : "5000 **** **** 1234" 
        , offer : "Applied offer - Rs 100 Cashback will be credited your card in 7 days"
        , bankIcon : "bank_kotak" 
        , keyBoardClearIcon : "ic_keyboard_back" 
        , keyBoardProceedIcon : "ic_keyboard_enter" 
        , cardTypeIcon : "bb_visa_logo"
    }  
  case output of 
    ShowSuccess -> bigBasketPaymentSuccessful
    _ -> pure unit 
  -- pure unit

bigBasketPaymentSuccessful :: FlowBT PaymentPageError Unit
bigBasketPaymentSuccessful =  do
  _ <- liftFlowBT $ liftFlow $ setScreen "BigBasketPaymentSuccessful"
  output <- liftRunScreen BackPoint $ PaymentSuccessful.screen $ BigBasketPaymentSuccessfulState {
          amount : "1300.0"
        , paymentStatus : "Payment Successful! "
        , paymentStatusIcon : "payment_successful"
      }
  pure unit

bigBasketApp' :: FlowBT PaymentPageError Unit
bigBasketApp' = do
  _ <- liftFlowBT $ liftFlow $ setScreen "BigBasketScreen"
  result <- liftRunScreen BackPoint $ BigBasketScreen.screen $ BigBasketScreenState
              { amount: "1142"
              , preferredOptions: []
              , orderAmount: "60"
              , bbWalletAmount: "6.90"
              , savedOptionDetails:
                  [ SavedOptionDetails 
                      { savedOptionIcon: "ic_phonepe"
                      , savedOptionName: "Phone Pe"
                      , savedOptionDetails: "ravikumar@ybl"
                      , savedOptionTypeIcon: ""
                      , savedOptionOfferText: "instant discount (30%) max ₹ 200"
                      , savedOptionIconWidth: (V 32)
                      , tickIcon: "bb_tick_deselected"
                      }
                  , SavedOptionDetails 
                      { savedOptionIcon: "bb_mobikwik_wallet"
                      , savedOptionName: "Mobikwik Wallet"
                      , savedOptionDetails: "Balance ₹800"
                      , savedOptionTypeIcon: "bb_visa_logo"
                      , savedOptionOfferText: "Cashback (10%) upto ₹200"
                      , savedOptionIconWidth: (V 24)
                      , tickIcon: "bb_tick_deselected"
                      }
                  , SavedOptionDetails
                      { savedOptionIcon: "bank_axis"
                      , savedOptionName: "Axis Credit Card"
                      , savedOptionDetails: "5001 **** **** 1234"
                      , savedOptionTypeIcon: ""
                      , savedOptionOfferText: ""
                      , savedOptionIconWidth:  (V 48)
                      , tickIcon: "bb_tick_deselected"
                      }
                  ]
              }
    
  case result of
    BBDefaultOption -> do 
      cvvOutput <- bigBasketCvv 
      pure unit 
    BBNetBanking -> do 
      netBankingOutput <- bigBasketNetBanking
      pure unit 
    BBPayzapp -> do 
      walletsoutput <- bigBasketWallet 
      pure unit 
    BBNone -> pure unit
    _ -> pure unit



bigBasketApp :: Flow Unit
bigBasketApp = do
  _ <- liftFlow $ setScreen "BigBasketScreen"
  output <- runExceptT $ runBackT $ liftRunScreen NoBack $ (BigBasketScreen.screen (BigBasketScreenState {
          amount : "1,142"
        , preferredOptions : []
        , orderAmount : "60"
        , bbWalletAmount : "6.90"
        , savedOptionDetails : [
              SavedOptionDetails 
                { savedOptionIcon : "ic_phonepe"
                , savedOptionName : "Phone Pe"
                , savedOptionDetails : "ravikumar@ybl"
                , savedOptionTypeIcon : ""
                , savedOptionOfferText : "instant discount (30%) max ₹ 200"
                , savedOptionIconWidth : (V 32)
                , tickIcon : "bb_tick_deselected"
                }
            , SavedOptionDetails 
                { savedOptionIcon : "bb_mobikwik_wallet"
                , savedOptionName : "Mobikwik Wallet"
                , savedOptionDetails : "Balance ₹800"
                , savedOptionTypeIcon : "bb_visa_logo"
                , savedOptionOfferText : "Cashback (10%) upto ₹200"
                , savedOptionIconWidth : (V 24)
                , tickIcon : "bb_tick_deselected"
                }
            , SavedOptionDetails
                { savedOptionIcon : "bank_axis"
                , savedOptionName : "Axis Credit Card"
                , savedOptionDetails : "5001 **** **** 1234"
                , savedOptionTypeIcon : ""
                , savedOptionOfferText : ""
                , savedOptionIconWidth :  (V 48)
                , tickIcon : "bb_tick_deselected"
                }
          ]
      }))   -- todo have to use flowbt to acess output
  -- _ <- case output of 
  --   (PreferredOptionID 0) ->  bigBasketCvv
  --   _ -> pure unit 
  pure unit


bigBasketOtp :: Flow Unit
bigBasketOtp = do
  output <- runScreen (BigBasketOtpScreen.screen (BigBasketOtpScreenState {
          amount : "1300.0"
      }))
  pure unit



appFlow :: Boolean -> Flow Unit
appFlow recreated = do
  _ <- initUI 
  -- _ <- runExceptT $ runBackT $ bigBasketApp'
  -- _ <- pure $ logAny "after screen"
  -- _ <- bigBasketCvv
  -- _ <- spiceJetApp
  -- _ <- bigBasketOtp
  -- _ <- bigBasketPaymentSuccessful
  _ <- runApp
  exitSDK "" 0 --todo add sdk result

-- appFlow :: Boolean -> Flow Unit
-- appFlow recreated = do
--   _ <- initUI *> runApp
--   pure unit
