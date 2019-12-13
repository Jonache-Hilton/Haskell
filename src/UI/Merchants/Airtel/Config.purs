module UI.Merchants.Airtel.Config where

import Prelude
import PrestoDOM

import UI.Components.Config.BankListItem (Direction(..))
import UI.Components.Config.BankListItem as BankListItem
import UI.Components.Config.AmountView as AmountView
import UI.Components.Config.PaymentOptionsV2 as PaymentOptionsV2
import UI.Components.Config.PaymentOptions as PaymentOptions
import UI.Components.Config.PopularBanks as PopularBanks
import UI.Components.Config.PrimaryButton as PrimaryButton
import UI.Components.Config.SecondaryButton as SecondaryButton
import UI.Components.Config.SearchBox as SearchBox
import UI.Components.Config.ToolBar as ToolBar
import UI.Components.Config.AddCard as AddCard
import UI.Merchants.Airtel.Controller.AirtelScreen (Action(..))
import Utils

-- screenFont = "Roboto-Regular"
screenFont = "Roboto-Bold"

toolBarConfigAirtel :: ToolBar.Config
toolBarConfigAirtel = let
    ToolBar.Config config = ToolBar.defConfig
    toolBarConfig = config 
        { background = "#ED3833" 
        , text =  "Select payment option"
        , padding = (Padding 10 0 0 0 )
        , imageUrl =  "toolbar_arrow_back_white" 
        , font = screenFont
        }
    in (ToolBar.Config toolBarConfig)

searchBoxConfigAirtel :: SearchBox.Config
searchBoxConfigAirtel = let
    SearchBox.Config config = SearchBox.defConfig
    searchBoxConfig = config 
        { hint = "Search your bank"
        , searchIconVisibility = VISIBLE 
        , tickVisibility = GONE
        , lineVisibility = VISIBLE
        , searchIconAlpha = 0.4
        , searchIconMargin = (Margin 10 0 5 0)
        , height = V 52
        , padding = Padding 10 0 10 0
        , searchIconSize = V 20
        , textSize = 20
        , font = screenFont
        }
    in (SearchBox.Config searchBoxConfig)

primarybuttonConfigAirtel :: PrimaryButton.Config
primarybuttonConfigAirtel = let
    PrimaryButton.Config defConfig = PrimaryButton.defConfig
    config = defConfig 
        { text = "Pay Now"
        , background = "#3FAAF1"
        , cornerRadius = 3.0
        , height = V 40
        , font = screenFont
        }
    in (PrimaryButton.Config config)

primarybuttondisableConfigAirtel :: PrimaryButton.Config
primarybuttondisableConfigAirtel = let
    PrimaryButton.Config defConfig = PrimaryButton.defConfig
    config = defConfig 
        { text =  "Pay Now"
        , background =  "#66BDE6"
        , margin =  (Margin 0 0 0 0)
        , height =  V 45
        , font = screenFont
        }
    in (PrimaryButton.Config config)   

secondaryButtonConfigAirtel :: SecondaryButton.Config
secondaryButtonConfigAirtel = let
    SecondaryButton.Config defConfig = SecondaryButton.defConfig
    config = defConfig 
        {  background = "#3FAAF1"
        , width = V 110
        , height = V 40
        , cornerRadius = 3.0
        , text = "GET OTP"
        , font = screenFont
        }
    in (SecondaryButton.Config config)   

popularBanksConfigAirtel :: PopularBanks.Config
popularBanksConfigAirtel = PopularBanks.defConfig

amountConfigAirtel :: AmountView.Config
amountConfigAirtel = let
    AmountView.Config config = AmountView.defConfig
    amountConfig = config 
        { text =  "₹1.0"
        , gravity =  RIGHT
        , color =  "#000000"
        , textSize =  18
        , headingText =  "Payable Amount"
        , typeface =  BOLD
        , headingTypeface =  BOLD
        , amountVisibility =  GONE
        , height =  V 22    
        , headingHeight = V 22
        , font = screenFont
        , headingWidth = if (os == "ANDROID") then V 0 else V $ (getLabelWidth config.amountText config.font config.amountTextSize 0 0)
        , width = if (os == "ANDROID") then V 0 else V $ (getLabelWidth config.amountText config.font config.amountTextSize 0 0)
        }
    in (AmountView.Config amountConfig)


airtelMoneyConfig = let
    PaymentOptionsV2.Config config = PaymentOptionsV2.defConfig
    cardConfig = config 
        { amount =  "₹ 0.0"
        , text =  "50% Cashback on prepaid recharge of Rs 35 and above. T&C"
        , headingText =  "Airtel Money"
        , imageUrl =  "paymentoption_airtel_money"
        , id = "4"
        , font = screenFont
        }
    in (PaymentOptionsV2.Config cardConfig)

