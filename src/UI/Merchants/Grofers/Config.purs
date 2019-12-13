module UI.Merchants.Grofers.Config where

import Prelude
import PrestoDOM
import UI.Components.Config.ToolBar as ToolBar
import UI.Components.Config.AmountView as AmountView
import UI.Components.Config.PaymentOptions as PaymentOptions
import UI.Components.Config.PaymentOptionsV2 as PaymentOptionsV2
import UI.Components.Config.AddCard as AddCard
import UI.Components.Config.PopularBanks as PopularBanks
import UI.Components.Config.SearchBox as SearchBox
import UI.Components.Config.BankListItem as BankListItem
import UI.Components.Config.SavedCard as SavedCard
import Utils


-- screenFont = "Roboto-Regular"
screenFont = "Roboto-Bold"

toolBarConfigGrofers = let
    ToolBar.Config config = ToolBar.defConfig
    toolBarConfig = config 
      { background = "#1C2224"
      , text =  "Payment Options"
      , padding = (Padding 30 0 0 0 )
      , imageUrl = "toolbar_arrow_back_white"
      , secondaryTextVisible = GONE
      , font  = screenFont
      }
    in (ToolBar.Config toolBarConfig)

amountConfigGrofers :: AmountView.Config
amountConfigGrofers = let
    AmountView.Config config = AmountView.defConfig
    amountConfig = config
      { text = "(Incl. of all taxes)"
      , headingTextSize = 18
      , headingWidth = if (os == "ANDROID") then WRAP_CONTENT else V $ (getLabelWidth "Amount Payable" screenFont 18 0 0)
      , headingWeight = 0.0
      , height = if (os == "ANDROID") then WRAP_CONTENT else V $ (getLabelHeight "(Incl. of all taxes)" screenFont 18 (getLabelWidth "(Incl. of all taxes)" screenFont 18 0 0) 0)
      , headingHeight = if (os == "ANDROID") then WRAP_CONTENT else V $ (getLabelHeight "Amount Payable" screenFont 18 (getLabelWidth "Amount Payable" screenFont 18 0 0) 0)
      , amountHeight = if (os == "ANDROID") then WRAP_CONTENT else V $ (getLabelHeight "₹308" screenFont 18 (getLabelWidth "₹308" screenFont 18 0 0) 0)
      , width = V 0
      , amountText = "₹308"
      , padding = (Padding 10 5 10 5)
      , margin = (Margin 0 0 0 0)
      , font  = screenFont
      }
    in (AmountView.Config amountConfig)


grofersPaytmPO = let
    PaymentOptions.Config config = PaymentOptions.defConfig
    options = config 
      { bankIconUrl = "ic_paytm"
      , text = "Paytm"
      , rightArrowUrl = "ic_arrow_right"
      , offerText = "Rs. 300 Paytm CBI Min 2 Txn. of Rs. 1500 each! Valid till 31st October"
      , cardHeight = V 84
      , font  = screenFont
      }
    in (PaymentOptions.Config options)

grofersPhonePePO = let
    PaymentOptions.Config config = PaymentOptions.defConfig
    options = config 
      { bankIconUrl = "paymentoption_phonepe"
      , text = "PhonePe"
      , rightArrowUrl = "ic_arrow_right"
      , font  = screenFont
      }
    in (PaymentOptions.Config options)

grofersNewCard = let
    PaymentOptions.Config config = PaymentOptions.defConfig
    options = config 
      { bankIconUrl = "ic_card"
      , text = "Use New Card"
      , rightArrowUrl = "ic_arrow_right"
      , font  = screenFont
      }
    in (PaymentOptions.Config options)

grofersUPIPO = let
    PaymentOptions.Config config = PaymentOptions.defConfig
    options = config 
      { bankIconUrl = "ic_upi"
      , text = "UPI"
      , rightArrowUrl = "ic_arrow_right"
      , font  = screenFont
      }
    in (PaymentOptions.Config options)

newCardConfig = let
    AddCard.Config defConfig = AddCard.defConfig
    config = defConfig
      { height = MATCH_PARENT
      , stroke = "0,#ffffff"
      , imageUrl = ""
      , widthCvv = V 0
      , widthDate = V 30
      , editTextCardConfigV2 = grofersCardNumberEditText
      , editTextNameConfigV2 = grofersCardNameEditText
      , editTextDateConfigV2 = grofersCardDateEditText
      , editTextCvvConfigV2 = grofersCardCvvEditText
      , version = 2
      , padding = (Padding 0 0 0 0)
      , margin = (Margin 20 10 20 10)
      , font  = screenFont
      }
    in (AddCard.Config config)

grofersCardNumberEditText :: AddCard.EditTextConfigV2
grofersCardNumberEditText = let
    AddCard.EditTextConfigV2 config = AddCard.defEditTextConfigV2
    editTextConfig = config
      { lineSeparatorHeight = 1
      , lineSeparatorColor = "#aaaaaa"
      , hintOutOfEditText = false
      , hint = "Card Number"
      , textColor = "#797877"
      , tickVisibility = VISIBLE
      , iconUrl = "ic_card"
      , iconWidth = V 40
      , iconHeight = MATCH_PARENT
      , editTextPadding = (Padding 8 0 8 0)
      , margin = (Margin 0 0 0 16)
      , font  = screenFont
      }
    in (AddCard.EditTextConfigV2 editTextConfig)

