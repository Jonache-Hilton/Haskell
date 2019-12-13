module UI.Components.View.ToolBar where
  
import Effect
import Prelude
import PrestoDOM

import UI.Components.Controller.ToolBar
import UI.Components.Config.ToolBar


view :: forall w . (Action -> Effect Unit) -> Config  -> PrestoDOM (Effect Unit) w
view push (Config config) =
    linearLayout
    [ height $ V 60
    , width MATCH_PARENT
    , orientation HORIZONTAL
    , padding config.parentPadding
    , background $ config.background
    , gravity $ CENTER
    , translationY config.translationY
    , translationZ config.translationZ
    ] 
    ([ imageView
        [ height $ V 24
        , width $ V 40
        , gravity LEFT
        , imageUrl $ config.imageUrl
        ]
    , textView
        [ height $ V 32
        , weight 1.0
        , padding $ config.padding
        , gravity CENTER_VERTICAL
        , color config.textColor 
        , textSize config.textSize
        , text $ config.text 
        , typeface config.typeface
        , visibility if config.inputVisibility then GONE else VISIBLE
        , fontStyle config.font
        ]
    , editText
        [ height $ V 32
        , weight 1.0
        , padding $ config.padding
        , gravity CENTER_VERTICAL
        , typeface $ config.textStyle 
        , color $ config.textColor
        , background $ config.background
        , textSize $ config.textSize
        , hint config.hintText
        , hintColor config.hintColor
        , visibility if config.inputVisibility then VISIBLE else GONE
        ]
    ] <> body push config)

body push config =
       case config.iconDirection of
            Left -> icon push config
            _ -> []
        <>
        [ textView
            [ height $ V 32
            , padding(Padding 5 0 5 0)
            , gravity CENTER_VERTICAL
            , color "#ffffff"   
            , textSize 22
            , text config.secondaryText
            , visibility $ config.secondaryTextVisible
            , fontStyle config.font
            ]
        ]
        <>
        case config.iconDirection of
            Right -> icon push config
            _ -> []
    

icon push config = 
    [ imageView
        [ height config.actionIconSize
        , width config.actionIconSize
        , imageUrl config.actionIcon
        , visibility $ config.iconVisibility
        , onClick push $ const $ ActionIconClicked
        ]
    ]
