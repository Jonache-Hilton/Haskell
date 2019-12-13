module UI.Merchants.Vodafone.Config where

import Prelude
import PrestoDOM
import Types

import UI.Components.Config.AddCard as AddCard
import UI.Components.Config.BankListItem (Direction(..))
import UI.Components.Config.BankListItem as BankListItem
import UI.Components.Config.PaymentOptionsV2 as PaymentOptionsV2
import UI.Components.Config.PaymentOptions as PaymentOptions
import UI.Components.Config.PopularBanks as PopularBanks
import UI.Components.Config.PrimaryButton as PrimaryButton
import UI.Components.Config.SearchBox as SearchBox
import UI.Components.Config.ToolBar as ToolBar

-- screenFont = "Roboto-Regular"
screenFont = "Roboto-Bold"

toolBarConfigVodafone = let
    ToolBar.Config config = ToolBar.defConfig
    toolBarConfig = config 
        { background = "#d50000" 
        , text =  "Payment"
        , inputUrl =  "toolbar_bigmenubutton_voda"
        , textColor = "#ffffff"
        , iconVisibility = VISIBLE
        , font = screenFont
        }
    in (ToolBar.Config toolBarConfig)

vodaDebitPO = let
    PaymentOptions.Config config = PaymentOptions.defConfig
    vodaConfig = config 
        { bankIconUrl = "paymentoption_vodafone_other_card"
        , text = "OTHER DEBIT/CREDIT CARD"
        , rightArrowUrl = "ic_arrow_right"
        , id = "1"
        , iconSize = V 56
        , font = screenFont
        }
    in (PaymentOptions.Config vodaConfig)

vodaNetBankPO = let
    PaymentOptions.Config config = PaymentOptions.defConfig
    vodaConfig = config 
        { bankIconUrl = "paymentoption_vodafone_top_banks"
        , text = "NET BANKING"
        , rightArrowUrl = "ic_arrow_right"
        , id = "2"
        , iconSize = V 56
        , font = screenFont
        }
    in (PaymentOptions.Config vodaConfig)

vodaAllBanksPO = let
    PaymentOptions.Config config = PaymentOptions.defConfig
    vodaConfig = config 
        { bankIconUrl = ""
        , text = "ALL BANKS"
        , rightArrowUrl = "ic_arrow_right"
        , id = "3"
        , font = screenFont
        }
    in (PaymentOptions.Config vodaConfig)

vodaMPesaPO = let
    PaymentOptions.Config config = PaymentOptions.defConfig
    vodaConfig = config 
        { bankIconUrl = "paymentoption_vodafone_mpesa"
        , text = "Easy to use M-Pesa Wallet"
        , iconSize = V 54
        , font = screenFont
        }
    in (PaymentOptions.Config vodaConfig)

vodaPaytmConfig = let
    PaymentOptionsV2.Config config = PaymentOptionsV2.defConfig
    cardConfig = config
        { amount = "Pay Now"
        , text = "10% cashback up to Rs 30. Min. Transaction Rs 199."
        , discountVisibility = GONE
        , headingText = ""
        , headingHeight = V 40
        , height = V 130
        , amountColor = "#ffffff"
        , amountBackground = "#E73631"
        , amountWidth = V 120
        , color = "#000000"
        , imageUrl = "paymentoption_vodafone_paytm"
        , lineSeparaterVisibility = VISIBLE
        , lineSeparaterColor = "#f5f5f5"
        , lineSeparaterMargin = (Margin 8 8 8 8)
        , font = screenFont
        }
    in (PaymentOptionsV2.Config cardConfig)

vodaEzeClickConfig = let
    PaymentOptionsV2.Config config = PaymentOptionsV2.defConfig
    cardConfig = config
        { amount = "Pay Now"
        , text = ""
        , headingText = ""
        , headingWeight = 1.0
        , height = V 65
        , amountColor = "#ffffff"
        , amountBackground = "#E73631"
        , amountWidth = V 120
        , imageWidth = V 90
        , imageUrl = "paymentoption_vodafone_ezeclick"
        , font = screenFont
        }
    in (PaymentOptionsV2.Config cardConfig)
 
vodaCitiConfig = let
    PaymentOptionsV2.Config config = PaymentOptionsV2.defConfig
    cardConfig = config
        { amount = "Pay Now"
        , text = "Minimum transaction- 250 rewards points"
        , discountVisibility = GONE
        , headingText = ""
        , headingHeight = V 40
        , height = V 90
        , amountColor = "#ffffff"
        , amountBackground = "#E73631"
        , amountWidth = V 120
        , color = "#000000"
        , imageUrl = "paymentoption_vodafone_citi"
        , font = screenFont
        }
    in (PaymentOptionsV2.Config cardConfig)

