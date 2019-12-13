module UI.Merchants.Vodafone.View.VodafoneScreen where

import Prelude
import PrestoDOM
import UI.Merchants.Vodafone.Controller.VodafoneScreen

import Effect (Effect)
import UI.Components.Config.PaymentOptions as PaymentOptionsConfig
import UI.Components.Config.PopularBanks as PopularBanksConfig
import UI.Components.View.PaymentOptionsV2 as PaymentOptionsV2
import UI.Components.View.PaymentOptions as PaymentOptions
import UI.Components.View.PopularBanks as PopularBanks
import UI.Components.View.ToolbarV2 as ToolbarV2
import UI.Components.View.SavedCardBack as SavedCardBack
import UI.Components.View.SavedCardFront as SavedCardFront
import UI.Merchants.Vodafone.Config as VodafoneConfig

-- screen ::  ScreenInput -> Screen Action State ScreenOutput
screen input =
    { initialState : (initialState input)
    , view
    , eval : eval
    }

view :: forall w. (Action -> Effect Unit) -> State  -> PrestoDOM (Effect Unit) w
view push state =
   linearLayout_  (Namespace "VodafoneScreen")
        [ height MATCH_PARENT
        , width MATCH_PARENT
        , background "#efefef"
        , orientation VERTICAL
        ]
        [ scrollView 
            [ height $ V 0
            , weight 1.0
            , width MATCH_PARENT
            ]
            [ linearLayout
                [ height MATCH_PARENT
                , width MATCH_PARENT
                , orientation VERTICAL
                , padding (PaddingBottom 20)
                ]
                [ ToolbarV2.view (push <<< ToolbarV2Action) VodafoneConfig.toolBarConfigVodafone
                , textView
                    [ height $ V 44
                    , width MATCH_PARENT
                    , margin (Margin 10 10 10 10)
                    , padding (PaddingTop 20)
                    , color "#000000"
                    , text "Saved Card"
                    , typeface BOLD
                    , textSize 18
                    ]
                , linearLayout
                    [ width MATCH_PARENT
                    , height $ V 240
                    , background "#ffffff"
                    , orientation VERTICAL
                    ] [
                        linearLayout
                            [ width MATCH_PARENT
                            , height $ V 0
                            , weight 1.0
                            , padding (Padding 8 8 8 8)
                            , visibility if state.isFrontVisible then VISIBLE else GONE
                            , onClick push $ const Card
                            ]
                            [ SavedCardFront.view (push <<< SavedCardFrontAction) VodafoneConfig.vodafoneCardInitState
                            ],
                        linearLayout
                            [ width MATCH_PARENT
                            , height$ V 0
                            , weight 1.0
                            , padding (Padding 8 8 8 8)
                            , visibility if state.isFrontVisible then GONE else VISIBLE
                            , onClick push $ const Card
                            ]
                            [ SavedCardBack.view (push <<< SavedCardBackAction) VodafoneConfig.vodafoneCardInitState
                            ]
                        , linearLayout
                            [ height $ V 1
                            , width MATCH_PARENT
                            , margin (Margin 10 10 10 10)
                            , background "#cccccc"
                            ][]
                    ]
                , PaymentOptions.view (push <<< PaymentOptionsAction) VodafoneConfig.vodaDebitPO
                , textView
                    [ height $ V 24
                    , width MATCH_PARENT
                    , margin (Margin 10 10 10 10)
                    , color "#000000"
                    , text "Net Banking"
                    , typeface BOLD
                    , textSize 18
                    ]
                , PaymentOptions.view (push <<< PaymentOptionsAction) (changeNBText state.showAllBanks)
                , PopularBanks.view (push <<< PopularBanksAction) (getPopularBanksConfig state.showAllBanks)
                , linearLayout
                    [ height $ V 1
                    , width MATCH_PARENT
                    , padding (Padding 16 0 16 0)
                    , background "#e1e1e1"
                    , visibility if state.showAllBanks then VISIBLE else GONE
                    ][]
                , PaymentOptions.view (push <<< PaymentOptionsAction) (getAllBanksConfig state.showAllBanks)
                , textView
                    [ height $ V 24
                    , width MATCH_PARENT
                    , margin (Margin 10 10 10 10)
                    , color "#000000"
                    , text "M-Pesa"
                    , typeface BOLD
                    , textSize 18
                    ]
                , PaymentOptions.view (push <<< PaymentOptionsAction) VodafoneConfig.vodaMPesaPO
                , textView
                    [ height $ V 24
                    , width MATCH_PARENT
                    , margin (Margin 10 10 10 10)
                    , color "#000000"
                    , text "Wallets"
                    , typeface BOLD
                    , textSize 18
                    ]
                , PaymentOptionsV2.view (push <<< PaymentOptionsV2Action) VodafoneConfig.vodaPaytmConfig
                , PaymentOptionsV2.view (push <<< PaymentOptionsV2Action) VodafoneConfig.vodaEzeClickConfig
                , textView
                    [ height $ V 24
                    , width MATCH_PARENT
                    , margin (Margin 10 10 10 10)
                    , color "#000000"
                    , text "Rewards"
                    , typeface BOLD
                    , textSize 18
                    ]
                , PaymentOptionsV2.view (push <<< PaymentOptionsV2Action) VodafoneConfig.vodaCitiConfig
                ]
            ]
        ]


changeNBText:: Boolean -> PaymentOptionsConfig.Config
changeNBText showAllBanks =
    if showAllBanks then
        let (PaymentOptionsConfig.Config config) = VodafoneConfig.vodaNetBankPO
            newCon = config {text = "View Top Banks", rightArrowUrl = "icon_spinner_down", lineSeparaterColor = ""}
        in (PaymentOptionsConfig.Config newCon)
    else
        let (PaymentOptionsConfig.Config config) = VodafoneConfig.vodaNetBankPO
            newConf = config {text = "NET BANKING", rightArrowUrl = "ic_arrow_right", lineSeparaterColor = "#e1e1e1"}
        in (PaymentOptionsConfig.Config newConf)

getAllBanksConfig :: Boolean -> PaymentOptionsConfig.Config
getAllBanksConfig showAllBanks = 
    if showAllBanks then
        let (PaymentOptionsConfig.Config config) = VodafoneConfig.vodaAllBanksPO
            newCon = config {isFormVisible = true}
        in (PaymentOptionsConfig.Config newCon)
    else
        let (PaymentOptionsConfig.Config config) = VodafoneConfig.vodaAllBanksPO
            newConf = config {isFormVisible = false}
        in (PaymentOptionsConfig.Config newConf)

getPopularBanksConfig :: Boolean -> PopularBanksConfig.Config
getPopularBanksConfig showAllBanks = 
    if showAllBanks then
        let (PopularBanksConfig.Config config) = VodafoneConfig.vodaPopularBanksConfig
            newCon = config {isFormVisible = true}
        in (PopularBanksConfig.Config newCon)
    else
        let (PopularBanksConfig.Config config) = VodafoneConfig.vodaPopularBanksConfig
            newConf = config {isFormVisible = false}
        in (PopularBanksConfig.Config newConf)