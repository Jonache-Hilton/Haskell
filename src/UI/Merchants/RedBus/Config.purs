module UI.Merchants.RedBus.Config where

import Prelude
import PrestoDOM
import UI.Components.Config.ToolBar as ToolBar
import UI.Components.Config.AmountView as AmountView
import UI.Components.Config.PaymentOptions as PaymentOptions
import UI.Components.Config.AddCard as AddCard
import UI.Components.Config.SearchBox as SearchBox
import UI.Components.Config.PaymentOptionsV2 as PaymentOptionsV2
import UI.Components.Config.BankListItem as BankListItem
import UI.Components.Config.BankListItem (Direction(..))
import UI.Components.Config.PopularBanks as PopularBanks
import UI.Components.Config.SavedCard as SavedCard
import UI.Components.Config.PrimaryButton as PrimaryButton

-- screenFont = "Roboto-Regular"
screenFont = "Roboto-Bold"

toolBarConfigRedBus = let
    ToolBar.Config config = ToolBar.defConfig
    toolBarConfig = config 
      { background = "#C13D49"
      , text = "Banglore to Chennai"
      , padding = (Padding 10 0 0 0 )
      , imageUrl = "toolbar_arrow_back_white" 
      , iconVisibility = VISIBLE
      , secondaryTextVisible = VISIBLE
      , secondaryText = "1:00"
      , translationY = (-10.0)
      , translationZ = 20.0
      , actionIcon = "toolbar_hourglass_redbus"
      , font = screenFont
      }
    in (ToolBar.Config toolBarConfig)

redBusDebit = let
    PaymentOptions.Config config = PaymentOptions.defConfig
    redBusDebitConfig = config 
      { text = "Debit Card (ATM Pin)"
      , typeface = BOLD
      , checkBoxVisibility = VISIBLE
      , id = "1"
      , font = screenFont
      }
    in (PaymentOptions.Config redBusDebitConfig)

redBusTez = let
    PaymentOptions.Config config = PaymentOptions.defConfig
    redBusTezConfig = config 
      { text = "Tez"
      , bankIconUrl = "payoption_tez"
      , typeface = BOLD
      , checkBoxVisibility = VISIBLE
      , id = "2"
      , font = screenFont
      }
    in (PaymentOptions.Config redBusTezConfig)

redBusBHIM = let
    PaymentOptions.Config config = PaymentOptions.defConfig
    redBusBHIMConfig = config 
      { text = "BHIM"
      , typeface = BOLD
      , checkBoxVisibility = VISIBLE
      , id = "3"
      , font = screenFont
      }
    in (PaymentOptions.Config redBusBHIMConfig)

redBusDebit2 = let
    PaymentOptions.Config config = PaymentOptions.defConfig
    redBusDebitConfig = config 
      { text = "Debit Card"
      , typeface = BOLD
      , checkBoxVisibility = VISIBLE
      , offerText = "Pay with Rupay - 10% offer"
      , bankIconUrl = "ic_card"
      , id = "4"
      , font = screenFont
      }
    in (PaymentOptions.Config redBusDebitConfig)

redBusCredit = let
    PaymentOptions.Config config = PaymentOptions.defConfig
    redBusCreditConfig = config 
      { text = "Credit Card"
      , typeface = BOLD
      , checkBoxVisibility = VISIBLE
      , bankIconUrl = "ic_card"
      , id = "5"
      , font = screenFont
      }
    in (PaymentOptions.Config redBusCreditConfig)

redBusNetBank = let
    PaymentOptions.Config config = PaymentOptions.defConfig
    redBusNetBankConfig = config 
      { text = "Net Banking"
      , typeface = BOLD
      , checkBoxVisibility = VISIBLE
      , bankIconUrl = "ic_card"
      , id = "6"
      , font = screenFont
      }
    in (PaymentOptions.Config redBusNetBankConfig)

