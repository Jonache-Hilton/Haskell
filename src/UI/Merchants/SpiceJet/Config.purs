module UI.Merchants.SpiceJet.Config where

import Prelude
import PrestoDOM
import UI.Components.Config.ToolBar as ToolBar
import UI.Components.Config.AmountView as AmountView
import UI.Components.Config.PaymentOptions as PaymentOptions
import UI.Components.Config.PaymentOptionsV2 as PaymentOptionsV2
import UI.Components.Config.AddCard as AddCard
import UI.Components.Config.SecondaryButton as SecondaryButton
import UI.Components.Config.EditText as EditText
import UI.Components.Config.PopularBanks as PopularBanks
import Utils


-- screenFont = "Roboto-Regular"
screenFont = "Roboto-Bold"

toolBarConfigSpiceJet = let
    ToolBar.Config config = ToolBar.defConfig
    toolBarConfig = config 
        { background = "#d30000"
        , text = "Payment"
        , padding = (Padding 30 0 0 0 )
        , imageUrl = "toolbar_back_arrow"
        , font = screenFont
        }
    in (ToolBar.Config toolBarConfig)

otpButtonConfigSpiceJet = let
    SecondaryButton.Config config = SecondaryButton.defConfig
    otpButtonConfig = config 
        { background = "#F39A3E"
        , width = V 110
        , height = V 60
        , cornerRadius = 0.0
        , text = "Send OTP"
        , textSize = 16
        , font = screenFont
        }
    in (SecondaryButton.Config otpButtonConfig)

amountConfigSpiceJet :: AmountView.Config
amountConfigSpiceJet = let
    AmountView.Config config = AmountView.defConfig
    amountConfig = config
        { text = "₹7213"
        , color = "#F39A3E"
        , textSize = 18
        , headingColor = "#F39A3E"
        , headingText = "Select an option to pay "
        , headingWidth = if (os == "ANDROID") then WRAP_CONTENT else V $ (getLabelWidth "Select an option to pay " screenFont 18 0 0)
        , width = if (os == "ANDROID") then WRAP_CONTENT else V $ (getLabelWidth "₹7213" config.font 18 0 0)
        , headingWeight = 0.0
        , headingHeight =  if (os == "ANDROID") then WRAP_CONTENT else V $ (getLabelHeight "Select an option to pay " screenFont 18 (getLabelWidth "Select an option to pay " screenFont 18 0 0) 0)
        , height = if (os == "ANDROID") then WRAP_CONTENT else V $ (getLabelHeight "₹7213" screenFont 18 (getLabelWidth "₹7213" screenFont 18 0 0) 0)
        , imageVisibility = VISIBLE
        , imageMargin = (Margin 0 0 0 0)
        , imageUrl = "amountview_spicejet_info_gray"
        , amountVisibility = GONE
        , typeface = BOLD
        , padding = (Padding 16 10 16 10)
        , font = screenFont
        }
    in (AmountView.Config amountConfig)


spiceJetDebitPO = let
    PaymentOptions.Config config = PaymentOptions.defConfig
    spiceJetConfig = config 
        { bankIconUrl = "ic_card"
        , text = "Credit/Debit Card"
        , typeface = BOLD
        , id = "1"
        , font = screenFont
        , clickable = false 
        }
    in (PaymentOptions.Config spiceJetConfig)

spiceJetNetPO = let
    PaymentOptions.Config config = PaymentOptions.defConfig
    spiceJetConfig = config
        { bankIconUrl = "accountimage"
        , text = "Net Banking"
        , typeface = BOLD
        , id = "2"
        , font = screenFont
        }
    in (PaymentOptions.Config spiceJetConfig)

spiceJetWalletPO = let
    PaymentOptions.Config config = PaymentOptions.defConfig
    spiceJetConfig = config 
        { bankIconUrl = "dream11_wallet"
        , text = "Wallets"
        , typeface = BOLD
        , id = "5"
        , font = screenFont
        }
    in (PaymentOptions.Config spiceJetConfig)

spiceJetUPIPO = let
    PaymentOptions.Config config = PaymentOptions.defConfig
    spiceJetConfig = config
        { bankIconUrl = "ic_upi"
        , text = "UPI"
        , typeface = BOLD
        , id = "3"
        , font = screenFont
        }
    in (PaymentOptions.Config spiceJetConfig)

