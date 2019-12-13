module UI.Merchants.BigBasket.Config where

import Prelude
import PrestoDOM

import UI.Components.Config.AmountView as AmountView
import UI.Components.Config.BankListItem (Direction(..))
import UI.Components.Config.BankListItem as BankListItem
import UI.Components.Config.Offers as Offers
import UI.Components.Config.PaymentOptions as PaymentOptions
import UI.Components.Config.PrimaryButton as PrimaryButton
import UI.Components.Config.PaymentOptionsV2 as PaymentOptionsV2
import UI.Components.Config.PopularBanks as PopularBanks
import UI.Components.Config.PopularBanksV2 as PopularBanksV2
import UI.Components.Config.SearchBox as SearchBox
import UI.Components.Config.ToolBar as ToolBar
import UI.Components.Config.BankCard as BankCard
import UI.Components.Config.EditText as EditText

toolBarConfigBigBasket = let
    ToolBar.Config config = ToolBar.defConfig
    toolBarConfig = config 
        { background = "#689F39"
        , text = "Payment"
        , padding = (Padding 10 4 0 0)
        , imageUrl = "toolbar_arrow_back_white"
        , secondaryTextVisible = VISIBLE
        , secondaryText = "₹1,800"
        , font = "AvenirNext-Medium"
        }
    in (ToolBar.Config toolBarConfig)

bbAirtelMoney = let 
    PaymentOptions.Config config = PaymentOptions.defConfig 
    bbCon = config 
        { text = "Airtel Money"
        , textColor = "#4e4d4d"
        , bankIconUrl = "bb_airtel_money"
        , offerTextColor = "#689F39"
        , rightArrowUrl = "bb_right_arrow"
        , offerText = "Cashback upto Rs. 1000 use code MMTMR"
        , cardHeight = (V 88)
        , rightArrowWidth = (V 16)
        , rightArrowHeight = (V 16)
        , id = "AirtelMoney"  
        }
    in (PaymentOptions.Config bbCon)

bbPayZapp = let 
    PaymentOptions.Config config = PaymentOptions.defConfig 
    bbCon = config 
        {   text = "Payzapp"
        ,   textColor = "#4e4d4d"
        ,   bankIconUrl = "bb_pay_zapp"
        ,   offerTextColor = "#689F39"
        ,   offerText = "20% CB on orders above Rs. 600, use PAYBACK on PayZapp page"
        ,   rightArrowUrl = "bb_right_arrow"
        ,   cardHeight = (V 88)
        ,   rightArrowWidth = (V 16)
        ,   rightArrowHeight = (V 16)
        , id = "Payzapp"
        }
    in (PaymentOptions.Config bbCon)

bbCreditCard = let 
    PaymentOptions.Config config = PaymentOptions.defConfig 
    bbCon = config 
        {   text = "Credit/Debit Card"
        ,   textColor = "#4e4d4d"
        ,   bankIconUrl = "bb_credit_card"
        ,   offerTextColor = "#689F39"
        ,   rightArrowUrl = "bb_right_arrow"
        ,   rightArrowWidth = (V 16)
        ,   rightArrowHeight = (V 16)
        ,   id = "Credit/DebitCard" 
        ,   clickable = false 
        }
    in (PaymentOptions.Config bbCon)

bbWallet = let 
    PaymentOptions.Config config = PaymentOptions.defConfig 
    bbCon = config
        {   text = "Wallet"
        ,   textColor = "#4e4d4d"
        ,   bankIconUrl = "bb_wallet"
        ,   offerTextColor = "#689F39"
        ,   rightArrowUrl = "bb_right_arrow"
        ,   rightArrowWidth = (V 16)
        ,   rightArrowHeight = (V 16)
        ,   id = "Wallet"
        }
    in (PaymentOptions.Config bbCon)

bbUpi = let 
    PaymentOptions.Config config = PaymentOptions.defConfig 
    bbCon = config
        {   text = "UPI"
        ,   textColor = "#4e4d4d"
        ,   bankIconUrl = "bb_upi"
        ,   offerTextColor = "#689F39"
        ,   rightArrowUrl = "bb_right_arrow"
        ,   rightArrowWidth = (V 16)
        ,   rightArrowHeight = (V 16)
        ,   id = "UPI"
        }
    in (PaymentOptions.Config bbCon)
 