redBusBookNow = let
    PaymentOptions.Config config = PaymentOptions.defConfig
    redBusNetBankConfig = config 
      { text = "Book Now & Pay Later"
      , typeface = BOLD
      , checkBoxVisibility = VISIBLE
      , id = "7"
      , font = screenFont
      }
    in (PaymentOptions.Config redBusNetBankConfig)

redBusAddCard = let
    AddCard.Config config = AddCard.defConfig
    redBusAddCardConfig = config 
      { height = V 280
      , background = "#E0E0E0"
      , padding = (Padding 0 10 0 0)
      , editTextCardConfig = redBusCardNumberEditCard
      , editTextNameConfig = redBusCardNameEditCard
      , editTextDateConfig = redBusCardDateEditCard
      , editTextCvvConfig = redBusCardCvvEditCard
      , isFormVisible = false
      , widthCvv = V 0
      , font = screenFont
      }
    in (AddCard.Config redBusAddCardConfig)

redBusAddCard2 = let
    AddCard.Config config = AddCard.defConfig
    redBusAddCardConfig = config 
      { height = V 280
      , background = "#E0E0E0"
      , padding = (Padding 0 10 0 0)
      , editTextCardConfig = redBusCardNumberEditCard
      , editTextNameConfig = redBusCardNameEditCard
      , editTextDateConfig = redBusCardDateEditCard
      , editTextCvvConfig = redBusCardCvvEditCard
      , isFormVisible = false
      , widthCvv = V 0
      , font = screenFont
      }
    in (AddCard.Config redBusAddCardConfig)

redBusAddCredit = let
    AddCard.Config config = AddCard.defConfig
    redBusAddCardConfig = config 
      { height = V 280
      , background = "#E0E0E0"
      , padding = (Padding 0 10 0 0)
      , editTextCardConfig = redBusCardNumberEditCard
      , editTextNameConfig = redBusCardNameEditCard
      , editTextDateConfig = redBusCardDateEditCard
      , editTextCvvConfig = redBusCardCvvEditCard
      , isFormVisible = false
      , widthCvv = V 0
      , font = screenFont
      }
    in (AddCard.Config redBusAddCardConfig)

redBusCardNumberEditCard = let
    AddCard.EditTextConfig config = AddCard.defEditTextConfig
    redBusCardNumberEditCardConfig = config 
      { parentBackground = "#E0E0E0"
      , text = "CARD NUMBER"
      , textMargin = (Margin 8 0 0 0)
      , editTextSize = 14
      , hint = "0000 0000 0000 0000"
      , rowStroke = "1,#bdbdbd"
      , imageVisibility = GONE
      , rowHeight = V 50
      , parentHeight = V 75
      , font = screenFont
      }
    in (AddCard.EditTextConfig redBusCardNumberEditCardConfig)

redBusCardNameEditCard = let
    AddCard.EditTextConfig config = AddCard.defEditTextConfig
    redBusCardNameEditCardConfig = config 
      { parentBackground = "#E0E0E0"
      , text = "CARD HOLDER NAME" 
      , textMargin = (Margin 8 0 0 0)
      , editTextSize = 14
      , hint = "ENTER NAME" 
      , rowStroke = "1,#bdbdbd" 
      , imageVisibility = GONE
      , rowHeight = V 50
      , parentHeight = V 75
      , inputType = TypeText
      , font = screenFont
      }
    in (AddCard.EditTextConfig redBusCardNameEditCardConfig)

redBusCardDateEditCard = let
    AddCard.EditTextConfig config = AddCard.defEditTextConfig
    redBusCarddateEditCardConfig = config 
      { parentBackground = "#E0E0E0"
      , text = "EXPIRY DATE"
      , textMargin = (Margin 8 0 0 0)
      , editTextSize = 14
      , hint = "MM/YY"
      , rowStroke = "1,#bdbdbd"
      , imageVisibility = GONE
      , rowHeight = V 50
      , parentHeight = V 75
      , font = screenFont
      }
    in (AddCard.EditTextConfig redBusCarddateEditCardConfig)

