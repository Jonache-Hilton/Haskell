module UI.Merchants.Dream11.Config where

import Prelude
import PrestoDOM
import UI.Components.Config.ToolBar as ToolBar
import UI.Components.Config.AmountView as AmountView
import UI.Components.Config.PaymentOptions as PaymentOptions
import UI.Components.Config.PaymentOptionsV2 as PaymentOptionsV2

import UI.Components.Config.AddCard as AddCard
import UI.Components.Config.BankListItem (Direction(..))
import UI.Components.Config.BankListItem as BankListItem
import UI.Components.Config.AmountView as AmountView
import UI.Components.Config.PaymentOptionsV2 as PaymentOptionsV2
import UI.Components.Config.PaymentOptions as PaymentOptions
import UI.Components.Config.PrimaryButton as PrimaryButton
import UI.Components.Config.SecondaryButton as SecondaryButton
import UI.Components.Config.ToolBar as ToolBar
import UI.Components.Config.SearchBox as SearchBox
import UI.Components.Config.SavedCard as SavedCard
import Utils

-- screenFont = "Roboto-Regular"
screenFont = "Roboto-Bold"

toolBarConfigDream11 = let
    ToolBar.Config config = ToolBar.defConfig
    toolBarConfig = config 
        { background = "#C62D29"
        , text = "Payment"
        , padding = (Padding 10 0 0 0 )
        , imageUrl = "toolbar_arrow_back_white"
        , textSize = 18
        , font = screenFont
        }
    in (ToolBar.Config toolBarConfig)

amountConfigDream11 :: AmountView.Config
amountConfigDream11 = let
    AmountView.Config config = AmountView.defConfig
    amountConfig = config { 
        text = "₹1182"
        , heightParent = V 70
        , color = "#000000"
        , textSize = 24
        , typeface = BOLD
        , headingText = "Amount to be added."
        , headingTextSize = 14
        , headingColor = "#aaaaaa"
        , headingHeight = if os == "ANDROID" then WRAP_CONTENT else V 16
        , height = V 0
        , headingWeight = 0.0
        , imageVisibility = VISIBLE
        , imageHeight = MATCH_PARENT
        , imageWidth = V 100
        , imageMargin = (Margin 0 0 0 0)
        , imageUrl = "amountview_dream11_fp_safe_secure"
        , orientation = VERTICAL
        , amountVisibility = GONE
        , font = screenFont
        }
    in (AmountView.Config amountConfig)


dream11DebitPO = let
    PaymentOptions.Config config = PaymentOptions.defConfig
    dream11Config = config 
        { bankIconUrl = "ic_card"
        , text = "Debit / Credit Card"
        , rightArrowUrl = "ic_arrow_right"
        , typeface = BOLD
        , id = "1"
        , background = "#efefef"
        , font = screenFont
        }
    in (PaymentOptions.Config dream11Config)

dream11NetPO = let
    PaymentOptions.Config config = PaymentOptions.defConfig
    dream11Config = config 
        { bankIconUrl = "accountimage"
        , text = "Net Banking"
        , rightArrowUrl = "ic_arrow_right"
        , typeface = BOLD
        , id = "2"
        , background = "#efefef"
        , font = screenFont
        }
    in (PaymentOptions.Config dream11Config)

dream11WalletPO = let
    PaymentOptions.Config config = PaymentOptions.defConfig
    dream11Config = config 
        { bankIconUrl = "ic_card"
        , text = "Wallets"
        , rightArrowUrl = "ic_arrow_right"
        , typeface = BOLD
        , id = "3"
        , background = "#efefef"
        , font = screenFont
        }
    in (PaymentOptions.Config dream11Config)

addCardConfigDream11 = let
    AddCard.Config config = AddCard.defConfig
    addCardConfig = config 
        { height = MATCH_PARENT
        , padding = (Padding 20 20 20 20)
        , stroke = "0,#ffffff"
        , imageUrl = ""
        , widthCvv = V 0
        , background = "#efefef"
        , editTextCardConfigV2 = dream11CardNumberEditText
        , editTextNameConfigV2 = dream11CardNameEditText
        , editTextDateConfigV2 = dream11CardDateEditText
        , editTextCvvConfigV2 =  dream11CardCvvEditText
        , version = 2
        , font = screenFont
        }
    in (AddCard.Config addCardConfig)

primaryPayButtonConfigDream11 = let
    PrimaryButton.Config config = PrimaryButton.defConfig
    parimaryPayConfig = config 
        { text = "SAVE & PROCEED"
        , background = "#C62D29"
        , color = "#ffffff"
        , margin = (Margin 0 10 0 0)
        , cornerRadius = 6.0
        , font = screenFont
        }
    in (PrimaryButton.Config parimaryPayConfig)

secondaryButtonConfigDream11 = let
    SecondaryButton.Config config = SecondaryButton.defConfig
    parimaryPayConfig = config 
        { background = "#aaaaaa"
        , width = V 150
        , height = V 40
        , cornerRadius = 5.0
        , font = screenFont
        }
    in (SecondaryButton.Config parimaryPayConfig)

