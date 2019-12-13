module Animations where


import Prelude

import Data.Array (concatMap)
import Data.Tuple (Tuple(..))
import Foreign.Object (Object, fromFoldable)
import PrestoDOM.Types.Core (class IsProp, PropName(..))
import Simple.JSON (writeJSON)

import Data.Generic.Rep (class Generic)
import Foreign.Class (class Decode, class Encode)
import Presto.Core.Utils.Encoding (defaultDecode, defaultEncode)

type Anim = Object String

data Easing = EaseIn | EaseOut | EaseInOut | Linear | Bounce | Spring | CustomEase

derive instance genericEasing :: Generic Easing _
instance decodeEasing :: Decode Easing where decode = defaultDecode
instance encodeEasing :: Encode Easing where encode = defaultEncode

type Animator prop value = Tuple prop (Tuple value value)

animator :: forall val. IsProp val => Show val => PropName val -> val -> val -> Animator (PropName val) val
animator propName from to = Tuple propName (Tuple from to)

-- animation properties
ease :: Easing -> Object String
ease EaseIn    = fromFoldable [ Tuple "easing" "ease-in" ]
ease EaseOut   = fromFoldable [ Tuple "easing" "ease-out" ]
ease EaseInOut = fromFoldable [ Tuple "easing" "ease-in-out" ]
ease Linear    = fromFoldable [ Tuple "easing" "linear" ]
ease Bounce    = fromFoldable [ Tuple "easing" "bounce" ]
ease Spring    = fromFoldable [ Tuple "easing" "spring" ]
ease CustomEase = fromFoldable [ Tuple "easing" "0.17,0.59,0.4,0.77" ]

duration :: Number -> Object String
duration val = fromFoldable [ Tuple "duration" (show val) ]

delay :: Number -> Object String
delay val = fromFoldable [ Tuple "delay" (show val) ]

onEnd :: String -> Object String
onEnd nextAnimId = fromFoldable [ Tuple "onEnd" nextAnimId ]

runOnRender :: Object String
runOnRender = fromFoldable [ Tuple "startImmediate" "true" ]

runOnRender' :: Object String
runOnRender' = fromFoldable [ Tuple "runOnRender" "true" ]

repeat :: Int -> Object String
repeat count = fromFoldable [ Tuple "repeatCount" (show count) ]

repeatAlternate :: Object String
repeatAlternate = fromFoldable [ Tuple "repeatAlternate" "true" ]

id :: String -> Object String
id animId = fromFoldable [ Tuple "id" animId ]

propAnim :: forall val. Show val => Array (Animator (PropName val) val) -> Object String
propAnim animators =
    fromFoldable [ Tuple "props" (writeJSON $ concatMap (\(Tuple (PropName name) (Tuple from to)) -> [{ "prop": name, "from": (show from), "to": (show to) }]) animators) ]



-- Animations 

fade :: String -> Number -> Number -> Object String
fade animId from to = id animId <>             -- animation hook
                      duration 250.0 <>       -- animation duration
                      ease EaseInOut <>           -- animation curve
                      propAnim [               -- animation properties
                        animator (PropName "alpha") from to
                      ]

translateY :: String -> Number -> Number -> Number -> Easing -> Object String
translateY animId from to time curve = id animId <>             -- animation hook
                      duration time <>       -- animation duration
                      ease curve <>           -- animation curve
                      propAnim [               -- animation properties
                        animator (PropName "translationY") from to
                      ]
