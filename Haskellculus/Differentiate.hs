module Haskellculus.Differentiate (differentiate) where
import Haskellculus.MExp

differentiate :: MExp -> String -> MExp
differentiate (Lit _) _ = Lit 0
differentiate Pi _ = Lit 0
differentiate E _ = Lit 0
differentiate (Var v) x
  | v == x    = Lit 1
  | otherwise = Lit 0
differentiate (Add f g) x = Add (differentiate f x) (differentiate g x)
differentiate (Mul f g) x = Add (Mul (differentiate f x) g) (Mul f (differentiate g x))
differentiate (Div f g) x = Div (Add (Mul (differentiate f x) g) (Mul (Lit (-1)) (Mul f (differentiate g x)))) (Mul g g)
differentiate (Pow (Lit 0) g) x = Lit 0
differentiate (Pow f g) x = Mul (Pow f g) (Add (Mul (differentiate g x) (Ln f)) (Div (Mul (differentiate f x) g) f)) 
differentiate (Ln f) x = Div (differentiate f x) f
differentiate (Sin f) x = Mul (differentiate f x) (Cos f)
differentiate (Cos f) x = Mul (differentiate f x) (Mul (Lit (-1)) (Sin f))
