(*

Cpt rendu TP 6

date
jeudi 1 mars 2018, 15:32:15 (UTC+0100)

étudiants
Joris Placette
Matéo Perez
*)

type seq_int = Nil |  Cons of int*seq_int ;;
(* definition de type réccursif *)
type releve = seq_int ;; 

let nbJoursSans (a:releve) : int = 
  let rec nbJours_rec (n : int) (seq : releve) : int = 
    match seq with
    |Nil -> n
    |Cons(0,b) -> (nbJours_rec (n+1) b)
    |Cons(cpt,b) ->(nbJours_rec n b)
  in 
    nbJours_rec 0 a 
;;

let tut_tut : releve = Cons(4, Cons( 2 , Cons(0 , Cons(0 , Nil )))) ;;

assert(nbJoursSans tut_tut = 2);;

let cptJours (a:releve) (x:int): int = 
  let rec nbJours_rec (n : int) (seq : releve) (x1: int) : int = 
    match seq,x1 with
    |Nil,x2 -> n
    |Cons(blah,b),x2 ->if blah = x2 then (nbJours_rec (n+1) b x1) else (nbJours_rec n b x1)
  in 
    nbJours_rec 0 a x
;;
(* on dirait un peu la correction du 4.1.1 q6 mais on a trouvé et fait à notre manière donc c'est pas forcément pareil. *)

let flux_app (x : int) (r : releve) : bool =
  if (cptJours r x) = 0 then false else true ;;


type 't sequ = Nil | Cons of 't*('t sequ) ;;

let rec app (x : 't) (r : 't sequ) : bool =
    match (r),x with
    |Nil,x2 -> false
    |Cons(blah,b),x2 ->if blah = x2 then true else (app  (x2) (b))
;;



let alfabey : string sequ = Cons ("a", Cons ("b", Cons ("c", Cons ("d", Nil))))
;;

assert((app ("a") alfabey) = true)
;;
assert((app ("aserkhgtrghjkhluvgfdh") alfabey) = false)
;;

type seq_int = Nil |  Cons of int*seq_int ;;
(* on redef les Nil et les Cons *)
type releve = seq_int ;; 
let tut_tut : releve = Cons(4, Cons( 2 , Cons(0 , Cons(0 , Nil )))) ;;

type releveNV = releve (* non - vide *)

let fluxmin (seq : releveNV) : int = 
  let rec min (seq  : releveNV) (mn : int) : int = 
    match seq, mn with
    Nil, mn -> mn
    | Cons(x, b), mn -> if x < mn then min b x else min b mn

    in let Cons(a,b) = seq in min seq a ;;

assert(fluxmin tut_tut =0);;







