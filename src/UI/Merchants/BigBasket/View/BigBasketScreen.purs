module UI.Merchants.BigBasket.View.BigBasketScreen where

import Data.Array
import Prelude
import PrestoDOM
import UI.Merchants.BigBasket.Controller.BigBasketScreen
import UI.Types

import Data.Maybe (fromMaybe)
import Effect (Effect)
import Utils
import UI.Components.Config.ToolBar as ToolBarConfig
import UI.Components.View.ToolBar as ToolBar
import UI.Merchants.BigBasket.View.SavedOptions as SavedOptions
import UI.Merchants.BigBasket.Config as BigBasketConfig
import UI.Components.View.ToolBar as ToolBar
import UI.Components.Config.ToolBar as ToolBarConfig
import UI.Components.Config.PaymentOptions as PaymentOptionsConfig 
import UI.Components.View.PaymentOptions as PaymentOptions 
import UI.Components.View.Offers as Offers 

screen ::  ScreenInput -> Screen Action State ScreenOutput
screen input =
    { initialState : (initialState input)
    , view
    , eval : eval
    }

view :: forall w. (Action -> Effect Unit) -> State  -> PrestoDOM (Effect Unit) w
view push state =
   linearLayout_  (Namespace "BigBasketScreen")
        ([ height MATCH_PARENT
        , width MATCH_PARENT
        , background "#efefef"
        , orientation VERTICAL
        ] <> overrides "MainLayout" push state)
        [ ToolBar.view (push <<< ToolBarAction) (ToolBarConfig.Config toolbarConfig)
        , scrollView 
            [ height $ V 0
            , weight 1.0
            , width MATCH_PARENT
            ]
            case (log "getting OS" (getOS unit)) of
                "ANDROID" -> [ linearLayout
                        [ height MATCH_PARENT
                        , width MATCH_PARENT
                        , orientation VERTICAL
                        ]
                        $ body push state
                    ]
                _ -> body push state
        ]
    where
        ToolBarConfig.Config toolBarConfigBigBasket = BigBasketConfig.toolBarConfigBigBasket
        toolbarConfig = toolBarConfigBigBasket {secondaryText = "₹ " <> state.amount}


body push state = 
    [
        -- USE BB WALLET BALANCE 
    --   linearLayout
    --     [ width MATCH_PARENT 
    --     , height $ V 60 
    --     , orientation HORIZONTAL
    --     , gravity CENTER_VERTICAL 
    --     , padding (Padding 16 16 16 16)
    --     , background "#EAF1E3"
    --     ]
    --     [   relativeLayout
    --         [ width $ V 20 
    --         , height $ V 20  
    --         , margin (Margin 0 0 8 0)
    --         ]
    --         [ imageView 
    --             [ width $ V 20 
    --             , height $ V 20 
    --             , imageUrl "bb_checkbox_bg"
    --             ]
    --         , imageView
    --             [ width $ V 16 
    --             , height $ V 16 
    --             , imageUrl "bb_checkbox_checked"
    --             , margin (Margin 2 2 0 0)
    --             ]
    --         ]
    --     , textView
    --         [ width $ V 0 
    --         , height $ V 16 
    --         , weight 1.0
    --         , color "#5C5C5C"
    --         , text "Use BB wallet Balance"
    --         , fontStyle "AvenirNext-Medium"
    --         , gravity LEFT
    --         ]
    --     , textView 
    --         [ width $ V 54 
    --         , height $ V 16 
    --         , color "#5C5C5C"
    --         , text ("₹ " <> state.bbWalletAmount)
    --         , fontStyle "AvenirNext-Medium"
    --         , margin (MarginLeft 8)
    --         , gravity LEFT 
    --         ]
    --     ]
    --  Offers.view (push <<< OffersAction) BigBasketConfig.bbOffersConfig
    --   orderSummary push state 
      androidOffer push state 
    , textView
        [ height $ V 24
        , width MATCH_PARENT
        , margin (Margin 16 16 10 8)
        , text "DEFAULT OPTION"
        , typeface BOLD
        , textSize 16
        ]
    , savedOptionsCard push state 
    , textView
        [ height $ V 24
        , width MATCH_PARENT
        , margin (Margin 16 32 10 8)
        , text "SAVED OPTIONS"
        , typeface BOLD
        , textSize 16
        ]
    , SavedOptions.view push (fromMaybe defaultSavedOption (state.savedOptionDetails !! 0)) 0
    , SavedOptions.view push (fromMaybe defaultSavedOption (state.savedOptionDetails !! 1)) 1
    , SavedOptions.view push (fromMaybe defaultSavedOption (state.savedOptionDetails !! 2)) 2

    , textView
        [ height $ V 24
        , width MATCH_PARENT
        , margin (Margin 16 32 10 8)
        , text "OTHER OPTIONS"
        , typeface BOLD
        , textSize 16
        ]
    , PaymentOptions.view (push <<< PaymentOptionsAction) BigBasketConfig.bbAirtelMoney
    , PaymentOptions.view (push <<< PaymentOptionsAction) BigBasketConfig.bbPayZapp
    , PaymentOptions.view (push <<< PaymentOptionsAction) BigBasketConfig.bbCreditCard
    , PaymentOptions.view (push <<< PaymentOptionsAction) BigBasketConfig.bbWallet
    , PaymentOptions.view (push <<< PaymentOptionsAction) BigBasketConfig.bbUpi
    , PaymentOptions.view (push <<< PaymentOptionsAction) BigBasketConfig.bbNetBanking
    -- , PaymentOptions.view (push <<< PaymentOptionsAction) BigBasketConfig.bbEasyEmi
    -- , PaymentOptions.view (push <<< PaymentOptionsAction) BigBasketConfig.bbPayLater
    , PaymentOptions.view (push <<< PaymentOptionsAction) BigBasketConfig.bbCod
    ]


