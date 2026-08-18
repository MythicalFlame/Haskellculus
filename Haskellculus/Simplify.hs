module Haskellculus.Simplify ( simplify ) where
import Haskellculus.MExp

simplify :: MExp -> MExp
simplify x@(Lit _) = x
simplify Pi = Pi
simplify x@(Var _) = x
simplify (Add (Lit 0) f) = f
simplify (Add f (Lit 0)) = f
simplify (Add (Lit x) (Lit y)) = Lit (x + y)
simplify (Add f g)
  | fs == f && gs == g = Add fs gs
  | otherwise          = simplify (Add fs gs)
  where
    fs = simplify f
    gs = simplify g
simplify (Mul (Lit 0) _) = Lit 0
simplify (Mul _ (Lit 0)) = Lit 0
simplify (Mul (Lit 1) f) = f
simplify (Mul f (Lit 1)) = f
simplify (Mul (Lit x) (Lit y)) = Lit (x * y)
simplify (Mul f g)
  | fs == f && gs == g = Mul fs gs
  | otherwise          = simplify (Mul fs gs)
  where
    fs = simplify f
    gs = simplify g
simplify (Div (Lit 0) _) = Lit 0
simplify (Div f (Lit 1)) = f
simplify (Div (Lit x) (Lit y)) = Lit (x / y)
simplify (Div f g)
  | fs == f && gs == g = Div fs gs
  | otherwise          = simplify (Div fs gs)
  where
    fs = simplify f
    gs = simplify g
simplify (Pow _ (Lit 0)) = Lit 1
simplify (Pow (Lit 0) _) = Lit 0
simplify (Pow (Lit 1) _) = Lit 1
simplify (Pow f (Lit 1)) = f
simplify (Pow f g)
  | fs == f && gs == g = Pow fs gs
  | otherwise          = simplify (Pow fs gs)
  where
    fs = simplify f
    gs = simplify g
simplify (Ln (Lit 1)) = (Lit 0)
simplify (Ln f)
  | fs == f   = Ln fs
  | otherwise = simplify (Ln fs)
  where fs = simplify f
simplify (Sin (Lit x)) = (Lit 0)
simplify (Sin f)
  | fs == f   = Sin fs
  | otherwise = simplify (Sin fs)
  where fs = simplify f
simplify (Cos (Lit 0)) = (Lit 1)
simplify (Cos f)
  | fs == f   = Cos fs
  | otherwise = simplify (Cos fs)
  where fs = simplify f
