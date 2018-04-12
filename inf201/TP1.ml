(*

Cpt rendu TP 1

date
jeudi 25 janvier 2018, 15:39:03 (UTC+0100)

étudiant
Joris Placette

*)

(*
2.1.1 Q1->Q4
  Spécification de /:
    Division euclidienne sur les entiers
  Spécification de /.:
    Division sur les flottants.
  Spécification de a mod b:
    a et b entiers retourne la classe de a dans l'ensemble *Z*b

2.1.2
  Q8
*)
(*false=2=3;;
Error: This expression has type int but an expression was expected of type
         bool*)
2=3=false;;(*)
- : bool = true
    Donc les évaluations sont effectuées jusqu'a trouver un resultat faux,
sinon jusqu'au bout
  Q9 
    Je n'en conclus rien
  Q10
    not a la priorité sur && qui a la priorité sur ||

2.1.3
  Q11
    en cas d'assertion fausse le programme plante
  Q13
    lors de son appel a se comporte comme sa valeur 
  Q14  
*)
let a: int = 5;;

if a < 10
  then true
  else false
  ;;
(*
- : bool = true
    cette expression est correcte

2.2.1
  Q1 *)
let max2 (a:int) (b:int) : int = ((a+b)+abs(a-b))/2 ;;
(*val max2 : int -> int -> int = <fun>
  # max2 5 6;;                                         
  - : int = 6
  
  Q2
    abs est la val absolue de l'entier fourni
# abs;;
- : int -> int = <fun>
# 

2.2.3
  Q5
  *)
let max3_v1 (a:int) (b:int) (c:int) : int = 
  if a>=c && a>=b then a                      
  else if b>=c then b                         
  else c                                      
  ;;

(*val max3_v1 : int -> int -> int -> int = <fun>
# max3_v1 12 3  4                             
  ;;
- : int = 12

  Q6
*) 
let max3_v2 (a:int) (b:int) (c:int) : int = 
  if a>= b
  then 
    if a>=c then a else c
  else
    if b>=c then b else c
    ;;
max3_v2 4 5 6 ;;
(* - : int = 6
 
  Q7
*)

let max3_v3 (a:int) (b:int) (c:int) : int = 
  let m = max2 a b
  in max2 m c
  ;;
(*Q9 *)

let max3_v4 (a:int) (b:int) (c:int) : int = 
  let m = if a>=b then a else b in 
  if c>= m then c else m
  ;;