netBankingConfigDream11 = let
    BankListItem.Config config = BankListItem.defConfig
    parimaryPayConfig = config 
        { background = "#ffffff"
        , radioDirection = None
        , radioInnerColor = "#03A9F4"
        , radioOuterColor = "#cccccc"
        , bankImageSize = 32
        , bankImageVisible = VISIBLE
        , bankTextColor = "#000000"
        , bankTextSize = 20
        , bankTextFont = "Arial"
        , arrowImage = "ic_arrow_right"
        , arrowVisible = VISIBLE
        , cardHeight = 60
        , orientation = HORIZONTAL
        , dividerColor = "#e1e1e1"
        , dividerVisibility = VISIBLE
        , dividerMargin = Margin 30 0 0 0
        , font = screenFont
        }
    in (BankListItem.Config parimaryPayConfig)

paymentOptionsV2ConfigDream11 = let
    PaymentOptionsV2.Config config = PaymentOptionsV2.defConfig
    walletCardConfig = config 
        { amount = "LINK ACCOUNT"
        , imageUrl = "ic_paytm"
        , headingText = "PayTM"
        , headingHeight = V 30
        , height = V 50
        , parentPadding = (Padding 0 0 0 0)
        , imageWidth = V 60
        , amountColor = "#253185"
        , amountWidth = V 100
        , font = screenFont
        }
    in (PaymentOptionsV2.Config walletCardConfig)

dream11CardNumberEditText:: AddCard.EditTextConfigV2
dream11CardNumberEditText = let
    AddCard.EditTextConfigV2 config = AddCard.defEditTextConfigV2
    editTextConfig = config 
        { lineSeparatorHeight = 2  
        , lineSeparatorColor = "#000000" 
        , hintOutOfEditText = true  
        , hint = "Card Number"
        , textColor = "#555555" 
        , cardHeight = V 70
        , background = "#efefef"
        , font = screenFont
        }
    in (AddCard.EditTextConfigV2 editTextConfig)

dream11CardNameEditText:: AddCard.EditTextConfigV2
dream11CardNameEditText = let
    AddCard.EditTextConfigV2 config = AddCard.defEditTextConfigV2
    editTextConfig = config 
        { lineSeparatorHeight = 0
        , hintOutOfEditText = true  
        , hint =  "Enter your credit/debit card no."
        , editTextVisibility = GONE
        , background = "#efefef"
        , textColor = "#555555" 
        , font = screenFont
        }
    in (AddCard.EditTextConfigV2 editTextConfig)

dream11CardDateEditText:: AddCard.EditTextConfigV2
dream11CardDateEditText = let
    AddCard.EditTextConfigV2 config = AddCard.defEditTextConfigV2
    editTextConfig = config 
        { lineSeparatorHeight = 2  
        , lineSeparatorColor = "#000000" 
        , hintOutOfEditText = true  
        , hint = "Expiry (MM/YY)"
        , textColor = "#555555" 
        , cardHeight = V 70
        , background = "#efefef"
        , font = screenFont
        }
    in (AddCard.EditTextConfigV2 editTextConfig)

dream11CardCvvEditText:: AddCard.EditTextConfigV2 
dream11CardCvvEditText = let
    AddCard.EditTextConfigV2 config = AddCard.defEditTextConfigV2
    editTextConfig = config 
        { lineSeparatorHeight = 2 
        , lineSeparatorColor = "#000000"
        , hintOutOfEditText = true
        , hint = "CVV"
        , textColor = "#555555" 
        , cardHeight = V 70
        , iconUrl = "ic_help_gray" 
        , margin = (Margin 30 0 0 0)
        , background = "#efefef"
        , font = screenFont
        }
    in (AddCard.EditTextConfigV2 editTextConfig)

dream11SearchBox = let
    SearchBox.Config config = SearchBox.defConfig
    searchConfig = config 
        { hint = "Search by Bank Name"
        , textSize = 18
        , cornerRadius = 3.0
        , searchIconVisibility = VISIBLE
        , tickVisibility = GONE
        , lineVisibility = GONE
        , searchIconMargin = (Margin 10 0 0 0)
        , searchIconAlpha = 0.3
        , height = MATCH_PARENT
        , font = screenFont
        }
    in (SearchBox.Config searchConfig)

dream11SavedCardConfig = let
    SavedCard.Config config = SavedCard.defConfig
    savedCardConfig = config
        { cardBackground = "#424242"
        , cardMargin = Margin 16 0 16 0
        , cornerRadius = 8.0
        , cardText = "HDFC BANK DEBIT CARD"
        , cardNumber = "4143-XXXXXXXX-3042"
        , cardTextColor = "#aaaaaa"
        , cardTextSize = 14
        , cardNumberColor = "#ffffff"
        , cardTypeImage = "ic_logo_mastercard"
        , imagePadding = (Padding 4 4 4 10)
        }
    in (SavedCard.Config savedCardConfig)