defaultSavedOption = SavedOptionDetails 
    { savedOptionIcon : "bb_paytm"
    , savedOptionName : "Balance"
    , savedOptionDetails : "₹ 000.00"
    , savedOptionTypeIcon : ""
    , savedOptionOfferText : ""
    , savedOptionIconWidth :  (V 48)
    , tickIcon : ""
    }
savedOptions push state = 
    [ SavedOptions.view push (fromMaybe defaultSavedOption (state.savedOptionDetails !! 0)) 0
    , SavedOptions.view push (fromMaybe defaultSavedOption (state.savedOptionDetails !! 1)) 1
    ]


androidOffer push state = 
    linearLayout 
        [ width MATCH_PARENT
        , height $ V 60
        , orientation HORIZONTAL 
        , case os of 
            "ANDROID" -> backgroundDrawable "big_basket_offers_background"
            _ -> stroke "1,#aaaaaa"
        , case (getOS unit) of 
            "ANDROID" -> backgroundDrawable "big_basket_offers_background"
            _ -> cornerRadius 4.0
        , padding (Padding 16 8 16 8)
        , margin (Margin 16 16 16 8)
        , gravity CENTER_VERTICAL
        , gravity CENTER
        -- , triggerEvent (3.0) push $ const Happened
        ]
        [ imageView 
            [ width $ V 32
            , height $ V 32 
            , imageUrl "bb_offers_icon_green"
            ]
        , textView 
            [ width $ V 0
            , height $ V 24
            , weight 1.0
            , text "9 vouchers available"
            , fontStyle "AvenirNext-Medium"
            , textSize 18
            , gravity LEFT 
            , padding (Padding 16 0 16 0)
            , margin (Margin 16 0 0 0)
            ]
        , textView 
            [ width $ V 60
            , height $ V 24
            , text "APPLY"
            , gravity RIGHT 
            , typeface BOLD 
            , color "#f90c00"
            , padding (Padding 16 0 0 0)
            , margin (Margin 16 0 0 0)
            ]
        ]
-- iosOffer push state = 
--     relativeLayout 
--         [ width MATCH_PARENT
--         , height $ V 60 
--         ]
--         [ imageView 
--             [ width MATCH_PARENT
--             , height MATCH_PARENT
--             , imageUrl "big_basket_offers_background"
--             -- , scaleType "fitXY"
--             ]
--         , androidOffer push state 
--         ]