spiceJetPaytmPO = let
    PaymentOptions.Config config = PaymentOptions.defConfig
    spiceJetConfig = config 
        { bankIconUrl = "ic_card"
        , text = "Paytm Wallet"
        , typeface = BOLD
        , id = "4"
        , font = screenFont
        }
    in (PaymentOptions.Config spiceJetConfig)

spiceJetAddCardConfig :: AddCard.Config
spiceJetAddCardConfig =
    let AddCard.Config config = AddCard.defConfig
        spiceJetCon = config
            { height = MATCH_PARENT
            , cornerRadius = 6.0
            , padding = (Padding 15 15 15 15)
            , margin = Margin 20 10 20 10
            , widthCvv = V 0
            , imageUrl = ""
            , editTextCardConfigV2 = spiceJetCardNumberEditText
            , editTextNameConfigV2 = spiceJetCardNameEditText
            , editTextDateConfigV2 = spiceJetCardDateEditText
            , editTextCvvConfigV2 = spiceJetCardCvvEditText
            , version = 2
            , font = screenFont
            }
    in (AddCard.Config spiceJetCon)

spiceJetCardNumberEditText :: AddCard.EditTextConfigV2
spiceJetCardNumberEditText = let
    AddCard.EditTextConfigV2 config = AddCard.defEditTextConfigV2
    editTextConfig = config 
        { lineSeparatorHeight = (2)
        , lineSeparatorColor = "#9A9A9A"
        , hint = "Card Number"
        , textColor = "#797877"
        , font = screenFont
        }
    in (AddCard.EditTextConfigV2 editTextConfig)
 
spiceJetCardNameEditText :: AddCard.EditTextConfigV2
spiceJetCardNameEditText = let
    AddCard.EditTextConfigV2 config = AddCard.defEditTextConfigV2
    editTextConfig = config 
        { lineSeparatorHeight = (2)
        , lineSeparatorColor = "#9A9A9A"
        , hint = "Name on Card"
        , textColor = "#797877"  
        , font = screenFont    
        }
    in (AddCard.EditTextConfigV2 editTextConfig)

spiceJetCardDateEditText :: AddCard.EditTextConfigV2
spiceJetCardDateEditText = let
    AddCard.EditTextConfigV2 config = AddCard.defEditTextConfigV2
    editTextConfig = config 
        { lineSeparatorHeight = (2)
        , lineSeparatorColor = "#9A9A9A"
        , hint = "Expiry Date"
        , textColor = "#797877"
        , font = screenFont
        }
    in (AddCard.EditTextConfigV2 editTextConfig)

spiceJetCardCvvEditText :: AddCard.EditTextConfigV2
spiceJetCardCvvEditText = let
    AddCard.EditTextConfigV2 config = AddCard.defEditTextConfigV2
    editTextConfig = config 
        { lineSeparatorHeight = (2)
        , lineSeparatorColor = "#9A9A9A"
        , hint = "CVV"
        , textColor = "#797877"
        , iconUrl = "sj_cvv"
        , margin = (Margin 30 0 0 0)
        , font = screenFont
        }
    in (AddCard.EditTextConfigV2 editTextConfig)

spiceJetPopularBanksConfig :: PopularBanks.Config 
spiceJetPopularBanksConfig =
    let PopularBanks.Config config = PopularBanks.defConfig
        spiceJetCon = config 
            { parentMargin = (Margin 16 10 16 10)
            , parentHeight = V 320
            , rowHeight = V 160
            , cellStroke = "1,#e0e0e0"
            , cellCornerRadius = 4.0
            , imageStroke = "1,#e0e0e0"
            , imageCornerRadius = 4.0
            , imagePadding = (Padding 2 2 2 2)
            , cellMargin = (Margin 8 8 8 8)
            , textSize = 16
            , font = screenFont
        }
    in (PopularBanks.Config spiceJetCon)

spiceJetVpaEditText:: EditText.Config 
spiceJetVpaEditText = let
    EditText.Config config = EditText.defConfig
    editTextConfig = config
		{ rowHeight = V 40
        , parentHeight = V 40
        , hint = "Enter VPA"
        , visibility = GONE
        , rowStroke = "1,#bdbdbd"
        , rowCornerRadius = 3.0
        , rowPadding = (Padding 4 0 4 0)
        , inputType = TypeText
        , imageVisibility = GONE
        , parentMargin = (Margin 8 0 8 16)
        , isFormVisible = false
        , font = screenFont
      	}
    in (EditText.Config editTextConfig)