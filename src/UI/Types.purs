module UI.Types where
import UI.Components.Config.ToolBar as ToolBar
import UI.Components.Config.Offers as Offers 
import PrestoDOM

data GrofersScreenOutput = NewCard | ViewNetBanks | ChooseUPI

newtype NetBank = NetBank
    { name :: String
    , iin :: String
    }

newtype GrofersSelectBankScreenState = GrofersSelectBankScreenState
    { banks :: Array NetBank
    }

newtype BBNetBankingScreenState = BBNetBankingScreenState
    { banks :: Array NetBank
    }

newtype VodaSelectBankScreenState = VodaSelectBankScreenState
    { banks :: Array NetBank
    }

newtype SavedOptionDetails = SavedOptionDetails 
    { savedOptionIcon ::  String
    , savedOptionName ::  String 
    , savedOptionDetails ::  String 
    , savedOptionTypeIcon ::  String 
    , savedOptionOfferText ::  String
    , savedOptionIconWidth ::  Length
    , tickIcon :: String 
    }

newtype BigBasketScreenState = BigBasketScreenState
    { amount :: String
    , preferredOptions :: Array String
    , orderAmount :: String 
    , bbWalletAmount :: String
    , savedOptionDetails :: Array SavedOptionDetails 
    }

newtype BigBasketOtpScreenState = BigBasketOtpScreenState
    { amount :: String
    }



newtype BigBasketCvvScreenState = BigBasketCvvScreenState 
    { amount :: String 
    , bankName :: String 
    , cardNumber :: String 
    , offer :: String 
    , bankIcon :: String 
    , keyBoardClearIcon :: String 
    , keyBoardProceedIcon :: String 
    , cardTypeIcon :: String 
    }

newtype BigBasketPaymentSuccessfulState = BigBasketPaymentSuccessfulState
    { paymentStatus :: String 
    , paymentStatusIcon :: String
    , amount :: String
    }

data BigBasketCvvScreenOutput = CvvEntered
    | ShowSuccess 
    | GoBackFromBBCvvScreen

data BigBasketScreenOutput = BBPayNow 
    | BBDefaultOption 
    | BBCreditDebit 
    | BBAirtelMoney 
    | BBPayzapp 
    | BBWallet 
    | BBUPI 
    | BBNetBanking 
    | BBEasyEmi 
    | BBPayLater 
    | BBCOD 
    | BBNone
    | GoBackFromBigBasketScreen

data BigBasketNetBankingScreenOutput = GoBackFromBBNetBankingScreeen

data BigBasketOtpScreenOutput = GoBackFromBBOtpScreen 

data BigBasketPaymentSuccessfulOutput = GoBackFromBBPaymentSuccessful 

data WalletScreenOutput = GoBackFromBBWalletScreen 

