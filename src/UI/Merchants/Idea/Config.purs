module UI.Merchants.Idea.Config where

import Prelude
import PrestoDOM
import UI.Components.Config.ToolBar as ToolBar
import UI.Components.Config.AmountView as AmountView
import UI.Components.Config.PaymentOptions as PaymentOptions
import UI.Components.Config.PaymentOptionsV2 as PaymentOptionsV2
import UI.Components.Config.AddCard as AddCard
import UI.Components.Config.PopularBanks as PopularBanks
import UI.Components.Config.PrimaryButton as PrimaryButton


toolBarIdea= let
    ToolBar.Config config = ToolBar.defConfig
    toolbar = config 
                { background = "#FFFF00"
                , text = "Pay & Recharge"
                -- , fontFamily = "TimesNewRoman"
                , padding = (Padding 20 0 0 0 )
                , imageUrl = "backarrow" 
                , textColor = "#000000"
                , typeface = BOLD
                , translationY = (-10.0)
                , translationZ = 20.0
                , font = "AvenirNext-Medium"
                }
    in (ToolBar.Config toolbar)

amountView=let
    AmountView.Config config = AmountView.defConfig
    summaryConfig = config 
        { heightParent = V 40
        -- , text = "Unlimited Calls(Local/STD/Roaming) + 1.4 GB/Day 2G/3G/4G Internet + 100 SMS/Day \n Validity-70 Days"
        , text = "MRP : "
        , color = "#000000"
        , textSize = 18
        , gravity = RIGHT
        , headingHeight = V 18
        -- , textBoxHeight = V 25
        , headingText = "7834861582"
        , headingWeight = 1.0
        , headingTextSize = 16
        , amountVisibility = VISIBLE
        , orientation = HORIZONTAL
        , margin = (Margin 10 10 10 0)
        }
    in (AmountView.Config summaryConfig)

-- toolBarIdea1= let
--     ToolBar.Config config = ToolBar.defConfig
--     toolbar = config 
--                 { background = "FFFFFF"
--                 , text = "Unlimited Calls(Local/STD/Roaming) + 1.4 GB/Day 2G/3G/4G Internet + 100 SMS/Day \n Validity-70 Days"
--                 , padding = (Padding 20 0 0 0 )
--                 , textColor = "#0F0F0F"
--                 , textSize = 12
--                 , translationY = (-10.0)
--                 , translationZ = 20.0
--                 }
--     in (ToolBar.Config toolbar)

ideaDebitPO = let
    PaymentOptions.Config config = PaymentOptions.defConfig
    ideaConfig = config 
        { bankIconUrl = "ic_card"
        , text = "Card/Netbanking"
        , rightArrowUrl = "ic_arrow_right"
        , typeface = BOLD
        , id = "Card/NetBanking"
        , background = "#ffffff"
        }
    in (PaymentOptions.Config ideaConfig)

ideaPaytmPO = let
    PaymentOptions.Config config = PaymentOptions.defConfig
    ideaConfig = config 
        { bankIconUrl = "accountimage"
        , text = "Paytm Wallet"
        , rightArrowUrl = "ic_arrow_right"
        , typeface = BOLD
        , id = "Paytm"
        , background = "#ffffff"
        }
    in (PaymentOptions.Config ideaConfig)

ideaMobiWalletPO = let
    PaymentOptions.Config config = PaymentOptions.defConfig
    ideaConfig = config 
        { bankIconUrl = "ic_card"
        , text = "Mobiwik Wallet"
        , rightArrowUrl = "ic_arrow_right"
        , typeface = BOLD
        , id = "Wallet"
        , background = "#ffffff"
        }
    in (PaymentOptions.Config ideaConfig)