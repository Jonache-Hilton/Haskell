module UI.Merchants.Goibibo.Config where


import Prelude
import PrestoDOM
import UI.Components.Config.ToolBar as ToolBar
import UI.Components.Config.AmountView as AmountView
import UI.Components.Config.PaymentOptions as PaymentOptions
import UI.Components.Config.PaymentOptionsV2 as PaymentOptionsV2
import UI.Components.Config.PopularBanksV2 as PopularBanksV2
import UI.Components.Config.BankListItem as BankListItem
import UI.Components.Config.BankListItem (Direction(..))
import UI.Components.Config.AddCard as AddCard
import UI.Components.Config.EditTextV2 as EditTextV2
import UI.Components.Config.PrimaryButton as PrimaryButton
import UI.Components.Config.SecondaryButton as SecondaryButton
import UI.Components.Config.SavedCard as SavedCard

-- screenFont = "AvenirNext-Medium"
-- screenFont = "Roboto-Italic"
screenFont = "Roboto-Bold"

toolBarConfigGoibibo = let
    ToolBar.Config config = ToolBar.defConfig
    toolBarConfig = config 
        { background = "#2562b3"
        , text = "Select a Payment Option"
        , padding = (Padding 20 0 10 0)
        , imageUrl = "toolbar_arrow_back_white"
        , actionIconSize = V 20
        , font = screenFont
        }
    in (ToolBar.Config toolBarConfig)

amountConfigGoibibo :: AmountView.Config
amountConfigGoibibo = let
    AmountView.Config config = AmountView.defConfig
    amountConfig = config
        { text = "* Convenience fee of ₹ 279 is added."
        , heightParent = V 70
        , headingHeight = V 0
        , height = V 0
        , amountText = "₹3729"
        , imageVisibility = VISIBLE
        , amountTextSize = 28
        , orientation = VERTICAL
        , amountTypeface = BOLD
        , font = screenFont
        , parentGravity = LEFT
        }
    in (AmountView.Config amountConfig)

amountConfigGoibibo2 :: AmountView.Config
amountConfigGoibibo2 = let
    AmountView.Config config = AmountView.defConfig
    amountConfig = config
        { amountText = "₹3729"
        , amountTypeface = BOLD
        , amountTextSize = 24
        , imageVisibility = VISIBLE
        , imageMargin = Margin 8 0 6 0
        , width = V 0
        , font = screenFont
        }
    in (AmountView.Config amountConfig)

goibiboUPI = let
    PaymentOptions.Config config = PaymentOptions.defConfig
    goibiboConfig = config 
        { text = "UPI"
        , paymentOptionOffer = "NEW"
        , bankIconUrl = "ic_card"
        , lineSeparaterColor = "#dcdbdc"
        , id = "1"
        , font = screenFont
        }
    in (PaymentOptions.Config goibiboConfig)

goibiboCredit = let
    PaymentOptions.Config config = PaymentOptions.defConfig
    goibiboConfig = config 
        { text = "Credit Card"
        , bankIconUrl = "ic_card"
        , lineSeparaterColor = "#dcdbdc"
        , id = "2"
        , font = screenFont
        }
    in (PaymentOptions.Config goibiboConfig)

goibiboDebit = let
    PaymentOptions.Config config = PaymentOptions.defConfig
    goibiboConfig = config 
        { text = "Debit Card"
        , bankIconUrl = "ic_card"
        , lineSeparaterColor = "#dcdbdc"
        , id = "3"
        , font = screenFont
        }
    in (PaymentOptions.Config goibiboConfig)

goibiboNetBank = let
    PaymentOptions.Config config = PaymentOptions.defConfig
    goibiboConfig = config
        { text = "Netbanking"
        , bankIconUrl = "paymentoptions_v2_goibibo_netbanking"
        , lineSeparaterColor = "#dcdbdc"
        , id = "4"
        , font = screenFont
        }
    in (PaymentOptions.Config goibiboConfig)

goibiboPopularBank = let
    PopularBanksV2.Config config = PopularBanksV2.defConfig
    goibiboConfig = config
        { imageMargin = (Margin 10 0 10 0)
        , imagePadding = (Padding 4 4 4 4)
        , parentHeight = V 52
        , rowHeight = V 50
        , imageWidth = V 40
        , background = "#ffffff"
        , font = screenFont
        }
    in (PopularBanksV2.Config goibiboConfig)

goibiboBankListItem = let
    BankListItem.Config defConfig = BankListItem.defConfig
    config = defConfig 
        { background = "#ffffff"
        , radioDirection = None
        , radioInnerColor = "#03A9F4"
        , radioOuterColor = "#cccccc"
        , bankImageSize = 36
        , bankImageVisible = GONE
        , bankTextColor = "#000000"
        , bankTextSize = 18
        , bankTextFont = "Arial"
        , arrowImage = "arrowimg"
        , arrowVisible = GONE
        , orientation = HORIZONTAL
        , dividerVisibility = VISIBLE
        , font = screenFont
        }
    in (BankListItem.Config config)

