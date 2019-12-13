module UI.Components.View.ToolbarV2 where
  
import Effect (Effect)
import Prelude (Unit, ($))
import PrestoDOM 
import UI.Components.Controller.ToolbarV2
import UI.Components.Config.ToolBar

eval :: forall t76 t78. t76 -> t78 -> t78
eval = (\_ state -> state)

view :: forall w . (Action -> Effect Unit) -> Config  -> PrestoDOM (Effect Unit) w
view push (Config config) =
    relativeLayout
        [ height config.height
        , width MATCH_PARENT
        , orientation VERTICAL
        ]
        [ imageView
            [ height MATCH_PARENT
            , width MATCH_PARENT
            , imageUrl "toolbar_voda_bg"
            , scaleType "centerCrop"
            , background "#000000"
            ]
        , linearLayout
            [ height $ V 52
            , width MATCH_PARENT
            , orientation HORIZONTAL
            , padding (Padding 10 10 10 10)
            , gravity CENTER
            ]
            [ imageView
                [ height $ V 32
                , width $ V 32
                , imageUrl $ config.imageUrl
                ]
            , linearLayout
                [ width $ V 0 
                , weight 1.0
                , height $ V 0]
                []
            , imageView  
                [ height $ V 32
                , width $ V 32
                , imageUrl $ config.inputUrl
                , visibility $ config.iconVisibility 
                ]
            ]
        , textView
            [ height MATCH_PARENT
            , width MATCH_PARENT
            , text $ config.text
            , textSize 26
            , margin (MarginBottom 20)
            , color $ config.textColor
            , gravity CENTER
            , fontStyle config.font
            ]
        , linearLayout
            [ height $ V 60
            , width MATCH_PARENT
            , orientation HORIZONTAL
            , background "#60000000"
            , alignParentBottom "true,-1"
            , padding (Padding 10 10 10 10)
            , visibility $ config.textVisibility
            ]
            [ linearLayout
                [ height MATCH_PARENT
                , weight 1.0
                , orientation VERTICAL
                ]
                [ textView
                    [ width MATCH_PARENT
                    , height $ V 16
                    , textSize 14
                    , text "Mobile No"
                    , color "#80e1e1e1"
                    , fontStyle config.font
                    ]
                , textView
                    [ width MATCH_PARENT
                    , height $ V 24
                    , textSize 20
                    , color "#FFFFFF"
                    , text "9876543210"
                    , fontStyle config.font
                    ]
                ]
            , linearLayout
                [ height MATCH_PARENT
                , weight 1.0
                , orientation VERTICAL
                ]
                [ textView
                    [ width MATCH_PARENT
                    , height $ V 16
                    , textSize 14
                    , gravity RIGHT
                    , text "Pay Amount"
                    , color "#80e1e1e1"
                    , fontStyle config.font
                    ]
                , textView
                    [ width MATCH_PARENT
                    , height $ V 24
                    , textSize 20
                    , gravity RIGHT
                    , color "#FFFFFF"
                    , text "10.00"
                    , fontStyle config.font
                    ]
                ]
            ]
        ]