bbNetBanking = let 
    PaymentOptions.Config config = PaymentOptions.defConfig 
    bbCon = config
        {   text = "Net Banking"
        ,   textColor = "#4e4d4d"
        ,   bankIconUrl = "bb_net_banking"
        ,   rightArrowUrl = "bb_right_arrow"
        ,   rightArrowWidth = (V 16)
        ,   rightArrowHeight = (V 16)
        ,   id = "NetBanking"
        }
    in (PaymentOptions.Config bbCon)
 
bbEasyEmi = let 
    PaymentOptions.Config config = PaymentOptions.defConfig 
    bbCon = config
        {   text = "Easy EMI"
        ,   textColor = "#4e4d4d"
        ,   bankIconUrl = "bb_easy_emi"
        ,   rightArrowUrl = "bb_right_arrow"
        ,   rightArrowWidth = (V 16)
        ,   rightArrowHeight = (V 16)
        , id  = "EasyEMI"
        }
    in (PaymentOptions.Config bbCon)
 
bbPayLater = let 
    PaymentOptions.Config config = PaymentOptions.defConfig 
    bbCon = config
        {   text = "Pay Later"
        ,   textColor = "#4e4d4d"
        ,   bankIconUrl = "bb_pay_later"
        ,   rightArrowUrl = "bb_right_arrow"
        ,   rightArrowWidth = (V 16)
        ,   rightArrowHeight = (V 16)
        , id = "PayLater"
        }
    in (PaymentOptions.Config bbCon)
 
bbCod = let 
    PaymentOptions.Config config = PaymentOptions.defConfig 
    bbCon = config
        {   text = "Cash on delivery"
        ,   textColor = "#4e4d4d"
        ,   bankIconUrl = "bb_cod"
        ,   rightArrowUrl = "bb_right_arrow"
        ,   rightArrowWidth = (V 16)
        ,   rightArrowHeight = (V 16)
        , id = "COD"
        }
    in (PaymentOptions.Config bbCon)

bbOffersConfig =
    let (Offers.Config config) = Offers.defConfig 
        bbCon = config
            { background =  "#ffffff" --"big_basket_offers_background"
            , text =  "Get 10% discount on orders above ₹ 99. No need for coupon code."
            , cornerRadius = 4.0 
            , margin = (Margin 16 16 16 16)
            , cardTypeIcon = "bb_offers_icon"
            , actionText = "ALL VOUCHERS"
            , actionTextColor = "#E56167"
            , font = "AvenirNext-Medium"
            , cardHeight = (V 120)
            }
    in (Offers.Config bbCon)

-- bbOffersConfig2 =
--     let (Offers.Config config) = Offers.defConfig 
--         bbCon = config
--             { background =  "#ffffff"
--             , text =  "9 Vouchers available"
--             , cornerRadius = 4.0 
--             , margin = (Margin 16 16 16 16)
--             , cardTypeIcon = "bb_offers_icon_green"
--             , actionText = "Apply"
--             , actionTextColor = "#E56167"
--             , font = "AvenirNext-Medium"
--             , iconHeight = (V 32)
--             , iconWidth = (V 32)
--             }
--     in (Offers.Config bbCon)
-- bigBasketBankListItem = let
--     BankListItem.Config config = BankListItem.defConfig
--     parimaryPayConfig = config 
--         { background = "#ffffff"
--         , radioDirection = BankListItem.Left
--         , radioInnerColor = "#CF283F"
--         , radioOuterColor = "#cccccc"
--         , bankImageSize = 24
--         , bankTextColor = "#000000"
--         , bankImageVisible = GONE
--         , bankTextSize = 20
--         , bankTextFont = ""
--         , arrowImage = "arrowimg"
--         , arrowVisible = GONE
--         , cardHeight = 52
--         , orientation = HORIZONTAL
--         -- , font = screenFont
--         }
--     in (BankListItem.Config parimaryPayConfig)