orderSummary push state = 
    linearLayout 
        [ width MATCH_PARENT
        , height WRAP_CONTENT
        , background "#ffffff"
        , orientation VERTICAL 
        , padding (Padding 16 16 16 16)
        ]
        [ linearLayout 
            [ width MATCH_PARENT
            , height $ V 24 
            , orientation HORIZONTAL
            , margin (Margin 8 0 8 8)
            ]
            [ textView
                [ height MATCH_PARENT
                , width $ V 0 
                , weight 1.0
                , text "Total Basket Value"
                , fontStyle "AvenirNext-Medium"
                , textSize 16
                ]
            , textView 
                [ width WRAP_CONTENT 
                , height MATCH_PARENT
                , text "₹ 1,177"
                , fontStyle "AvenirNext-Medium"
                , textSize 16
                ]
            ]
        , linearLayout 
            [ width MATCH_PARENT
            , height $ V 24 
            , orientation HORIZONTAL
            , margin (Margin 8 0 8 8)
            ]
            [ textView 
                [ height MATCH_PARENT
                , width $ V 0
                , weight 1.0
                , text "+ Delivery Charge" 
                , fontStyle "AvenirNext-Medium"
                , textSize 16
                ]
            , textView 
                [ height MATCH_PARENT
                , width WRAP_CONTENT
                , text "₹ 50"
                , fontStyle "AvenirNext-Medium"
                , textSize 16
                ]
            ]
        , linearLayout 
            [ width MATCH_PARENT
            , height $ V 24 
            , orientation HORIZONTAL
            , margin (Margin 8 0 8 8)
            ]
            [ textView 
                [ height MATCH_PARENT
                , width $ V 0
                , weight 1.0
                , text "-  PhonePe Discount"
                , color "#689F39"
                , fontStyle "AvenirNext-Medium"
                , textSize 16
                ]
            , textView 
                [ height MATCH_PARENT
                , width WRAP_CONTENT
                , text "₹ 78"
                , color "#689F39"
                , fontStyle "AvenirNext-Medium"
                , textSize 16
                ]
            ]
        , linearLayout 
            [ width MATCH_PARENT
            , height $ V 24 
            , orientation HORIZONTAL
            , margin (Margin 8 0 8 8)
            ]
            [ relativeLayout
                [ width $ V 20 
                , height $ V 20  
                , margin (Margin 0 0 8 0)
                ]
                [ imageView 
                    [ width $ V 20 
                    , height $ V 20 
                    , imageUrl "bb_checkbox_bg"
                    ]
                , imageView
                    [ width $ V 16 
                    , height $ V 16 
                    , imageUrl "bb_checkbox_checked"
                    , margin (Margin 2 2 0 0)
                    ]
                ]
            , textView 
                [ height MATCH_PARENT
                , width $ V 0
                , weight 1.0
                , text "Settle BB wallet balance"
                , fontStyle "AvenirNext-Medium"
                , textSize 17 
                ]        
            , textView 
                [ height MATCH_PARENT
                , width WRAP_CONTENT
                , text "₹ 7.00"
                , fontStyle "AvenirNext-Medium"
                , textSize 17
                ]
            ]
        , linearLayout 
            [ width MATCH_PARENT
            , height $ V 28 
            , orientation HORIZONTAL
            , margin (Margin 8 0 8 8)
            ]
            [ relativeLayout
                [ width $ V 20 
                , height $ V 20  
                , margin (Margin 0 0 8 0)
                ]
                [ imageView 
                    [ width $ V 20 
                    , height $ V 20 
                    , imageUrl "bb_checkbox_bg"
                    , visibility INVISIBLE
                    ]
                , imageView 
                    [ width $ V 20 
                    , height $ V 20 
                    , cornerRadius 2.0
                    , stroke "1,#aaaaaa"
                    ]
                , imageView
                    [ width $ V 16 
                    , height $ V 16 
                    , imageUrl "bb_checkbox_checked"
                    , margin (Margin 2 2 0 0)
                    , visibility INVISIBLE
                    ]
                ]
            , textView 
                [ height MATCH_PARENT
                , width $ V 0
                , weight 1.0
                , text "Join BBStar Membership"
                , fontStyle "AvenirNext-Medium"
                , textSize 17 
                ]        
            , imageView 
                [ height WRAP_CONTENT
                , width $ V 52
                , imageUrl "bb_star"

                ]
            ]
        , imageView 
            [ width MATCH_PARENT
            , height WRAP_CONTENT
            , imageUrl "dashed_line"
            , margin (Margin 8 8 8 16)
            ]
----------------------------
        , linearLayout 
            [ width MATCH_PARENT
            , height $ V 28 
            , orientation HORIZONTAL
            , margin (Margin 8 0 8 0)
            ]
            [ textView
                [ width $ V 0 
                , weight 1.0
                , height MATCH_PARENT
                , text "Total Amount Payable"
                , typeface BOLD 
                , fontStyle "AvenirNext-Medium"
                , textSize 18
                , color "#000000"
                ] 
            , textView 
                [ width WRAP_CONTENT
                , height MATCH_PARENT
                , text "₹ 1,142"
                , typeface BOLD
                , fontStyle "AvenirNext-Medium"
                , textSize 18 
                , color "#000000"
                ]
            ]
        , textView 
            [ width MATCH_PARENT
            , height $ V 16 
            , text "You saved ₹ 246 on this order"
            , fontStyle "AvenirNext-Medium"
            , margin (Margin 8 0 8 8)
            , textSize 16
            , color "#689F39"
            ]
        ]


