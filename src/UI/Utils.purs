module UI.Utils where

import Data.Array (drop, filter, foldl, mapWithIndex, take, unsnoc, (!!), (..))
import Data.Int (fromString)
import Data.Maybe (Maybe(..), fromMaybe, maybe)
import PrestoDOM --(ElemSpec(..), Length(..), Margin(..), Orientation(..), PrestoDOM, Props, VDom(..), height, linearLayout, margin, orientation, width)
--import PrestoDOM.Utils ((<<>), (<>>))


import Prelude

-- import DOM.Event.Types as DOM
import Data.String (Pattern(..), contains)
import Halogen.VDom.DOM.Prop (Prop(..))
-- import PrestoDOM (Prop, PropEff)

foreign import getAllDrawables :: Unit -> String
-- foreign import registerEvent :: forall a eff. String -> (a ->  PropEff eff) -> Unit
-- foreign import backPressHandlerImpl :: forall eff. PropEff eff
foreign import _density :: Unit -> Number

-- backPressHandler :: forall eff.  (DOM.Event → PropEff eff)
-- backPressHandler = \ev -> do
--     _ <- backPressHandlerImpl
--     pure unit

isDrawable :: String -> Boolean
isDrawable name = (contains (Pattern name) (getAllDrawables unit))

-- attachBackPressHandler :: forall a eff. (a ->  PropEff eff) -> (Unit -> a) -> Prop (PropEff eff)
-- attachBackPressHandler push f = Handler (DOM.EventType "onClick") (Just <<< backPressHandler)

density :: Number
density = _density unit

dpfy :: Number -> Number
dpfy = mul density

------ ********* ------

-- -- | Calculate the margin already present in a properties array. Returns zeroes if margin is not set there.
-- foreign import getMargin :: forall i. Props i -> Array Int
-- foreign import getPropVal :: forall i. Props i -> String -> String

-- -- | Checks whether spacing should be applied on an element. Uses children array and index because of performance reasons.
-- foreign import shouldApplySpacing :: forall i w. Int -> Array (PrestoDOM i w) -> (PrestoDOM i w -> Props i) -> Boolean

-- foreign import computeDimensions :: forall i. Props i -> Array (Props i) -> Props i

-- -- | Modifies the elements such that extra margin is added to them to add spacing between the elements in the box layout.
-- -- | When the element has a margin already set, then the spacing value will be added to the existing margin value set.
-- spacing :: forall i w. Orientation -> Int -> Array (PrestoDOM i w) -> Array (PrestoDOM i w)
-- spacing direction value elements =
--   case unsnoc elements of
--     Just { init: arr, last: lastElem } -> case direction of
--         VERTICAL   -> (spacedElements 0 value arr) <> [lastElem]
--         HORIZONTAL -> (spacedElements value 0 arr) <> [lastElem]

--     Nothing -> elements
--   where
--     spacedElements hMargin vMargin = mapWithIndex (\index elem ->
--         if shouldApplySpacing index elements getProps then
--           addMargin elem hMargin vMargin
--         else
--           elem)

--     addMargin :: PrestoDOM i w -> Int -> Int -> PrestoDOM i w
--     addMargin vDom hMargin vMargin = do
--       let props = getProps vDom
--       let marginVal = getMargin props

--       let left   = (fromMaybe 0 $ marginVal !! 0)
--       let top    = (fromMaybe 0 $ marginVal !! 1)
--       let right  = (fromMaybe 0 $ marginVal !! 2) + hMargin
--       let bottom = (fromMaybe 0 $ marginVal !! 3) + vMargin

--       changeProps vDom $ props <>> [ margin $ Margin left top right bottom ]

-- -- | Helper function to change the properties of a PrestoDOM node
-- changeProps :: forall i w. PrestoDOM i w -> Props i -> PrestoDOM i w
-- changeProps (Elem  (ElemSpec a b _) c) newProps = Elem  (ElemSpec a b newProps) c
-- changeProps (Keyed (ElemSpec a b _) c) newProps = Keyed (ElemSpec a b newProps) c
-- changeProps vDom _ = vDom