bigBasketSearchBox = let
    SearchBox.Config config = SearchBox.defConfig
    searchConfig = config 
        { hint = "Search"
        , searchIconVisibility = VISIBLE
        , imageUrl = "search_gray"
        , tickVisibility = GONE
        , lineVisibility = GONE
        , searchIconMargin = (Margin 5 2 5 0)
        , textSize = 20
        , searchIconSize = V 22
        , padding = ( Padding 20 0 0 0)
        -- , font = screenFont
        }
    in (SearchBox.Config searchConfig)

-- bigBasketPopularBanks = let
--     PopularBanks.Config config = PopularBanks.defConfig
--     bigBasketPopularBanksConfig = config 
--       { parentMargin = (Margin 20 10 20 10)
--         , parentHeight = V 200
--         , rowHeight = V 85
--         , rowMargin = (Margin 0 15 0 15)
--         , imageStroke = "1,#f5f5f5"
--         , imageCornerRadius = 28.0
--         , imageWidth = V 56
--         , imageHeight = V 56
--         , imagePadding = (Padding 8 8 8 8)
--         , imageMargin = (Margin 0 0 0 4)
--         , textSize = 16
--         , isFormVisible = true
--         -- , font = screenFont
--       }
--     in (PopularBanks.Config bigBasketPopularBanksConfig)

-- bigBasketPopularBank = let
--     PopularBanksV2.Config config = PopularBanksV2.defConfig
--     bigBasketConfig = config
--         { imageMargin = (Margin 10 0 10 0)
--         , imagePadding = (Padding 4 4 4 4)
--         , parentHeight = V 52
--         , rowHeight = V 50
--         , imageWidth = V 40
--         , background = "#ffffff"
--         -- , font = screenFont
--         }
--     in (PopularBanksV2.Config bigBasketConfig)

bankListItemConfig = let
  BankListItem.Config defConfig = BankListItem.defConfig
  config = defConfig 
    { bankTextSize = 16
    , bankImageSize = 36
    , arrowVisible = GONE
    , cardHeight = 80
    , dividerVisibility = VISIBLE
    , cardPadding = (Padding 10 0 0 0)
    , radioImage = "approved_tick_orange"
    , radioDirection = Right
    , radioOuterColor = "#FFFFFF"
    , radioPadding =( Padding 0 0 0 0)
    , radioMargin = ( MarginRight 20)
    , bankImagePadding = (Padding 4 4 4 4)
    , bankTextPadding = ( PaddingLeft 10)
    -- , font  = screenFont
    }
  in (BankListItem.Config config)

bbPrimaryPayButtonConfig = let
    PrimaryButton.Config config = PrimaryButton.defConfig
    parimaryPayConfig = config 
        { text = "PAY NOW"
        , textSize = 20
        , color = "#ffffff"
        , typeface = BOLD
        , cornerRadius = 2.0
        -- , font = screenFont
        }
    in (PrimaryButton.Config parimaryPayConfig)

bigBasketBankCard = let
    BankCard.Config config = BankCard.defConfig
    bigBasketConfig = config
        { imageMargin = (Margin 10 0 10 0)
        , imagePadding = (Padding 10 10 10 10)
        , imageSize = V 54
        , background = "#eceff1"
        , imageCornerRadius = 27.0 -- imagesize =40 corner rad=1/2 of it
        , cellWidth = V 70
        , textSize = 15
        , cellMargin = MarginRight 30
        -- , 
        -- , font = screenFont
        }
    in (BankCard.Config bigBasketConfig)



primaryButtonConfig = 
    let 
        (PrimaryButton.Config config) = PrimaryButton.defConfig
        buttonConfig = config
                { text = " SEND OTP"
                , textSize = 16
                , margin = (Margin 20 270  20 40)
                , background = "#FF686B"
                , cornerRadius = 5.0
                , height = V 40 
                }
    in (PrimaryButton.Config buttonConfig)  


editTextConfig =
    let (EditText.Config config) = EditText.defConfig
        editConfig = config
            { textSize = 25
            , parentHeight =  MATCH_PARENT
            , parentMargin =  (Margin 10 0 10 0)
            , visibility = GONE
            , imageVisibility = GONE
            , rowHeight = MATCH_PARENT
            , typeface = BOLD
            , editTextSize = 30
            }
        in (EditText.Config editConfig)