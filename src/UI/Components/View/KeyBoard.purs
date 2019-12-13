module UI.Components.View.KeyBoard where

import Data.Array
import Prelude
import PrestoDOM
import PrestoDOM.Core
import PrestoDOM.Properties.GetChildProps
import PrestoDOM.Properties.SetChildProps
import PrestoDOM.Types.DomAttributes

import Data.Maybe (Maybe, fromMaybe)
-- import Engineering.Helpers.Events (onLongPress)
import UI.Constant.Accessibility.Default as HINT
import UI.Constant.Color.Default as Color
import UI.Constant.FontColor.Default as FontColor
import UI.Constant.FontSize.Default as FontSize
import UI.Constant.FontStyle.Default as Font
import UI.Constant.Str.Default as STR
import UI.Components.Controller.KeyBoard (Action(..))
import UI.Utils (dpfy)

type Prop =
    { backImg :: Maybe String
    , enterImg :: Maybe String
    }

defaultProp =
    { backImg: "ic_keyboard_back"
    , enterImg: "ic_keyboard_enter"
    }

-- view
--     :: forall w eff
--     . (Action -> PropEff eff)
--     -> Prop
--     -> PrestoDOM (PropEff eff) w
view push prop =
    linearLayout
        [ height $ V 270
        , width MATCH_PARENT
        , orientation VERTICAL
        , background "#F1F1F1"
        , padding $ Padding 20 0 20 0
        ] $ keyboardRow push backImg enterImg <$>
            [ [  1, 2, 3  ]
            , [  4, 5, 6  ]
            , [  7, 8, 9  ]
            , [ -1, 0, 10 ]
            ]
    where
        backImg :: String
        backImg = fromMaybe defaultProp.backImg prop.backImg

        enterImg :: String
        enterImg = fromMaybe defaultProp.enterImg prop.enterImg

        keyboardHeight :: Number
        keyboardHeight = dpfy 256.0


-- keyboardRow :: forall w eff. (Action -> PropEff eff) -> String -> String -> Array Int -> PrestoDOM (PropEff eff) w
keyboardRow push backImg enterImg elems =
    linearLayout
        [ height $ V 64
        , width MATCH_PARENT
        , orientation HORIZONTAL
        ] $ (key push backImg enterImg) <$> elems


-- key :: forall w eff. (Action -> PropEff eff) -> String -> String -> Int -> PrestoDOM (PropEff eff) w
key push backImg enterImg keyVal = 
	linearLayout
		([ height MATCH_PARENT
		, width $ V 40
		, weight 1.0
        , onClick push $ case keyVal of
                            (-1) -> const (Clear)
                            (10) -> const (Proceed) 
                            val -> const (KeyAction keyVal)
		, gravity CENTER
		])
		[ keyBody keyVal ]
    where
        -- keyBody :: Int -> PrestoDOM (PropEff eff) w
        keyBody keyVal =
            case keyVal of
                (-1) -> imageView
                        [ imageUrl backImg
                        -- , allowMultipleClicks
						, height $ V 24
						, width $ V 24
                        ]
                10 -> imageView
                        [ imageUrl enterImg
                        -- , allowMultipleClicks
						, height $ V 48
						, width $ V 48
                        ]
                val -> textView
                        [ text $ show val
                        -- , allowMultipleClicks
						, width MATCH_PARENT
						, gravity CENTER
						, letterSpacing 2.00
						, textSize 32
						, color "#333333"
						, padding $ Padding 0 10 0 20
                        ]


        -- forClear :: Props (PropEff eff)
        forClear = singleton $ onClick push $ const $ Clear