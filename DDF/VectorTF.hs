{-# LANGUAGE
  NoImplicitPrelude,
  NoMonomorphismRestriction,
  FlexibleContexts
#-}

module DDF.VectorTF where

import qualified DDF.Ordering as Ordering
import qualified DDF.Double as Double
import qualified DDF.Meta.VectorTF as M
import qualified Prelude as M

class (Ordering.ObjOrd2 r M.VectorTF (Ordering.Ord r) (Ordering.Ord r), Double.Double r) => VectorTF r where
  zero :: r h (M.VectorTF t f)
  basis :: r h (t -> M.VectorTF t f)
  plus :: r h (f -> f -> M.VectorTF t f)
  mult :: r h (M.Double -> f -> M.VectorTF t f)
  vtfMatch :: r h (a -> (t -> a) -> (f -> f -> a) -> (M.Double -> f -> a) -> M.VectorTF t f -> a)

vtfMatch4 = Double.app4 vtfMatch
vtfMatch5 = Double.app5 vtfMatch
plus2 = Double.app2 plus
mult1 = Double.app mult
mult2 = Double.app2 mult