savedOptionsHorizontalScrllView push state = 
     horizontalScrollView 
        [ width MATCH_PARENT
        , height $ V 230
        ]
        case (getOS unit) of 
            "ANDROID" ->
                [
                    linearLayout
                    [ width MATCH_PARENT
                    , height MATCH_PARENT
                    , orientation HORIZONTAL 
                    ]
                    (savedOptions push state)
                ]
            _ -> (savedOptions push state)


savedOptionsCard push card =
    linearLayout 
        [ width MATCH_PARENT
        , height $ V 200 
        , background "#ffffff"
        , cornerRadius 8.0
        , margin (Margin 16 0 16 0)
        , padding (Padding 16 16 16 16)
        , orientation VERTICAL
        ]
        [ linearLayout 
            [ width MATCH_PARENT
            , height $ V 0
            , weight 1.0
            , orientation HORIZONTAL
            ]
            [ imageView
                [ width $ V 32 
                , height $ V 32 
                , imageUrl "bank_kotak"
                , margin (Margin 0 8 8 0)
                ] 
            , linearLayout 
                [ width $ V 0 
                , weight 1.0
                , height MATCH_PARENT
                , orientation VERTICAL
                , margin (MarginTop 8)
                ] 
                [ linearLayout
                    [ width MATCH_PARENT
                    , height $ V 24
                    , orientation HORIZONTAL 
                    ]
                    [ textView 
                        [ case (getOS unit) of 
                            "ANDROID" -> width WRAP_CONTENT
                            _ -> width $ V (getLabelWidth "Kotak Credit Card" "AvenirNext-Medium" 18 0 0)
                        , height MATCH_PARENT
                        , text "Kotak Credit Card"
                        , fontStyle "AvenirNext-Medium"
                        , textSize 18 
                        , color "#000000"
                        , margin (MarginRight 8)
                        ]
                    , imageView 
                        [ width $ V 32 
                        , height MATCH_PARENT
                        , imageUrl "bb_visa_logo"
                        ]
                    ]
                , textView 
                    [ width MATCH_PARENT
                    , height $ V 24 
                    , text "5001 **** **** 1234"
                    , fontStyle "AvenirNext-Medium"
                    , textSize 18 
                    ]
                , linearLayout 
                    [ width MATCH_PARENT
                    , height $ V 16 
                    , orientation HORIZONTAL 
                    -- , gravity BOTTOM
                    ]
                    [ imageView 
                        [ width $ V 12
                        , height $ V 12 
                        , imageUrl "bb_hollow_round_tick"
                        , margin (Margin 0 4 4 0)
                        ]
                    , textView 
                        [ width MATCH_PARENT
                        , text "Instant discount ₹ 78 applied"
                        , color "#689f39"
                        , fontStyle "AvenirNext-Medium"
                        , textSize 16 
                        ]
                    ]
                ]
            , imageView 
                [ width $ V 20 
                , height $ V 20 
                , imageUrl "bb_round_tick"
                ]
            ]
        -- , button 
        --     [ width MATCH_PARENT
        --     , height $ V 40 
        --     , gravity CENTER 
        --     , background "#EF7674"
        --     , cornerRadius 8.0
        --     , color "#ffffff"
        --     , text "PLACE ORDER AND PAY"
        --     , fontStyle "AvenirNext-Medium"
        --     , textSize 18
        --     , typeface BOLD
        --     ]
        , linearLayout 
            [ width MATCH_PARENT
            , height $ V 50 
            , gravity CENTER 
            , background "#EF7674"
            , cornerRadius 8.0 
            , elevation 100 
            , onClick push (const $ DefaultOption)
            ]
            [ textView 
                [ width case (getOS unit) of 
                    "ANDROID" -> WRAP_CONTENT
                    _ -> V (getLabelWidth "PLACE ORDER AND PAY" "AvenirNext-Medium" 18 0 0)
                , text  "PLACE ORDER AND PAY"
                , color "#ffffff"
                , height MATCH_PARENT
                , gravity CENTER
                , textSize 18
                , typeface BOLD
                ]
            ]
        ]


