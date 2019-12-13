module UI.Components.View.Offers where 

import UI.Components.Config.Offers
import UI.Components.Controller.Offers
import Effect
import Prelude
import PrestoDOM
import Types

import Animations as A
import Presto.Core.Flow (Flow, initUI, runScreen, showScreen)
import Record as Record
import PrestoDOM
import Type.Prelude (SProxy(..))

eval = (\_ state -> state)

view :: forall w . (Action  -> Effect Unit) -> Config  -> PrestoDOM (Effect Unit) w
view push (Config config) =
   linearLayout
        [ height $ V 120
        , width MATCH_PARENT
        , background $ config.background
        , gravity $ CENTER
        , padding (Padding 0 0 0 0)
        , orientation $ VERTICAL
        , stroke "1,#000000"
        , margin config.margin
        , cornerRadius config.cornerRadius
        ] [
            linearLayout
            [ height $ V 60
            , width MATCH_PARENT
            , background "#ffffff"
            , gravity $ LEFT
            , cornerRadius $ 0.0
            , orientation $ HORIZONTAL
            ]
            [imageView
              [ height $ MATCH_PARENT
              , width $ V 50
              , padding (Padding 10 0 0 0)
              , imageUrl config.cardTypeIcon 
              ]
              
            ,textView
              [ height $ MATCH_PARENT
              , width $ V 325
              , padding (Padding 20 15 10 0)
              , color "#000000"
              , background "#ffffff"
              , textSize 16
              , maxLines 2
              , text $ config.text
              , fontStyle config.font
              ]
            ]
            ,
              linearLayout
                [ height $ V 50
                , width MATCH_PARENT
                , background $ config.background
                , gravity $ RIGHT
                , cornerRadius $ 0.0
                , orientation $ HORIZONTAL
                ] [textView
                    [ height $ V 50
                    , gravity $ RIGHT
                    , typeface BOLD
                    , width MATCH_PARENT
                    , padding (Padding 0 15 20 0)
                    , color "#f90c00"
                    , background "#ffffff"
                    , textSize 16
                    , maxLines 2
                    , text $ "MORE OFFERS" 
                    , fontStyle config.font
                    ]
                  ]

              ]
          
