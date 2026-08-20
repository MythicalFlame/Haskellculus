module Haskellculus.MExp (MExp(..)) where

data MExp = Lit Rational | Pi | E | Var String | Add MExp MExp | Mul MExp MExp | Div MExp MExp | Pow MExp MExp | Ln MExp | Sin MExp | Cos MExp deriving (Show, Read, Eq)
