module UI.Merchants.Jio.Config where

import Prelude
import PrestoDOM
import UI.Components.Config.ToolBar as ToolBar
import UI.Components.Config.AmountView as AmountView
import UI.Components.Config.PaymentOptions as PaymentOptions
import UI.Components.Config.PaymentOptionsV2 as PaymentOptionsV2
import UI.Components.Config.AddCardV2 as AddCardV2
import UI.Components.Config.EditTextV2 as EditTextV2
import UI.Components.Config.EditText as EditText
import UI.Components.Config.PrimaryButton as PrimaryButton 
import UI.Components.Config.SecondaryButton as SecondaryButton 
import UI.Components.Config.BankListItem as BankListItem 
import UI.Components.Config.BankListItem (Direction(..)) 
import Utils


-- screenFont = "Roboto-Bold"
-- screenFont = "Roboto-Italic"
screenFont = "Roboto-Regular"

toolBarConfigJio = let
    ToolBar.Config config = ToolBar.defConfig
    toolBarConfig = config 
        { background = "#214796" 
        -- { background = "#000000"
        , text = "Recharge"
        , padding = (Padding 40 0 0 0)
        , imageUrl = "toolbar_back_arrow"
        , font = screenFont
        }
    in (ToolBar.Config toolBarConfig)

amountConfigJio :: AmountView.Config
amountConfigJio = let
    AmountView.Config config = AmountView.defConfig
    amountConfig = config
        { text = "₹19.00"
        , background = "#2A3890"
        , gravity = RIGHT
        , color = "#ffffff"
        , textSize = 18
        , headingColor = "#ffffff"
        , headingText = "Total Amount"
        , amountVisibility = GONE
        , height = if (os == "ANDROID") then WRAP_CONTENT else V $ (getLabelHeight "₹19.00" screenFont 18 (getLabelWidth "₹19.00" screenFont 18 0 0) 0)
        , headingHeight = if (os == "ANDROID") then WRAP_CONTENT else V $ (getLabelHeight "Total Amount" screenFont 18 (getLabelWidth "Total Amount" screenFont 18 0 0) 0)
        , width = V 0
        , headingWidth = V 0
        , pipeVisibility = VISIBLE
        , padding = (Padding 10 5 10 5)
        , font = screenFont
        }
    in (AmountView.Config amountConfig)

amountV2ConfigJio :: AmountView.Config
amountV2ConfigJio = let
    AmountView.Config config = AmountView.defConfig
    amountConfig = config
        { text = "₹"
        , width = if (os == "ANDROID") then WRAP_CONTENT else V $ (getLabelWidth "₹" screenFont 18 0 0)
        , weight = 0.0
        , textSize = 18
        , amountTextSize = 22
        , color = "#000000"
        , headingColor = "#0d479e"
        , height = if (os == "ANDROID") then WRAP_CONTENT else V $ (getLabelHeight "₹" screenFont 18 (getLabelWidth "₹" screenFont 18 0 0) 0)
        , headingHeight = if (os == "ANDROID") then WRAP_CONTENT else V $ (getLabelHeight "Payment Amount: " screenFont 18 (getLabelWidth "Payment Amount: " screenFont 18 0 0) 0)
        , amountHeight = if (os == "ANDROID") then WRAP_CONTENT else V $ (getLabelHeight "19.00" screenFont 18 (getLabelWidth "19.00" screenFont 18 0 0) 0)
        , margin = (Margin 20 10 20 8)
        , padding = (Padding 40 0 40 0)
        , cornerRadius = 8.0
        , background = "#bbdefb"
        , amountColor = "#0d479e"
        , headingText = "Payment Amount: "
        , headingWidth = V 0
        , amountText = "19.00"
        , amountTypeface = BOLD
        , font = screenFont
        }
    in (AmountView.Config amountConfig)

addCardConfigJio :: AddCardV2.Config
addCardConfigJio = let
    AddCardV2.Config config = AddCardV2.defConfig
    addCardConfig = config
        { height = MATCH_PARENT
        -- , background = "#E0E0E0"
        , padding = (Padding 0 0 0 10)
        , margin = (Margin 0 0 0 0)
        , cornerRadius = 5.0
        , font = screenFont
        }
    in (AddCardV2.Config addCardConfig)

jioPhonepeConfig = let
    PaymentOptionsV2.Config config = PaymentOptionsV2.defConfig
    cardConfig = config
        { amount = "Pay"
        , imageUrl = "paymentoption_phonepe"
        , headingText = "PhonePe"
        , headingHeight = V 30
        , height = V 50
        , parentPadding = (Padding 0 0 0 0)
        , imageWidth = V 50
        , amountGravity = CENTER
        , amountColor = "#253185"
        , amountStroke = "1,#253185"
        , amountCornerRadius = 20.0
        , id = "4"
        , font = screenFont
        }
    in (PaymentOptionsV2.Config cardConfig)

jioPaytmConfig = let
    PaymentOptionsV2.Config config = PaymentOptionsV2.defConfig
    cardConfig = config
        { amount = "Pay"
        , imageUrl = "paymentoption_paytm"
        , headingText = "Paytm"
        , headingHeight = V 30
        , height = V 50
        , parentPadding = (Padding 0 0 0 0)
        , imageWidth = V 50
        , amountGravity = CENTER
        , amountColor = "#253185"
        , amountStroke = "1,#253185"
        , amountCornerRadius = 20.0
        , lineSeparaterVisibility = VISIBLE
        , id = "3"
        , font = screenFont
        }
    in (PaymentOptionsV2.Config cardConfig)

jioUpiConfig = let
    PaymentOptionsV2.Config config = PaymentOptionsV2.defConfig
    cardConfig = config
        { amount = "Pay"
        , imageUrl = "ic_upi"
        , headingText = "UPI"
        , headingHeight = V 30
        , height = V 50
        , parentPadding = (Padding 0 0 0 0)
        , imageWidth = V 50
        , amountGravity = CENTER
        , amountColor = "#253185"
        , amountStroke = "1,#253185"
        , amountCornerRadius = 20.0
        , id = "1"
        , font = screenFont
        }
    in (PaymentOptionsV2.Config cardConfig)
 
jioMoneyConfig = let
    PaymentOptionsV2.Config config = PaymentOptionsV2.defConfig
    cardConfig = config
        { amount = "Pay"
        , imageUrl = "ic_jiomoney"
        , headingText = "JioMoney"
        , headingHeight = V 30
        , height = V 50
        , parentPadding = (Padding 0 0 0 0)
        , imageWidth = V 50
        , amountGravity = CENTER
        , amountColor = "#253185"
        , amountStroke = "1,#253185"
        , amountCornerRadius = 20.0
        , lineSeparaterVisibility = VISIBLE
        , id = "2"
        , font = screenFont
        }
    in (PaymentOptionsV2.Config cardConfig)
 

jioCredit = let
    PaymentOptions.Config config = PaymentOptions.defConfig
    jioConfig = config 
        { text = "Credit Card"
        , checkBoxVisibility = VISIBLE
        , lineSeparaterColor = ""
        , id = "1"
        , font = screenFont
        }
    in (PaymentOptions.Config jioConfig)

jioDebit = let
    PaymentOptions.Config config = PaymentOptions.defConfig
    jioConfig = config 
        { text = "Debit Card"
        , checkBoxVisibility = VISIBLE
        , lineSeparaterColor = ""
        , id = "2"
        , font = screenFont
        }
    in (PaymentOptions.Config jioConfig)

jioNet = let
    PaymentOptions.Config config = PaymentOptions.defConfig
    jioConfig = config 
        { text = "Net Banking"
        , checkBoxVisibility = VISIBLE
        , lineSeparaterColor = ""
        , id = "3"
        , font = screenFont
        }
    in (PaymentOptions.Config jioConfig)

jioPayButton = let
    PrimaryButton.Config config = PrimaryButton.defConfig
    parimaryPayConfig = config 
        { text =  "Make Payment"
        , background =  "#F0C351"
        , color =  "#000000"
        , margin =  (Margin 0 20 0 0)
        , cornerRadius =  5.0
        , font = screenFont
        }
    in (PrimaryButton.Config parimaryPayConfig)

jioBankListItem :: BankListItem.Config
jioBankListItem = let
    BankListItem.Config defConfig = BankListItem.defConfig
    config = defConfig 
        { background = "#ffffff"
        , radioDirection = Right
        , radioInnerColor = "#ffffff"--"#03A9F4"
        , radioOuterColor = "#a1a1a1"
        , bankImageSize = 36
        , bankImageVisible = GONE
        , bankTextColor = "#757575"--"#a1a1a1"
        , bankTextSize = 18
        , bankTextFont = "Arial"
        , arrowImage = "arrowimg"
        , arrowVisible = GONE
        , cardHeight = 60
        , orientation = HORIZONTAL
        , font = screenFont
        }
    in (BankListItem.Config config)

jioWalletEditText :: EditTextV2.Config
jioWalletEditText = let
    EditTextV2.Config config = EditTextV2.defConfig
    editTextConfig = config
      { lineSeparatorHeight = 1
      , lineSeparatorColor = "#aaaaaa"
      , lineSeparatorMargin = (Margin 32 0 32 0)
      , hintOutOfEditText = false
      , hint = "8889250288"
      , textColor = "#797877"
      , tickVisibility = GONE
      , iconUrl = ""
      , editTextPadding = (Padding 8 0 8 0)
      , gravity = CENTER
      , textSize = 22
      , font = screenFont
      }
    in (EditTextV2.Config editTextConfig)

jioSubmitButton = let
    PrimaryButton.Config config = PrimaryButton.defConfig
    primarySubmitConfig = config 
        { text =  "Submit"
        , background =  "#253185"
        , color =  "#ffffff"
        , margin =  (Margin 32 20 32 0)
        , cornerRadius =  0.0
        , height = V 45
        , font = screenFont
        }
    in (PrimaryButton.Config primarySubmitConfig)

jioSubmitSecondaryButton = let
    SecondaryButton.Config config = SecondaryButton.defConfig
    secondarySubmitConfig = config 
        { background = "#253185"
        , width = V 200
        , height = V 40
        , cornerRadius = 0.0
        , text = "Submit"
        , font = screenFont
        }
    in (SecondaryButton.Config secondarySubmitConfig)

jioVpaEditText:: EditText.Config 
jioVpaEditText = let
    EditText.Config config = EditText.defConfig
    editTextConfig = config
		{ rowHeight = V 50
        , parentHeight = V 50
        , hint = "eg. abc@psp"
        , visibility = GONE
        , rowStroke = "1,#bdbdbd"
        , rowCornerRadius = 3.0
        , rowPadding = (Padding 4 0 4 0)
        , inputType = TypeText
        , imageVisibility = GONE
        , parentMargin = (Margin 0 0 0 0)
        , font = screenFont
      	}
    in (EditText.Config editTextConfig)