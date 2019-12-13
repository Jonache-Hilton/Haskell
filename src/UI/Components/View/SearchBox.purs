module UI.Components.View.SearchBox where

import Effect
import Prelude
import PrestoDOM
import Types

import UI.Components.Config.SearchBox
import UI.Components.Controller.SearchBox

view :: forall w . (Action  -> Effect Unit) -> Config  -> PrestoDOM (Effect Unit) w
view push (Config config) =
  linearLayout
    [ height config.height
    , width MATCH_PARENT
    , gravity CENTER_VERTICAL
    , cornerRadius config.cornerRadius
    , orientation HORIZONTAL
    , background "#ffffff"
    , stroke config.stroke
    , padding config.padding
    ] 
    [ imageView
        [ height config.searchIconSize
        , width config.searchIconSize
        , imageUrl config.imageUrl
        , padding config.searchIconPadding
        , margin config.searchIconMargin
        , visibility config.searchIconVisibility
        , alpha config.searchIconAlpha
        ]
    , linearLayout
        [ height MATCH_PARENT
        , width MATCH_PARENT
        , gravity CENTER_VERTICAL
        , orientation VERTICAL
        ]
        [ editText
            [ height  MATCH_PARENT
            , width MATCH_PARENT
            , weight 1.0
            , textSize config.textSize
            , color "#000000"
            , background "#ffffff"
            , hint config.hint 
            , hintColor "#aaaaaa"
            , lineHeight "21px"
            , singleLine true
            , padding (Padding 8 0 0 0)
            , margin (MarginTop 4)
            , gravity CENTER_VERTICAL
            ]
        , linearLayout
            [ height $ V 4
            , width MATCH_PARENT
            , orientation HORIZONTAL
            , gravity BOTTOM
            ]
            [ linearLayout
                [ width $ V 1
                , height MATCH_PARENT
                , background "#aaaaaa"
                , visibility config.tickVisibility 
                ][]
            , linearLayout 
                [ height $ V 1
                , width $ V (-1)
                , weight 1.0
                , margin (Margin 0 3 0 0)
                , visibility config.lineVisibility  
                , background "#aaaaaa"
                ][]
            , linearLayout 
                [ width $ V 1
                , height MATCH_PARENT
                , background "#aaaaaa"
                , visibility config.tickVisibility   
                ][]
            ]
        ]
    , textView 
        [ width MATCH_PARENT
        , height $ V 20
        , color "#ff0000"
        , text config.fieldErrorMessage
        , fontStyle config.font
        ]
    ]
