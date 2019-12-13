module UI.Merchants.BigBasket.View.OtpScreen where 


import Prelude
import PrestoDOM
import UI.Merchants.BigBasket.Controller.OtpScreen

import Effect (Effect)
import Utils
import UI.Components.Config.PaymentOptions as PaymentOptionsConfig
import UI.Components.Config.ToolBar as ToolBarConfig
import UI.Components.View.Offers as Offers
import UI.Components.View.PaymentOptions as PaymentOptions
import UI.Components.View.ToolBar as ToolBar
import UI.Components.View.KeyBoard as KeyBoard
import UI.Merchants.BigBasket.Config as BigBasketConfig
import UI.Merchants.BigBasket.View.SavedOptions as SavedOptions
import Data.String
import Data.Maybe
import Data.String.CodeUnits(charAt , singleton)

screen ::  ScreenInput -> Screen Action State ScreenOutput
screen input =
    { initialState : (initialState input)
    , view
    , eval : eval
    }

view :: forall w. (Action -> Effect Unit) -> State  -> PrestoDOM (Effect Unit) w
view push state =
   linearLayout_  (Namespace "BigBasketOtpScreen")
        ([ height MATCH_PARENT
        , width MATCH_PARENT
        , background "#f1f1f1"
        , orientation VERTICAL
        , gravity CENTER_HORIZONTAL
        ]<> overrides "MainLayout" push state)
        [ ToolBar.view (push <<< ToolBarAction) (ToolBarConfig.Config toolbarConfig)
        , textView
            [ height $ V 24
            , width MATCH_PARENT
            , margin (Margin 16 10 10 0)
            , text "PREFERRED OPTION"
            , typeface BOLD
            , textSize 16
            , margin (Margin 8 16 0 8)
            ] 
        , linearLayout
            [ width MATCH_PARENT
            , height $ V 0 
            , weight 1.0
            , orientation VERTICAL 
            -- , gravity CENTER_HORIZONTAL
            , background "#ffffff"
            , margin (Margin 16 16 16 16)
            , cornerRadius 8.0
            ]
            [ linearLayout
                [ width $ V 300
                , height $ V 0
                , weight 1.0
                , orientation HORIZONTAL
                , background "#ffffff"
                , margin (Margin 0 16 0 0)
                ]
                [ imageView 
                    [ width $ V 32 
                    , height $ V 32 
                    , imageUrl "bank_kotak"--state.bankIconUrl 
                    , margin(Margin 8 0 8 0)
                    ]
                , linearLayout 
                    [ width $ V 0 
                    , weight 1.0
                    , height MATCH_PARENT
                    , orientation VERTICAL 
                    ]
                    [ linearLayout
                        [ width MATCH_PARENT
                        , height $ V 24 
                        , orientation HORIZONTAL
                        ]
                        [ textView
                            [ width $ V 0
                            , weight 1.0
                            , height MATCH_PARENT
                            , gravity LEFT 
                            , text "Kotak Credit Card"
                            , textSize 16
                            ]
                        , imageView 
                            [ width $ V 24 
                            , height $ V 16
                            , imageUrl "bb_visa_logo"
                            ]
                        ]
                    , textView 
                        [ width MATCH_PARENT
                        , height $ V 24 
                        , text "5000 **** **** 1234"
                        , typeface BOLD
                        , color "#000000"
                        ]
                    , textView 
                        [ width MATCH_PARENT 
                        , height $ V 32
                        , text "RS. 100 cashback above Rs. 500 "
                        , color "#689F39"
                        , gravity LEFT
                        ]                
                    , linearLayout 
                        [ width $ V 260
                        , height $ V 72 
                        , background "#FFFFFF"
                        , margin (MarginTop 16)
                        , visibility VISIBLE  
                        ]
                        [ relativeLayout
                            [ width MATCH_PARENT
                            , height MATCH_PARENT
                            ] 
                            [ editText
                                [ width MATCH_PARENT
                                , height MATCH_PARENT
                                , onChange push (CVV_CHANGED)
                                , inputType NumericPassword
                                ]
                            , linearLayout
                                [ width MATCH_PARENT
                                , height MATCH_PARENT
                                , orientation VERTICAL
                                , background "#ffffff"
                                , userInteraction false
                                ]
                                [ linearLayout 
                                    [ width MATCH_PARENT
                                    , height $ V 0
                                    , weight 1.0
                                    , orientation HORIZONTAL
                                    ]
                                    [ textView 
                                        [ width $ V 0 
                                        , height MATCH_PARENT
                                        , weight 1.0
                                        -- , text  $ if(length state.cvv == 0) then "." else singleton (fromMaybe ' ' (charAt 0 state.cvv))
                                        , textSize 45
                                        , scaleY 1.5
                                        , gravity CENTER
                                        , color "#000000"
                                        -- , alpha $ case (charAt 0 state.cvv) of
                                        --                 Nothing -> 0.3
                                        --                 _ -> 1.0
                                        ]
                                    , textView 
                                        [ width $ V 0 
                                        , height MATCH_PARENT
                                        , weight 1.0
                                        -- , text  $ if(length state.cvv == 0) then "." else singleton (fromMaybe ' ' (charAt 1 state.cvv))
                                        , textSize 45 
                                        , color "#000000"
                                        , gravity CENTER
                                        , scaleY 1.5 
                                        -- , alpha $ case (charAt 0 state.cvv) of
                                        --                 Nothing -> 0.3
                                        --                 _ -> 1.0
                                        ]
                                    , textView 
                                        [ width $ V 0 
                                        , height MATCH_PARENT
                                        , weight 1.0
                                        -- , text  $ if(length state.cvv == 0) then "." else singleton (fromMaybe ' ' (charAt 2 state.cvv))
                                        , color "#000000"
                                        , fontSize 45 
                                        , textSize 45
                                        , gravity CENTER
                                        , scaleY 1.5
                                        -- , alpha $ case (charAt 0 state.cvv) of
                                        --                 Nothing -> 0.3
                                        --                 _ -> 1.0
                                        ]
                                    , textView 
                                        [ width $ V 0 
                                        , height MATCH_PARENT
                                        , weight 1.0
                                        -- , text  $ if(length state.cvv == 0) then "." else singleton (fromMaybe ' ' (charAt 3 state.cvv))
                                        , textSize 45
                                        , scaleY 1.5
                                        , gravity CENTER
                                        , color "#000000"
                                        -- , alpha $ case (charAt 0 state.cvv) of
                                        --                 Nothing -> 0.3
                                        --                 _ -> 1.0
                                        ]
                                    , textView 
                                        [ width $ V 0 
                                        , height MATCH_PARENT
                                        , weight 1.0
                                        -- , text  $ if(length state.cvv == 0) then "." else singleton (fromMaybe ' ' (charAt 4 state.cvv))
                                        , textSize 45 
                                        , color "#000000"
                                        , gravity CENTER
                                        , scaleY 1.5 
                                        -- , alpha $ case (charAt 0 state.cvv) of
                                        --                 Nothing -> 0.3
                                        --                 _ -> 1.0
                                        ]
                                    , textView 
                                        [ width $ V 0 
                                        , height MATCH_PARENT
                                        , weight 1.0
                                        -- , text  $ if(length state.cvv == 0) then "." else singleton (fromMaybe ' ' (charAt 5 state.cvv))
                                        , color "#000000"
                                        , fontSize 45 
                                        , textSize 45
                                        , gravity CENTER
                                        , scaleY 1.5
                                        -- , alpha $ case (charAt 0 state.cvv) of
                                        --                 Nothing -> 0.3
                                        --                 _ -> 1.0
                                        ]
                                    ]
                                , linearLayout
                                    [ height $ V 4
                                    , width MATCH_PARENT
                                    , orientation HORIZONTAL 
                                    , userInteraction false
                                    ]
                                    [ linearLayout
                                        [ height MATCH_PARENT
                                        , width $ V 0
                                        , weight 1.0
                                        , background "#EF7674"
                                        -- , visibility if ((length state.cvv) == 0) then VISIBLE else INVISIBLE
                                        , orientation VERTICAL
                                        ][]
                                    , linearLayout
                                        [ height MATCH_PARENT
                                        , width $ V 0
                                        , weight 1.0
                                        , background "#EF7674"
                                        , orientation VERTICAL
                                        -- , visibility if ((length state.cvv) == 1) then VISIBLE else INVISIBLE
                                        ][]
                                    , linearLayout
                                    
                                        [ height MATCH_PARENT
                                        , width $ V 0
                                        , weight 1.0
                                        , background "#EF7674"
                                        , orientation VERTICAL
                                        -- , visibility if ((length state.cvv) == 2) then VISIBLE else INVISIBLE
                                        ][]
                                    , linearLayout
                                        [ height MATCH_PARENT
                                        , width $ V 0
                                        , weight 1.0
                                        , background "#EF7674"
                                        -- , visibility if ((length state.cvv) == 3) then VISIBLE else INVISIBLE
                                        , orientation VERTICAL
                                        ][]
                                    , linearLayout
                                        [ height MATCH_PARENT
                                        , width $ V 0
                                        , weight 1.0
                                        , background "#EF7674"
                                        , orientation VERTICAL
                                        -- , visibility if ((length state.cvv) == 4) then VISIBLE else INVISIBLE
                                        ][]
                                    , linearLayout
                                    
                                        [ height MATCH_PARENT
                                        , width $ V 0
                                        , weight 1.0
                                        , background "#EF7674"
                                        , orientation VERTICAL
                                        -- , visibility if ((length state.cvv) >= 5) then VISIBLE else INVISIBLE
                                        ][]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ]
            , linearLayout
                [ width MATCH_PARENT
                , height $ V 48 
                , cornerRadius 8.0
                , background "#EF7674"
                , gravity CENTER
                , padding (PaddingBottom 8)
                ]
                [ textView 
                    [ width MATCH_PARENT
                    , height MATCH_PARENT
                    , text "PAY NOW"
                    , color "#ffffff"
                    , gravity CENTER
                    , background "#EF7674"
                    -- , margin (MarginBottom 8)
                    ]
                ]
            ]
        , KeyBoard.view (push <<< KeyBoardAction) $
			{ enterImg : Just "ic_keyboard_enter"
			, backImg : Just "ic_keyboard_back"
			}
        ]
    where
        ToolBarConfig.Config toolBarConfigBigBasket = BigBasketConfig.toolBarConfigBigBasket
        toolbarConfig = toolBarConfigBigBasket {secondaryText = "₹ " <> state.amount}
