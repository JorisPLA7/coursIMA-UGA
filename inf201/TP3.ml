(*

Cpt rendu TP 3

date
jeudi 1 février 2018, 16:57:54 (UTC+0100)

étudiants
Joris Placette
Mateo perez

*)



type jour = int ;;
type mois = Janvier|Fevrier|Mars|Avril ;;
type date = jour * mois ;;

let maDate : date =  2 , Fevrier ;;

let estJourDansMois (d: date) : bool =
  let j,m = d in
    match m with 
      Janvier | Mars -> true
      | Fevrier -> j<28
      |Avril -> j<31
    
;;

assert(estJourDansMois maDate ==true );;

(*
2.8: 
*)

type intervalle = float * float ;;

let a : float = 5. ;;
let chocolat : intervalle = 7. ,100.45 ;;

let precede (n : float) (i : intervalle) : bool = 
  let a,b = i in
    n<=a
;;


let suit (n : float) (i : intervalle) : bool = 
  let a,b = i in
  n>=b
;;
  

let dans (n : float) (i : intervalle) : bool = 
  let a,b = i in
  n>=a && n<=b
;;

assert ((dans a chocolat == false) && (suit a chocolat == false)) ;;

(* bien entendu , dans 1,2,3 et dans (1,2,3) sont syntaxiquement incorrecte *)

let coteACote (i1 : intervalle) (i2 : intervalle) : bool =
  let ((a,b),(c,d))= (i1,i2) in
    a=d || b=c
;;

let chevauche (i1 : intervalle) (i2 : intervalle) : bool =
  let ((a,b),(c,d))= (i1,i2) in
    ( (dans b i2) && (not (dans a i2) ) ) || ((dans c i1 ) && (not (dans d i1))) 
;;