goibiboAddCard = let
    AddCard.Config config = AddCard.defConfig
    addCardConfig = config 
        { height = MATCH_PARENT
        , stroke = "0,#ffffff"
        , imageUrl = ""
        , widthCvv = V 0
        , editTextCardConfigV2 = goibiboCardNumberEditText
        , editTextNameConfigV2 = goibiboCardNameEditText
        , editTextDateConfigV2 = goibiboCardDateEditText
        , editTextCvvConfigV2 =  goibiboCardCvvEditText
        , version = 2
        , font = screenFont
        }
    in (AddCard.Config addCardConfig)

goibiboCardNumberEditText:: AddCard.EditTextConfigV2
goibiboCardNumberEditText = let
    AddCard.EditTextConfigV2 config = AddCard.defEditTextConfigV2
    editTextConfig = config 
        { lineSeparatorHeight = 2  
        , lineSeparatorColor = "#4c7fc0" 
        ,lineSeparatorMargin = (Margin 0 0 30 0)
        , iconUrl = "ic_card"
        , hint = "Card Number"
        , hintColor = "#000000" 
        , margin = (Margin 0 0 0 30)
        , font = screenFont
        }
    in (AddCard.EditTextConfigV2 editTextConfig)

goibiboCardNameEditText:: AddCard.EditTextConfigV2
goibiboCardNameEditText = let
    AddCard.EditTextConfigV2 config = AddCard.defEditTextConfigV2
    editTextConfig = config 
        { lineSeparatorHeight = 2  
        , lineSeparatorColor = "#4c7fc0" 
        , hint = "Name on Card"
        , hintColor = "#000000" 
        , margin = (Margin 0 0 0 30)
        , inputType = TypeText
        , font = screenFont
        }
    in (AddCard.EditTextConfigV2 editTextConfig)

goibiboCardDateEditText:: AddCard.EditTextConfigV2
goibiboCardDateEditText = let
    AddCard.EditTextConfigV2 config = AddCard.defEditTextConfigV2
    editTextConfig = config 
        { lineSeparatorHeight = 2  
        , lineSeparatorColor = "#4c7fc0" 
        , hint = "MM/YY"
        , hintColor = "#000000" 
        , font = screenFont
        }
    in (AddCard.EditTextConfigV2 editTextConfig)

goibiboCardCvvEditText:: AddCard.EditTextConfigV2 
goibiboCardCvvEditText = let
    AddCard.EditTextConfigV2 config = AddCard.defEditTextConfigV2
    editTextConfig = config 
        { lineSeparatorHeight = 2  
        , lineSeparatorColor = "#4c7fc0" 
        , hint = "CVV.NO"
        , hintColor = "#000000" 
        , margin = (Margin 30 0 0 0)
        , font = screenFont
        }
    in (AddCard.EditTextConfigV2 editTextConfig)

goibiboPayButton :: PrimaryButton.Config 
goibiboPayButton = let
    PrimaryButton.Config config = PrimaryButton.defConfig
    payConfig = config 
        { text = "PAY SECURELY"
        , background = "#2361B2"
        , cornerRadius = 3.0
        , margin = (Margin 8 8 8 8)
        , typeface = BOLD
        , font = screenFont
        }
    in (PrimaryButton.Config payConfig)

goibiboPayNowButton :: SecondaryButton.Config 
goibiboPayNowButton = let
    SecondaryButton.Config config = SecondaryButton.defConfig
    payConfig = config 
        { background = "#50AF50"
        , width = V 100
        , height = V 45
        , cornerRadius = 5.0
        , text = "PAY NOW"
        , font = screenFont
        }
    in (SecondaryButton.Config payConfig)

goibiboVpaEditText:: EditTextV2.Config
goibiboVpaEditText = let
    EditTextV2.Config config = EditTextV2.defConfig
    editTextConfig = config 
        { lineSeparatorHeight = 2  
        , lineSeparatorColor = "#4c7fc0" 
        , hint = "Virtual Private Address"
        , hintColor = "#000000" 
        , margin = (Margin 16 8 16 16)
        , inputType = TypeText
        , font = screenFont
        }
    in (EditTextV2.Config editTextConfig)

goibiboSavedCardConfig = let
    SavedCard.Config config = SavedCard.defConfig
    savedCardConfig = config
        { cardHeight = V 65
        , cardTypeImage = "ic_logo_mastercard"
        , cardText = "MASTERXXXX9192"
        , cardNumber = "552365XXXXXX9192"
        , cardNumberColor = "#aaaaaa"
        , cardNumberSize = 16
        , buttonVisibility = VISIBLE
        }
    in (SavedCard.Config savedCardConfig)
