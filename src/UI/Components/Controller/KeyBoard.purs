module UI.Components.Controller.KeyBoard where

import Prelude
import PrestoDOM.Core
import PrestoDOM.Types.Core

-- import Control.Monad.Eff (Eff)
import Data.Either (Either(..))
import Data.String (length, take)
-- import Engineering.Helpers.Commons (logMe)
-- import FRP (FRP)
import PrestoDOM (onClick)
import PrestoDOM.Utils (continue, continueWithCmd, updateAndExit, exit)

data Action
    = KeyAction Int
    | Clear
    | Proceed 


type State =
    { keyState :: String
    }

eval
    :: Action
    -> State
    -> State
eval (KeyAction int) state = state
eval Proceed state = state
eval Clear state = state