module Engineering.Helpers.Events where

import Prelude
import PrestoDOM
import Web.Event.Event (EventType(..), Event) as DOM
import PrestoDOM.Types.Core
import Data.Maybe (Maybe(..))
import Halogen.VDom.DOM.Prop (Prop(..))
import Unsafe.Coerce as U
import Effect 
-- import UI.Utils (registerEvent)


makeEvent push = \ev -> do
    _ <- push (U.unsafeCoerce ev)
    pure unit

-- onMenuItemClick :: forall a eff. (a -> Effect Unit ) -> (Int -> a) -> Prop (Effect Unit)
-- onMenuItemClick push f = Handler (DOM.EventType "onMenuItemClick") (Just <<< (makeEvent (push <<< f)))

-- onFocus :: forall a eff. (a -> Effect Unit ) -> (Boolean -> a) -> Prop (Effect Unit)
-- onFocus push f = Handler (DOM.EventType "onFocus") (Just <<< (makeEvent (push <<< f <<< toBool)))

-- onLongPress :: forall a eff. (a -> Effect Unit ) -> (Boolean -> a) -> Prop (Effect Unit)
-- onLongPress push f = Handler (DOM.EventType "onLongPress") (Just <<< (makeEvent (push <<< f)))

toBool :: String -> Boolean
toBool "false" = false
toBool _ = true

foreign import timerHandlerImpl :: forall  a. Int -> Int -> (a -> Effect Unit) -> Effect Unit
foreign import timerHandlerImplWithIntervalImpl :: forall  a. Number -> (a ->  Effect Unit) -> Effect Unit

foreign import cancelTimerHandler :: Unit -> Unit

-- timerHandler :: forall eff a. Int -> (a ->  Effect Unit) -> (DOM.Event → Effect Unit)
-- timerHandler time push = \ev -> do
--     _ <- timerHandlerImpl time push
--     pure unit

timerHandlerImplWithInterval :: forall a. Number -> (a ->  Effect Unit) -> (DOM.Event → Effect Unit)
timerHandlerImplWithInterval time push = \ev -> do
    _ <- timerHandlerImplWithIntervalImpl time push
    pure unit

attachTimer :: forall a . Int -> Int -> (a ->  Effect Unit) -> (Int -> a) -> Prop (Effect Unit)
attachTimer time interval push f =
  let _ = timerHandlerImpl time interval (push <<< f)
  in Handler (DOM.EventType "executeTimer") (Just <<< const (pure unit))

triggerEvent :: forall a . Number -> (a ->  Effect Unit) -> (Unit -> a) -> Prop (Effect Unit)
triggerEvent time push f = Handler (DOM.EventType "executeCustomEvent") (Just <<< timerHandlerImplWithInterval time (push <<< f))

-- registerNewEvent :: forall a eff. String -> (a ->  Effect Unit) -> (Unit -> a) -> Prop (Effect Unit)
-- registerNewEvent eventType push f = x
--   where
--     x = Handler (DOM.EventType eventType) (Just <<< (makeEvent (push <<< f)))
--     p = registerEvent eventType $ makeEvent (push <<< f)

-- registerNewListener :: forall t31 t34 t41 t42 t43 t44. Semigroupoid t41 => (t31 -> t41 t44 t42 -> Event -> t34) -> t31 -> t41 t43 t42 -> t41 t44 t43 -> Prop t34
-- registerNewListener handler id push f = Handler (DOM.EventType "onChange") (Just <<< (handler id (push <<< f)))


-- registerNewEventWithString :: forall a eff. String -> (a ->  Effect Unit) -> (String -> a) -> Prop (Effect Unit)
-- registerNewEventWithString eventType push f = x
--   where
--     x = Handler (DOM.EventType eventType) (Just <<< (makeEvent (push <<< f)))
--     p = registerEvent eventType $ makeEvent (push <<< f)



-- ****** --
-- exports.timerHandlerImplWithIntervalImpl = function(time) {
-- return function(push) {
-- if (window.__OS.toLowerCase() != "ios") {
-- var clearId = setInterval(function() {
-- push()();
-- }, time * 1000);
-- setTimeout(function() {
-- clearInterval(clearId);
-- }, time * 1000);
-- } else {
-- var timerCallback = callbackMapper.map(function(value) {
-- push()();
-- });
-- JBridge.startTimerWithTime(0, time, timerCallback);
-- }
-- };
-- };
-- foreign import timerHandlerImplWithIntervalImpl :: forall eff a. Number -> (a -> Effect Unit) -> Effect Unit

-- triggerEvent :: forall a eff. Number -> (a -> Effect Unit) -> (Unit -> a) -> Prop (Effect Unit)
-- triggerEvent time push f =
-- let _ = timerHandlerImplWithIntervalImpl time (push <<< f)
-- in Handler (DOM.EventType "executeCustomEvent") (Just <<< const (pure unit))