grofersCardNameEditText :: AddCard.EditTextConfigV2
grofersCardNameEditText = let
    AddCard.EditTextConfigV2 config = AddCard.defEditTextConfigV2
    editTextConfig = config
      { lineSeparatorHeight = 1
      , lineSeparatorColor = "#aaaaaa"
      , hintOutOfEditText = false
      , hint = "Nickname (Optional)"
      , textColor = "#797877"
      , tickVisibility = VISIBLE
      , iconUrl = ""
      , editTextPadding = (Padding 8 0 8 0)
      , inputType = TypeText
      , margin = (Margin 0 0 0 16)
      , font  = screenFont
      }
    in (AddCard.EditTextConfigV2 editTextConfig)

grofersCardDateEditText :: AddCard.EditTextConfigV2
grofersCardDateEditText = let
    AddCard.EditTextConfigV2 config = AddCard.defEditTextConfigV2
    editTextConfig = config
      { lineSeparatorHeight = 1
      , lineSeparatorColor = "#aaaaaa"
      , hintOutOfEditText = false
      , hint = "mm/yy (Valid Thru)"
      , textColor = "#797877"
      , tickVisibility = VISIBLE
      , iconUrl = ""
      , editTextPadding = (Padding 8 0 8 0)
      , font  = screenFont
      }
    in (AddCard.EditTextConfigV2 editTextConfig)

grofersCardCvvEditText :: AddCard.EditTextConfigV2 
grofersCardCvvEditText = let
    AddCard.EditTextConfigV2 config = AddCard.defEditTextConfigV2
    editTextConfig = config
      { lineSeparatorHeight = 1
      , lineSeparatorColor = "#aaaaaa"
      , hintOutOfEditText = false
      , hint = "CVV"
      , textColor = "#797877"
      , tickVisibility = VISIBLE
      , iconUrl = ""
      , editTextPadding = (Padding 8 0 8 0)
      , margin = (Margin 30 0 0 0)
      , font  = screenFont
      }
    in (AddCard.EditTextConfigV2 editTextConfig)

popularBanksConfig :: PopularBanks.Config
popularBanksConfig =  let
    PopularBanks.Config defConfig = PopularBanks.defConfig 
    config = defConfig 
        { parentMargin = (Margin 0 0 0 0)
        , textColor = "#000000"
        , textAllCaps = true
        , rowMargin = (Margin 10 0 5 0)
        , imageWidth = V 40
        , imageHeight = V 40
        , isFormVisible = true
        , cellMargin = (Margin 0 0 10 0)
        , cellStroke = "1,#e1e1e1"
        , cellCornerRadius = 1.0
        , cellPadding = (Padding 10 10 10 10)
        , cellHeight = V 80
        , rowHeight = V 100
        , textSize = 16
        , bankNameVisibility = GONE
        , font  = screenFont
        }
    in (PopularBanks.Config config)

searchBoxConfig = let
  SearchBox.Config defConfig = SearchBox.defConfig
  config = defConfig 
    { hint = "Search Banks"
    , searchIconVisibility = VISIBLE          
    , tickVisibility = GONE
    , lineVisibility = GONE
    , searchIconMargin = (Margin 10 0 0 0)
    , searchIconSize = V 18
    , textSize = 18
    , height = MATCH_PARENT
    , cornerRadius = 4.0
    , font  = screenFont
    }
  in (SearchBox.Config config)

bankListItemConfig = let
  BankListItem.Config defConfig = BankListItem.defConfig
  config = defConfig 
    { bankTextSize = 16
    , bankImageSize = 36
    , arrowImage = "ic_arrow_right"
    , cardHeight = 80
    , dividerVisibility = VISIBLE
    , font  = screenFont
    }
  in (BankListItem.Config config)

googlePlayPO = let
  PaymentOptions.Config defConfig = PaymentOptions.defConfig
  config = defConfig
    { bankIconUrl = "payoption_tez"
    , text = "Google Play"
    , id = "1"
    , font  = screenFont
    }
  in (PaymentOptions.Config config)

googleBHIMPO = let
  PaymentOptions.Config defConfig = PaymentOptions.defConfig
  config = defConfig
    { bankIconUrl = "ic_upi"
    , text = "BHIM"
    , id = "2"
    , font  = screenFont
    }
  in (PaymentOptions.Config config)

googlePhonePePO = let
  PaymentOptions.Config defConfig = PaymentOptions.defConfig
  config = defConfig
    { bankIconUrl = "paymentoption_phonepe"
    , text = "PhonePe"
    , id = "1"
    , font  = screenFont
    }
  in (PaymentOptions.Config config)

grofersSavedCardConfig = let
  SavedCard.Config config = SavedCard.defConfig
  savedCardConfig = config
    { cardHeight = V 70
    , cardPadding = Padding 30 10 10 10
    , cardTypeImage = "add_new_card_jio_visa"
    , cardText = "Harsh Garg"
    , cardNumber = "4143-XXXXXXXX-3042"
    , cardNumberColor = "#aaaaaa"
    , cardNumberSize = 16
    , popup = "dot_menu_orange"
    }
  in (SavedCard.Config savedCardConfig)