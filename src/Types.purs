module Types where

data ChildAction  =  ButtonClicked  

newtype MainScreenState = MainScreenState {}

data MainScreenStateOutput = Dream11 MainScreenState 
    | Airtel MainScreenState 
    | RedBus MainScreenState 
    | Goibibo MainScreenState 
    | SpiceJet MainScreenState 
    | Jio MainScreenState 
    | BigBasket MainScreenState 
    | Vodafone MainScreenState 
    | Grofers MainScreenState
    | Ola MainScreenState
    | Testing MainScreenState
    | Idea MainScreenState
    | Stock MainScreenState

data Dream11Output = DebitCredit
    | NetBanking
    | Wallets

data ScreenFailure
    = BackPress
data VodafoneScreenOutput = VodaDebitCredit | VodaViewNetBanks

data RedBusOutput = OtherBanks

data GoibiboOutput = GoibiboUpi
    | GoibiboCreditCard
    | GoibiboDebitCard
    | GoibiboNetBanking

data AirtelOutput = GoToAirtelNB | AirtelCard | AirtelWallet

data JioOutput = JioCreditCard
    | JioDebitCard
    | JioUpi

data SavedCardInput = SavedCardInput{
    id :: String,
    cardType :: String, 
    bankName :: String, 
    imageUrl :: String, 
    cardNumber :: String, 
    nameOnCard :: String, 
    expiryDate :: String, 
    isCardVisible :: Boolean
}

newtype WalletScreenState = WalletScreenState
    { amount :: String   
      
    }