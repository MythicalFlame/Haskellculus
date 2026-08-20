module Haskellculus.Latexify (latexify) where
import Haskellculus.MExp
import Data.Ratio (numerator, denominator)

latexify :: MExp -> String
latexify exp = latexifyPrecedence exp 0

--add has precedence 1, mul has 2
latexifyPrecedence :: MExp -> Int -> String
latexifyPrecedence (Lit x) p
  | denominator x == 1 && numerator x >= 0 = show (numerator x)
  | denominator x == 1 && numerator x < 0  = checkParens (p > 2) $ show (numerator x)
  | numerator x < 0                        = checkParens (p > 2) $ "-\\frac{" ++ show (abs (numerator x)) ++ "}{" ++ show (denominator x) ++ "}"
  | otherwise                              = "\\frac{" ++ show (numerator x) ++ "}{" ++ show (denominator x) ++ "}"
latexifyPrecedence Pi _ = "\\pi"
latexifyPrecedence E _ = "e"
latexifyPrecedence (Var x) _ = x
latexifyPrecedence (Add f g) p = checkParens (p > 1) $ latexifyPrecedence f 1 ++ " + " ++ latexifyPrecedence g 1
latexifyPrecedence (Mul f g) p = checkParens (p > 2) $ latexifyPrecedence f 2 ++ " \\cdot " ++ latexifyPrecedence g 2
latexifyPrecedence (Div f g) _ = "\\frac{" ++ latexifyPrecedence f 0 ++ "}{" ++ latexifyPrecedence g 0 ++ "}"
latexifyPrecedence (Pow f g) _ = latexifyPrecedence f 3 ++ "^{" ++ latexifyPrecedence g 0 ++ "}"
latexifyPrecedence (Ln f) _ = "\\ln(" ++ latexifyPrecedence f 0 ++ ")"
latexifyPrecedence (Sin f) _ = "\\sin(" ++ latexifyPrecedence f 0 ++ ")"
latexifyPrecedence (Cos f) _ = "\\cos(" ++ latexifyPrecedence f 0 ++ ")"

checkParens :: Bool -> String -> String
checkParens True s = "(" ++ s ++ ")"
checkParens False s = s