addCardConfigVodafone = let
    AddCard.Config config = AddCard.defConfig
    addCardConfig = config 
        { height = MATCH_PARENT
        , padding = (Padding 10 10 10 0)
        , stroke = "0,#ffffff"
        , imageUrl = ""
        , widthCvv = V 0
        , background = "#ffffff"
        , editTextCardConfigV2 = vodafoneCardNumberEditText
        , editTextNameConfigV2 = vodafoneCardNameEditText
        , editTextDateConfigV2 = vodafoneCardDateEditText
        , editTextCvvConfigV2 =  vodafoneCardCvvEditText
        , version = 2
        , font = screenFont
        }
    in (AddCard.Config addCardConfig)

vodafoneCardNumberEditText:: AddCard.EditTextConfigV2
vodafoneCardNumberEditText = let
    AddCard.EditTextConfigV2 config = AddCard.defEditTextConfigV2
    editTextConfig = config 
        { lineSeparatorHeight = 2  
        , lineSeparatorColor = "#bdbdbd" 
        , hintOutOfEditText = true  
        , hint = "Card Number"
        , textColor = "#555555" 
        , cardHeight = V 70
        , font = screenFont
        }
    in (AddCard.EditTextConfigV2 editTextConfig)

vodafoneCardNameEditText:: AddCard.EditTextConfigV2
vodafoneCardNameEditText = let
    AddCard.EditTextConfigV2 config = AddCard.defEditTextConfigV2
    editTextConfig = config 
        { lineSeparatorHeight = 2
        , lineSeparatorColor = "#bdbdbd"
        , hintOutOfEditText = true  
        , hint =  "CardHolder Name"
        , textColor = "#555555" 
        , cardHeight = V 70
        , inputType = TypeText
        , margin = (MarginTop 10)
        , font = screenFont
        }
    in (AddCard.EditTextConfigV2 editTextConfig)

vodafoneCardDateEditText:: AddCard.EditTextConfigV2
vodafoneCardDateEditText = let
    AddCard.EditTextConfigV2 config = AddCard.defEditTextConfigV2
    editTextConfig = config 
        { lineSeparatorHeight = 2  
        , lineSeparatorColor = "#bdbdbd" 
        , hintOutOfEditText = true  
        , hint = "Vaild Till"
        , textColor = "#555555" 
        , cardHeight = V 70
        , margin = (MarginTop 10)
        , font = screenFont
        }
    in (AddCard.EditTextConfigV2 editTextConfig)

vodafoneCardCvvEditText:: AddCard.EditTextConfigV2 
vodafoneCardCvvEditText = let
    AddCard.EditTextConfigV2 config = AddCard.defEditTextConfigV2
    editTextConfig = config 
        { lineSeparatorHeight = 2 
        , lineSeparatorColor = "#bdbdbd"
        , hintOutOfEditText = true
        , hint = "CVV"
        , textColor = "#555555" 
        , cardHeight = V 70
        , inputType = NumericPassword
        , iconUrl = "ic_help_gray" 
        , margin = (Margin 30 10 0 0)
        , font = screenFont
        }
    in (AddCard.EditTextConfigV2 editTextConfig)

primaryPayButtonConfigVodafone = let
    PrimaryButton.Config config = PrimaryButton.defConfig
    parimaryPayConfig = config 
        { text = "Next"
        , background = "#aaaaaa"
        , color = "#9e9e9e"
        , font = screenFont
        }
    in (PrimaryButton.Config parimaryPayConfig)

bankListItemConfig = let
    BankListItem.Config defConfig = BankListItem.defConfig
    config = defConfig 
        { bankTextSize = 16
        , bankImageVisible = GONE
        , arrowVisible = GONE
        , cardHeight = 60
        , radioDirection = Right
        , radioSize = V 30
        , radioInnerColor = "#dd2c00"
        , font = screenFont
        , radioPadding = (Padding 5 5 5 5)
        }
    in (BankListItem.Config config)

vodaSearchBoxConfig = let
    SearchBox.Config defConfig = SearchBox.defConfig
    config = defConfig
        { tickVisibility = VISIBLE
        , lineVisibility = VISIBLE
        , hint = "Choose your Bank"
        , textSize = 14
        , font = screenFont
        }
    in (SearchBox.Config config)

vodaPopularBanksConfig = let
    PopularBanks.Config defConfig = PopularBanks.defConfig
    config = defConfig
        { parentHeight = V 160
        , textColor = "#000000"
        , rowHeight = V 55
        , rowMargin = (Margin 0 10 0 10)
        , imageWidth = V 32
        , imageHeight = V 32
        , imageStroke = "1,#ffffff"
        , imageCornerRadius = 16.0
        , font = screenFont
        }
    in (PopularBanks.Config config)

vodafoneCardInitState :: SavedCardInput
vodafoneCardInitState = SavedCardInput
    { id : "4"
    , cardType   : "Debit Card"
    , bankName   : "KARUR VYSA BANK"
    , imageUrl   : "card_type_visa"
    , cardNumber : "•••• •••• •••• •••• 0712"
    , nameOnCard : "Nagha Ramasamy"
    , expiryDate : "10/2025"
    , isCardVisible : true
    }
