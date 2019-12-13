module UI.Merchants.BigBasket.View.WalletScreen where

import Prelude
import PrestoDOM
import UI.Merchants.BigBasket.Controller.WalletScreen
import UI.Types

import Data.String (length)
import Effect (Effect)
import UI.Components.Config.PrimaryButton as PrimaryButtonConfig
import UI.Components.View.AddCard as AddCard
import UI.Components.View.AmountView as AmountView
import UI.Components.View.EditText as EditText
import UI.Components.View.PaymentOptions as PaymentOptions
import UI.Components.View.PopularBanks as PopularBanks
import UI.Components.View.PrimaryButton as PrimaryButton
import UI.Merchants.BigBasket.Config as BigBasketConfig
import UI.Components.View.ToolBar as ToolBar
import UI.Components.Config.ToolBar as ToolBarConfig




screen ::  ScreenInput -> Screen Action State ScreenOutput
screen input =
    { initialState : (initialState input)
    , view
    , eval : eval
    }

view :: forall w. (Action -> Effect Unit) -> State  -> PrestoDOM (Effect Unit) w
view push state =
   linearLayout_ (Namespace "WalletScreen")
        ([ height MATCH_PARENT
        , width MATCH_PARENT
        , background "#ffffff"
        , orientation VERTICAL
        ] <> overrides "MainLayout" push state )
        [ ToolBar.view (push <<< ToolBarAction) (ToolBarConfig.Config toolbarConfig)
        -- , scrollView 
        --     [ height $ V 0
        --     , weight 1.0
        --     , width MATCH_PARENT
        --     ]
        ,linearLayout 
            [ width MATCH_PARENT
            , height MATCH_PARENT
            , orientation VERTICAL
            ]
            [linearLayout
                [ height $ V 25
                , width MATCH_PARENT
                , orientation HORIZONTAL 
                ,  margin (Margin 10 30 10 40)
                ]
                [ textView
                    [ height MATCH_PARENT
                    , width $ V 180
                    , text "LINK PAYZAPP WALLET"
                    , textSize 16
                    --, margin (Margin 0 10 10 10)
                    , typeface BOLD
                    , gravity CENTER
                    ] 
                , imageView
                    [ imageUrl "logo_payzapp"
                    , width $ V 40
                    , height MATCH_PARENT
                    , gravity LEFT  
                    ]
                ]
                    , linearLayout
                    [ height $ V 50
                    , width MATCH_PARENT
                    , orientation HORIZONTAL
                    ]
                    [ linearLayout
                        [ height MATCH_PARENT
                        , width $ V 0
                        , weight 1.0
                        , margin (Margin 10 10 10 4)                           
                        --, margin (Margin 10 30 10 10)                                   
                        ]
                        [ EditText.view (push <<< EditTextAction) BigBasketConfig.editTextConfig ] 
                    , textView
                        [ height MATCH_PARENT
                        , width $ V 100
                        , text "  CHANGE"
                        , color "#FF686B"
                        , typeface BOLD    
                        , gravity CENTER
                        ]
                    ]
                , textView
                    [ width MATCH_PARENT
                    , height $ V 2
                    , text ""
                    , padding (Padding 16 4 8 8)
                    , background "#d6dbd6"
                    , gravity CENTER_VERTICAL
                    , margin (Margin 20 0 20 0 )
                    ]
                , textView
                    [ width MATCH_PARENT
                    , height $ V 60
                    , text " One time password (OTP) will be \n sent to this number"
                    , padding (Padding 16 8 8 8)
                    , background "#ffffff"
                    , gravity CENTER_VERTICAL
                    , margin (Margin 0 0 0 10 )
                    , textSize 16
                    ]
                , PrimaryButton.view (push <<< PrimaryButtonAction) newSendOtpConfig
                ]
              
        ]
        where
          ToolBarConfig.Config toolBarConfig = BigBasketConfig.toolBarConfigBigBasket
          toolbarConfig = toolBarConfig {secondaryText = "₹" <> state.amount}
         
          PrimaryButtonConfig.Config sendOtpConfig = BigBasketConfig.primaryButtonConfig
          newSendOtpConfig = PrimaryButtonConfig.Config sendOtpConfig {background = if length state.mobileNo > 0 then "#FF686B" else "#ffffff"}