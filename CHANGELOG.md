# Revision history for haskellculus

## 0.2.0.0 -- 2026-08-19

* Added latexify function, which turns an MExp into a String in LaTeX format

## 0.1.0.3 -- 2026-08-19

* The executable now simplifies before differentiating 
* Set d/dx (0^f(x)) = 0, to avoid making an expression that divides by 0

## 0.1.0.2 -- 2026-08-18

* Fixed having Sin (Lit x) = Lit 0 for any x instead of Sin (Lit 0) = Lit 0
* Added simplifications for Sin Pi and Cos Pi

## 0.1.0.1 -- 2026-08-18

* Pow (Lit 0) (Lit 0) now simplifies to 1

## 0.1.0.0 -- 2026-08-18

* Symbolically differentiates expressions
* The simplifier is very basic and (hopefully?) will be improved soon
* I still need to write a good parser, but for now im just using deriving Read
