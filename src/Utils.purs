module Utils where

import Prelude
import PrestoDOM
import Effect (Effect)
import Presto.Core.Flow (Flow, doAff, oneOf, runScreen, runUI,showScreen)

foreign import getLabelHeight :: String -> String -> Int -> Int -> Int -> Int
foreign import getLabelWidth :: String -> String -> Int -> Int -> Int -> Int
foreign import screenWidth :: Unit -> Int
foreign import getOS :: Unit -> String
foreign import setScreen' :: forall e. String -> Effect Unit
foreign import exitSDK' :: forall a. a -> Int -> Unit
foreign import log :: forall a. String -> a -> a
foreign import dropLastChar :: String -> String 

os :: String
os = getOS unit

multipleLine :: forall i. String -> Prop i
multipleLine = prop (PropName "multipleLine")

userInteraction :: forall i. Boolean -> Prop i
userInteraction = prop (PropName "userInteraction")

setScreen :: forall eff . String -> Effect Unit
setScreen fragmentName = do
  setScreen' fragmentName

exitSDK :: forall a. a -> Int -> Flow Unit
exitSDK response code = do
  pure $ exitSDK' response code