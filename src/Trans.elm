module Trans exposing (transl)

import Dict

latArab = Dict.fromList [ ("&" , "\u{0621}") -- hamza
                        , ("a" , "\u{0623}") -- a hamza
                        , ("i" , "\u{0626}") -- i hamza
                        , ("u" , "\u{0624}") -- u hamza
                        , ("e" , "\u{0629}") -- ta marbuta
                        , ("$" , "\u{0651}") -- shadda
                        , ("'" , "\u{0627}") -- alif
                        , ("b" , "\u{0628}") -- ba
                        , ("t" , "\u{062A}") -- ta
                        , ("j" , "\u{062c}") -- jim
                        , ("H" , "\u{062d}") -- Ha
                        , ("x" , "\u{062e}") -- xa
                        , ("d" , "\u{062f}") -- dal
                        , ("r" , "\u{0631}") -- re
                        , ("z" , "\u{0632}") -- ze
                        , ("s" , "\u{0633}") -- sin
                        , ("S" , "\u{0635}") -- Sad
                        , ("D" , "\u{0636}") -- Zad
                        , ("T" , "\u{0637}") -- Ta
                        , ("Z" , "\u{0638}") -- Za
                        , ("A" , "\u{0639}") -- Ain
                        , ("f" , "\u{0641}") -- fa
                        , ("q" , "\u{0642}") -- qaf
                        , ("k" , "\u{0643}") -- kaf
                        , ("l" , "\u{0644}") -- lam
                        , ("m" , "\u{0645}") -- mim
                        , ("n" , "\u{0646}") -- nun
                        , ("w" , "\u{0648}") -- vav
                        , ("h" , "\u{0647}") -- ha
                        , ("y" , "\u{064a}") -- ya
                        , ("0" , "\u{0660}") -- 0
                        , ("1" , "\u{0661}") -- 1
                        , ("2" , "\u{0662}") -- 0
                        , ("3" , "\u{0663}") -- 0
                        , ("4" , "\u{0664}") -- 0
                        , ("5" , "\u{0665}") -- 0
                        , ("6" , "\u{0666}") -- 0
                        , ("7" , "\u{0667}") -- 0
                        , ("8" , "\u{0668}") -- 0
                        , ("9" , "\u{0669}") -- 0
                        , ("?" , "\u{061f}") -- ?
                        , ("," , "\u{060C}") -- ,  
                        , ("_" , "") -- filter _
                        ]

latArab_= Dict.fromList [ ("a" , "\u{0622}") -- madda
                        , ("i" , "إ")
                        , ("t" , "\u{062b}") -- tha
                        , ("d" , "\u{0630}") -- dhal
                        , ("s" , "\u{0634}") -- shin
                        , ("g" , "\u{063a}") -- ghain
                        , ("y" , "\u{0649}") -- alif maqsoura
                        ]

subst : String -> (Dict.Dict String String) -> String
subst car dict =
  Maybe.withDefault car (Dict.get car dict)

subst_ : (String,String) -> String
subst_ dble =
  let
     (carac, sub) = dble
  in
    if sub == "_" then subst carac latArab_ else subst carac latArab

szip : String -> List (String,String)
szip s =
  let
    ls = s |> String.toList |> List.map String.fromChar
  in
    List.map2 Tuple.pair ls ("&" :: ls)

transl : String -> String
transl chaine =
  szip chaine
   |> List.map subst_
   |> List.foldr (++) ""