-- -- | Helper function to get the properties of a PrestoDOM node
-- getProps :: forall i w. PrestoDOM i w -> Props i
-- getProps (Elem  (ElemSpec _ _ a) _) = a
-- getProps (Keyed (ElemSpec _ _ a) _) = a
-- getProps _ = []

-- -- | Helper function to get the children of a PrestoDOM node
-- getChildren :: forall i w. PrestoDOM i w -> Array (PrestoDOM i w)
-- getChildren (Elem _ children) = children
-- getChildren _ = []

-- -- | Helper function to change the children of a PrestoDOM node
-- changeChildren :: forall i w. PrestoDOM i w -> Array (PrestoDOM i w) -> PrestoDOM i w
-- changeChildren (Elem spec _) children = Elem spec children
-- changeChildren node _ = node

-- -- | A box is a wrapping around linearLayout that automatically applies spacing between children. There is no need to
-- -- | set the orientation in properties as it is set automatically by this function.
-- box :: forall i w. Orientation -> Int -> Props i -> Array (PrestoDOM i w) -> PrestoDOM i w
-- box direction spacingValue props children = linearLayout ([orientation direction] <<> props) $ spacing direction spacingValue children

-- -- | A vBox is a Box with vertical direction.
-- vBox :: forall i w. Int -> Props i -> Array (PrestoDOM i w) -> PrestoDOM i w
-- vBox = box VERTICAL

-- -- | A hBox is a box with horizontal direction.
-- hBox :: forall i w. Int -> Props i -> Array (PrestoDOM i w) -> PrestoDOM i w
-- hBox = box HORIZONTAL

-- -- | Structure to get rows and columns in grid
-- data RowCol = RowCol Int Int

-- -- | gridBox structures the given array of components into RowCol grid
-- gridBox :: forall i w. RowCol -> Int -> Props i -> Array (PrestoDOM i w) -> PrestoDOM i w
-- gridBox (RowCol rows cols) spacingVal props children = do
--   let gridH = getHeight props
--   let gridW = getWidth props
--   let rowElements = map (\i -> take cols (drop (i*cols) children)) (0 .. (rows - 1))
--   let filteredRowEle = filter (\rowEle -> case rowEle of
--                                             [] -> false
--                                             _ -> true) rowElements
--   vBox spacingVal props $ (map (\colElements -> hBox spacingVal [ height $ getMaxHeight colElements, width gridW ] colElements) filteredRowEle)

-- -- | gets height property from Props
-- getHeight :: forall i. Props i -> Length
-- getHeight props = maybe MATCH_PARENT (\a -> V a) $ fromString $ getPropVal props "height"

-- -- | gets width property from Props
-- getWidth :: forall i. Props i -> Length
-- getWidth props = maybe MATCH_PARENT (\a -> V a) $ fromString $ getPropVal props "width"

-- -- | Helper function that recomputes the dimensions of PrestoDOM nodes to remove the WRAP_CONTENT from them.
-- -- | This function is recursive, so it is enough to call it with the root node.
-- unWrapContent :: forall i w. PrestoDOM i w -> PrestoDOM i w
-- unWrapContent node =
--   let newChildren = map unWrapContent $ getChildren node
--       newProps = computeDimensions (getProps node) (map getProps newChildren)

--   in (flip changeProps newProps <<< flip changeChildren newChildren) node

-- -- | gets max height from Array of VDom elements
-- getMaxHeight :: forall i w. Array (PrestoDOM i w) -> Length
-- getMaxHeight eleArr = foldl (\maxH ele -> do
--                                   let props = getProps ele
--                                   case maxH of
--                                     MATCH_PARENT -> maxH
--                                     WRAP_CONTENT -> maxH -- assuming maxH will never get WRAP_CONTENT
--                                     V a -> case (getHeight props) of
--                                             MATCH_PARENT -> MATCH_PARENT
--                                             WRAP_CONTENT -> V a
--                                             V b -> do
--                                               let marginArr = getMargin props
--                                               let verMar = fromMaybe 0 $ (\marArr -> do
--                                                                                   top <- marArr !! 1
--                                                                                   bottom <- marArr !! 3
--                                                                                   Just $ top + bottom) marginArr
--                                               if (b + verMar) > a then V (b + verMar) else V a) (V 0) eleArr