redBusCardCvvEditCard = let
    AddCard.EditTextConfig config = AddCard.defEditTextConfig
    redBusCardCvvEditCardConfig = config 
      { parentBackground = "#E0E0E0"
      , text = "CVV"
      , textMargin = (Margin 8 0 0 0)
      , editTextSize = 14
      , hint = "CVV"
      , rowStroke = "1,#bdbdbd"
      , imageVisibility = GONE
      , rowHeight =  V 50
      , parentHeight =  V 75
      , font = screenFont
      }
    in (AddCard.EditTextConfig redBusCardCvvEditCardConfig)

redBusPopularBanks = let
    PopularBanks.Config config = PopularBanks.defConfig
    redBusPopularBanksConfig = config 
      { parentMargin = (Margin 20 10 20 10)
        , parentHeight = V 200
        , rowHeight = V 85
        , rowMargin = (Margin 0 15 0 15)
        , imageStroke = "1,#f5f5f5"
        , imageCornerRadius = 28.0
        , imageWidth = V 56
        , imageHeight = V 56
        , imagePadding = (Padding 8 8 8 8)
        , imageMargin = (Margin 0 0 0 4)
        , textSize = 16
        , isFormVisible = false
        , font = screenFont
      }
    in (PopularBanks.Config redBusPopularBanksConfig)

redbusBankListItem = let
    BankListItem.Config config = BankListItem.defConfig
    parimaryPayConfig = config 
        { background = "#ffffff"
        , radioDirection = Left
        , radioInnerColor = "#CF283F"
        , radioOuterColor = "#cccccc"
        , bankImageSize = 24
        , bankTextColor = "#000000"
        , bankImageVisible = GONE
        , bankTextSize = 20
        , bankTextFont = ""
        , arrowImage = "arrowimg"
        , arrowVisible = GONE
        , cardHeight = 52
        , orientation = HORIZONTAL
        , font = screenFont
        }
    in (BankListItem.Config parimaryPayConfig)

redBusSearchBox = let
    SearchBox.Config config = SearchBox.defConfig
    searchConfig = config 
        { hint = "Search"
        , searchIconVisibility = VISIBLE
        , tickVisibility = GONE
        , lineVisibility = VISIBLE
        , searchIconMargin = (Margin 5 2 5 0)
        , textSize = 20
        , searchIconSize = V 22
        , font = screenFont
        }
    in (SearchBox.Config searchConfig)

redBusSavedCardConfig = let
    SavedCard.Config config = SavedCard.defConfig
    savedCardConfig = config
        { cardHeight = V 120
        , cardMargin = Margin 8 0 8 0
        , cardPadding = Padding 20 10 10 10
        , cornerRadius = 3.0
        , radioVisibility = VISIBLE
        , radioStrokeWidth = "1"
        , radioOuterColor = "#000000"
        , radioInnerColor = "#ff0000"
        , radioBackground = "#aaaaaa"
        , orientation = VERTICAL
        , infoWidth = MATCH_PARENT
        , infoHeight = V 60
        , cardTypeImage = "add_new_card_jio_visa"
        , imageMargin = (Margin 10 0 10 0)
        , cardNumber = "450502XXXXXX3025"
        , cardNumberSize = 20
        , cvvHeight = V 40
        , cvvHint = "CVV"
        , cvvColor = "#e0e0e0"
        , cvvMargin = MarginLeft 90
        }
    in (SavedCard.Config savedCardConfig)
redBusPayButtonConfig = let
    PrimaryButton.Config config = PrimaryButton.defConfig
    payConfig = config 
        { height = V 60
        , background = "#C13D49"
        , text = "Pay ₹ 714.00"
        , color = "#ffffff"
        , textSize = 18
        , margin = Margin 0 0 0 0
        }
    in (PrimaryButton.Config payConfig)