phonepeConfig = let
    PaymentOptionsV2.Config config = PaymentOptionsV2.defConfig
    cardConfig = config 
        { amount =  "₹ 25.0"
        , text =  "20% Cashback on prepaid recharge of Rs 399 and above. T&C"
        , headingText =  "PhonePe"
        , imageUrl =  "paymentoption_phonepe"
        , id = "3"
        , font = screenFont
        }
    in (PaymentOptionsV2.Config cardConfig)
    
paytmConfig = let
    PaymentOptionsV2.Config config = PaymentOptionsV2.defConfig
    cardConfig = config 
        { amount =  "₹ 100.0"
        , text =  "20% Cashback on prepaid recharge of Rs 399 and above. T&C"
        , imageUrl =  "paymentoption_paytm"
        , headingText =  "Paytm"
        , id = "2"
        , font = screenFont
        }
    in (PaymentOptionsV2.Config cardConfig)
    
addCardConfig = let
    PaymentOptionsV2.Config config = PaymentOptionsV2.defConfig
    cardConfig = config
        { amount =  ""
        , text =  "Debit/Credit Card"
        , imageUrl =  "paymentoption_airtel_new_card"
        , headingText =  "New Card"
        , headingHeight =  V 0
        , headingWeight =  1.0
        , discountVisibility =  GONE
        , boxPadding =  (Padding 0 0 0 0)
        , padding =  (Padding 0 0 0 0)
        , gravity =  CENTER_VERTICAL
        , id = "1"
        , font = screenFont
        }
    in (PaymentOptionsV2.Config cardConfig)

airtelNetBankConfig = let
    BankListItem.Config defConfig = BankListItem.defConfig
    config = defConfig 
        { radioDirection = Right
        , radioOuterColor = "#A0A0A0"
        , bankImageVisible = GONE
        , bankTextSize = 18
        , arrowVisible = GONE
        , font = screenFont
        }
    in (BankListItem.Config config)

airtelAddCardConfig = let
    AddCard.Config defConfig = AddCard.defConfig
    config = defConfig 
        { height = MATCH_PARENT
        , cornerRadius = 3.0
        , margin = (Margin 8 8 8 8)
        , padding = (Padding 8 8 8 8)
        , widthCvv = V 0
        , stroke = "1,#BDBDBD"
        , editTextCardConfig = airtelCardNumberEditText
        , editTextNameConfig = airtelCardNameEditText
        , editTextDateConfig = airtelCardDateEditText
        , editTextCvvConfig = airtelCardCvvEditText
        , font = screenFont
        }
    in (AddCard.Config config)

airtelCardNumberEditText:: AddCard.EditTextConfig 
airtelCardNumberEditText = let
    AddCard.EditTextConfig config = AddCard.defEditTextConfig
    editTextConfig = config{
      text = "CARD NO"
      , editTextBackground = "#f5f5f5"
      , hint = "xxxx xxxx xxxx xxxx"
      , imageUrl = "addcard_airtel_card_icon"
      , parentMargin = (Margin 10 10 10 10)
      , font = screenFont
      }
    in (AddCard.EditTextConfig editTextConfig)

airtelCardNameEditText:: AddCard.EditTextConfig 
airtelCardNameEditText = let
    AddCard.EditTextConfig config = AddCard.defEditTextConfig
    editTextConfig = config{
      text = "NAME ON CARD"
      , editTextBackground = "#f5f5f5"
      , hint = "NAME ON CARD"
      , imageVisibility = GONE
      , inputType = TypeText
      , font = screenFont
      }
    in (AddCard.EditTextConfig editTextConfig)

airtelCardDateEditText:: AddCard.EditTextConfig 
airtelCardDateEditText = let
    AddCard.EditTextConfig config = AddCard.defEditTextConfig
    editTextConfig = config{
      text = "EXPIRY DATE"
      , editTextBackground = "#f5f5f5"
      , hint = "MM/YY"
      , imageVisibility = GONE
      , font = screenFont
      }
    in (AddCard.EditTextConfig editTextConfig)

airtelCardCvvEditText:: AddCard.EditTextConfig 
airtelCardCvvEditText = let
    AddCard.EditTextConfig config = AddCard.defEditTextConfig
    editTextConfig = config{
      text = "CVV"
      , editTextBackground = "#f5f5f5"
      , hint = "CVV"
      , imageVisibility = GONE
      , parentMargin = (Margin 0 0 10 10)
      , font = screenFont
      }
    in (AddCard.EditTextConfig editTextConfig)