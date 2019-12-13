module UI.Merchants.Ola.Config where

import Prelude
import PrestoDOM
import UI.Components.Config.ToolBar as ToolBar
import UI.Components.Config.AmountView as AmountView
import UI.Components.Config.PaymentOptions as PaymentOptions
import UI.Components.Config.PaymentOptionsV2 as PaymentOptionsV2
import UI.Components.Config.AddCard as AddCard
import UI.Components.Config.PopularBanks as PopularBanks
import UI.Components.Config.SecondaryButton as SecondaryButton
import UI.Components.Config.PrimaryButton as PrimaryButton
import UI.Components.Config.SavedCard as SavedCard
import Utils


-- screenFont = "Roboto-Regular"
screenFont = "Roboto-Bold"

toolBarOla = let
    ToolBar.Config config = ToolBar.defConfig
    toolbar = config 
        { background = "#FFFFFF"
        , text = "Clear Ola Credit"
        , padding = (Padding 20 0 0 0 )
        , imageUrl = "toolbar_ola_back_arrow" 
        , textColor = "#000000"
        , typeface = BOLD
        , translationY = (-10.0)
        , translationZ = 20.0
        , font = screenFont
        }
    in (ToolBar.Config toolbar)

amountView = let
    AmountView.Config config = AmountView.defConfig
    summaryConfig = config 
        { heightParent = V 100
        , text = "₹360"
        , color = "#000000"
        , textSize = 48
        , gravity = CENTER
        , headingHeight = if (os == "ANDROID") then WRAP_CONTENT else V $ (getLabelHeight "Amount Payable" screenFont 18 (getLabelWidth "Amount Payable" screenFont 18 0 0) 0)
        , headingWidth = if (os == "ANDROID") then WRAP_CONTENT else V $ (getLabelWidth "Amount Payable" screenFont 18 0 0)
        , height = V 300
        , headingWeight = 0.0
        , headingTextSize = 16
        , amountVisibility = GONE
        , orientation = VERTICAL
        , margin = (Margin 0 0 0 0)
        , font = screenFont
        }
    in (AmountView.Config summaryConfig)

addCardConfig = let
    AddCard.Config defConfig = AddCard.defConfig
    config = defConfig 
        { height = MATCH_PARENT
        , stroke = "0,#ffffff"
        , widthCvv = V 0
        , imageUrl = ""
        , padding = (Padding 10 10 10 10)
        , editTextCardConfigV2 = olaCardNumberEditText
        , editTextNameConfigV2 = olaCardNameEditText
        , editTextDateConfigV2 = olaCardDateEditText
        , editTextCvvConfigV2 = olaCardCvvEditText
        , version = 2
        , font = screenFont
        }
    in (AddCard.Config config)

olaCardNumberEditText:: AddCard.EditTextConfigV2
olaCardNumberEditText = let
    AddCard.EditTextConfigV2 config = AddCard.defEditTextConfigV2
    editTextConfig = config
        { lineSeparatorHeight = 2
        , lineSeparatorColor = "#9A9A9A"
        , hint = "Enter card number"
        , textColor = "#797877"
        , iconUrl = "edittext_ola_all_cards"
        , iconWidth = V 190
        , margin = (Margin 0 0 0 30)
        , font = screenFont
        }
    in (AddCard.EditTextConfigV2 editTextConfig)

olaCardNameEditText:: AddCard.EditTextConfigV2
olaCardNameEditText = let
    AddCard.EditTextConfigV2 config = AddCard.defEditTextConfigV2
    editTextConfig = config
        { visibility = GONE
        , font = screenFont
        }
    in (AddCard.EditTextConfigV2 editTextConfig)

olaCardDateEditText:: AddCard.EditTextConfigV2
olaCardDateEditText = let
    AddCard.EditTextConfigV2 config = AddCard.defEditTextConfigV2
    editTextConfig = config
        { lineSeparatorHeight = (2)
        , lineSeparatorColor = "#9A9A9A"
        , hint = "Expiry date(mm/yy)"
        , textColor = "#797877"
        , iconUrl = ""
        , font = screenFont
        }
    in (AddCard.EditTextConfigV2 editTextConfig)

olaCardCvvEditText:: AddCard.EditTextConfigV2
olaCardCvvEditText = let
    AddCard.EditTextConfigV2 config = AddCard.defEditTextConfigV2
    editTextConfig = config
      { lineSeparatorHeight = 2
      , lineSeparatorColor = "#9A9A9A"
      , hint = "CVV / CVN"
      , textColor = "#797877"
      , iconUrl = "edittext_airtel_cvv"
      , iconHeight = MATCH_PARENT
      , margin = (Margin 10 0 0 0)
      , font = screenFont
      }
    in (AddCard.EditTextConfigV2 editTextConfig)

olaPopularBanksConfig :: PopularBanks.Config
olaPopularBanksConfig =  let
    PopularBanks.Config defConfig = PopularBanks.defConfig 
    config = defConfig 
        { parentMargin = (Margin 0 0 0 0)
        , textColor = "#000000"
        , textAllCaps = true
        , rowMargin = (Margin 0 0 0 0)
        , imageWidth = V 40
        , imageHeight = V 40
        , isFormVisible = true
        , cellMargin = (Margin 0 0 10 0)
        , cellStroke = "1,#e1e1e1"
        , cellCornerRadius = 1.0
        , cellPadding = (Padding 10 10 10 10)
        , cellWidth = V 110
        , cellHeight = V 90
        , rowHeight = V 110
        , textSize = 16
        , rowWidth = V 330
        , font = screenFont
        }
    in (PopularBanks.Config config)

payButtonConfig :: SecondaryButton.Config
payButtonConfig = let
    SecondaryButton.Config defConfig = SecondaryButton.defConfig
    config = defConfig
        { background = "#50AF50"
        , width = V 150
        , height = V 45
        , cornerRadius = 5.0
        , margin = (Margin 110 0 110 0)
        , font = screenFont
        }
    in (SecondaryButton.Config config)

olaSavedCardConfig = let
    SavedCard.Config config = SavedCard.defConfig
    savedCardConfig = config
        { cardPadding = Padding 30 10 10 10
        , radioVisibility = VISIBLE
        , imageMargin = Margin 10 0 10 0
        , cardTypeImage = "add_new_card_jio_visa"
        , cardNumber = "XXXX 9192"
        , cvvHint = "CVV / CVN"
        }
    in (SavedCard.Config savedCardConfig)
