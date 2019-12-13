module UI.Merchants.Grofers.View.NewCardScreen where

import Effect  (Effect)
import Prelude
import PrestoDOM
import UI.Merchants.Grofers.Controller.NewCardScreen
import UI.Merchants.Grofers.Config as GrofersConfig
import UI.Components.View.ToolBar as ToolBar
import UI.Components.View.AddCard as AddCard
import UI.Components.Config.ToolBar as ToolBarConfig

screen ::  ScreenInput -> Screen Action State ScreenOutput
screen input =
    { initialState : (initialState input)
    , view
    , eval : eval
    }

view :: forall w. (Action -> Effect Unit) -> State  -> PrestoDOM (Effect Unit) w
view push state =
   linearLayout_  (Namespace "NewCardScreen")
        [ height MATCH_PARENT
        , width MATCH_PARENT
        , background "#ffffff"
        , orientation VERTICAL
        ]
        [ ToolBar.view (push <<< ToolBarAction) (ToolBarConfig.Config newToolbarConfig)
        , scrollView 
            [ height $ V 0
            , weight 1.0
            , width MATCH_PARENT
            ]
            [ linearLayout
                [ height MATCH_PARENT
                , width MATCH_PARENT
                , orientation VERTICAL
                ]
                [ AddCard.view (push <<< AddCardAction) GrofersConfig.newCardConfig
                , linearLayout
                    [ height $ V 40
                    , gravity CENTER_VERTICAL
                    , width MATCH_PARENT
                    , orientation HORIZONTAL
                    , margin (Margin 20 10 20 10)
                    ]
                    [ linearLayout
                        [ height $ V 20
                        , width $ V 20
                        , cornerRadius 2.0
                        , margin (MarginRight 20)
                        , stroke "1,#e1e1e1"
                        ]
                        []
                    , linearLayout
                        [ height MATCH_PARENT
                        , width $ V 0
                        , weight 1.0
                        , orientation VERTICAL
                        ]
                        [ textView
                            [ height $ V 20
                            , width MATCH_PARENT
                            , text "Save this card for future use"
                            , color "#52AF4F"
                            , textSize 18
                            ]
                        , textView
                            [ height $ V 20
                            , width MATCH_PARENT
                            , text "It's perfectly secure!"
                            , textSize 16
                            ]
                        ]
                    ]
                ]
            ]
        ]
    where
        ToolBarConfig.Config toolbarConfig = GrofersConfig.toolBarConfigGrofers
        newToolbarConfig = toolbarConfig {text = "New Card", secondaryText = "Pay", secondaryTextVisible = VISIBLE}
