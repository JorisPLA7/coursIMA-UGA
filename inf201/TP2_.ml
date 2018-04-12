(*

Cpt rendu TP 2

date
jeudi 1 février 2018, 16:57:54 (UTC+0100)

étudiants
Joris Placette
Mateo perez

*)

let x=3 and y=2 in x+y;;

let x=10 in 
  let x = 2 and y = x+2 in
    x*y;;
(*aussi maladroit que cela puisse être, cette expression équivaut à *)
let x1=10 in 
  let x2 = 2 and y = x1+2 in
    x2*y;;
  
let x = 5 in
(let x1=3 and y=x+4 in x1+y)+x;;

(*definitions de constantes*)
let a = 10;;
let b = 0;;

let monEt (x: bool) (y:bool) : bool =
  x && y
;;

let moyenne (a:int) (b:int) : float =
  (float_of_int a +. float_of_int b ) /. 2.
;; (*conversion des entiers en flottants*)

let min2 (a)(b) : int = 
  if a<b then a else b
;;

let max2 (a)(b) : int = 
  if a>b then a else b
;;

let max4 (a)(b)(c)(d) : int =
  max2 (max2 a b ) (max2 c d )
;;
  
let min4 (a)(b)(c)(d) : int =
  min2 (min2 a b ) (min2 c d )
;;

let moyol (a)(b)(c)(d) : float =
  (float_of_int (a + b + c + d -(min4 a b c d) - (max4 a b c d)) )/. 2.
;;

let moyol2 (a)(b)(c)(d) : float =
  let min = min4 a b c d and max = max4 a b c d in
  (float_of_int (a + b + c + d - min - max))/. 2.
;; (*fait la meme chose que moyol*)

(* 
# (b <>0)
  ;;
- : bool = false

# a mod b = 0 ;;
Exception: Division_by_zero.

# (b <> 0 ) && (a mod b = 0) ;;
- : bool = false

# (a mod b = 0) && b <> 0;;
Exception: Division_by_zero.

donc si 1ere assertion fausse alors 2e ignorée.

CEPENDANT

# monEt (a mod b = 0) (b <> 0);;
Exception: Division_by_zero.
# monEt (b <> 0) (a mod b = 0) ;;
Exception: Division_by_zero.

Lors d'un appel de fonction , toutes les expressions sont évaluées! 
Donc on dépiste l'intégralité des erreurs de cette manière . 

# moyol2 4 5 6 7
  ;;
- : float = 5.5
# moyol2 12 12 12 12
  ;;
- : float = 12.
 tout semble correct
*)

