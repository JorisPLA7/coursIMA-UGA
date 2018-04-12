(*

Cpt rendu TP 8 (ou 9 ?)

date
vendredi 6 avril 2018, 23:44:34 (UTC+0200)

étudiants
Joris Placette
Matéo Perez

*)

(* 5.1 *)

let add a b : int = a + b ;; 
let rec addCbis a : (int->int) =
  if a=0 then
    function b -> b
  else
    function b -> 1 + addCbis (a-1) b

let comp (f:'a->'a)(g:'a->'a): ('a->'a) = fun x-> f( g x) ;; 

let plussoyer (a:int) : int = a+1 ;;
let doubler a = 2*a ;;

(* J'ai fait ça pour m'échauffer par ce que je ne me souvenais plus de tout ^^ (Joris) *)
let rec incrOfDead (a:int) : (int->int) =
  (* let plussoyer a = a+1 in *)
  if a = 0 then
    function b->b
  else 
    function b->(comp (plussoyer) (incrOfDead (a-1))) b
;;

(* 5.2 *)
let plus_deux (a:int): int = (comp plussoyer plussoyer) a;;

let fois_deux a = 2*a;;


let f1 (x:int) : int = (comp plussoyer fois_deux) x ;;
(* 2*x+1 *)
assert(f1 2 = 5);;

let f2 (x:int) : int = (comp fois_deux plussoyer) x ;; 
(* 2*(x+1) *)
assert(f2 2 = 6);;

(* 5.3 *)

let deriv (f:'a->'a) : ('a->'a) =
  let dx = 0.00000001 in
  function x->(( (f (x +. dx)) -. (f (x)) ) /. dx )
;;

let rec iter (f:'a->'a) (n:int) : 'a->'a = 
  if n = 0 then
    function x->x
  else 
    function x->(comp f (iter f (n-1)) ) x
;;
(* j'aurais pu utiliser match mais ça fonctionne comme ça aussi  *)

let sin4 = (iter sin 4) ;;

(* 5.4 *)

let non (f:'a->bool) : 'a->bool =
  function x-> ( not (f x) )
  ;;

let rec pour_tous (f : 'a -> bool) (l : 'a list) : bool = 
  match l with
  [] -> true
  |a::q -> (f a) && (pour_tous f q )
;;


let rec il_existe (f : 'a -> bool) (l : 'a list) : bool = 
  match l with
  [] -> false
  |a::q -> (f a) || (il_existe f q )
;;

let inf10 a : bool = (a<10) ;; 
let supeg10 = non (inf10);;

let l = [1;2;3;40];;

let il_existe2 (f : 'a -> bool) (l : 'a list) : bool =
  not (pour_tous (non f) l);;
(* etonnement ça ne marche pas en remplaçant dans mes assert en dessous :/ *)

(* on teste tout d'un coup ! *)
assert((il_existe (supeg10)  (l) )= true ) ;;
assert((il_existe2 (supeg10)  (l) )= true ) ;;
(* le résultat est différent je ne saisis pas pourquoi *)


assert((il_existe (inf10)  (l) )= true ) ;;

assert((pour_tous (supeg10)  (l) )= false ) ;;

assert((pour_tous (inf10)  (l) )= false ) ;;


let modzero b a : bool = a mod b = 0 ;;
let div7 = modzero 7;;
let div10 = modzero 10;;

let modzerobis a b : bool = a mod b = 0;;


let ll = [1015; 4305; 728; 861] ;;

assert(pour_tous div7 ll);; 
(* c'est vrai *)

assert(il_existe div10 ll = false);;
(* ce n'est pas vrai *)

(* 5.5 *)
(* ----> /!\ voir fichier tp8bis.ml *)

let cmp (x:int) (y:int) = x-y ;;

let li = [10;12;20;45;78;555];;

(* 
# (<) 5 6 ;;
- : bool = true *)

let rec insertion_pos (pos:int) (l:'a list) (elem:'a) : 'a list =
  match l, pos with
  [], posx -> [elem]
  |a::b , 0 -> elem::a::b
  |a::b, posx -> a::(insertion_pos (posx - 1) b elem)
  ;;

assert(insertion_pos 0 [] "yolo" = ["yolo"]);
assert(insertion_pos 1 li 42 = [10; 42; 12; 20; 45; 78; 555]) ;;

let rec insertion (cmp:'a->'a->bool) (x:'a) (s:'a list) : 'a list =
  match s with
  | []      -> [x]
  | head::tail -> if (cmp x head) then
    x::s
    (* insertion n'est plus appelé reccursivement dès la première occurence ou (cmp x head ) est vrai *)
  else
    head::(insertion cmp x tail)

let il = [2 ; 3 ; 12 ; 3 ; 24 ; 1 ; 2 ; 4 ; 9 ; 6 ; 10]

let rec tri_insertion (cmp:'a->'a->bool) (s:'a list) : 'a list =
  match s with
  [] -> []
  |a::b -> (insertion cmp a (tri_insertion cmp b))
  ;;

assert(tri_insertion (<) il = [1; 2; 2; 3; 3; 4; 6; 9; 10; 12; 24]);;
assert(tri_insertion (<) [] = []);;

(* Q5 manquante désolé 0:) *)

type point = float * float ;;

let abs_f (f:float) : float = if (f < 0.) then (-.f) else f;;


let distO (p:point) : float = 
  let (x, y) = p in
    sqrt (( x*.x ) +. ( y*.y ))

;;

let pl : point list = [(0., 1.);(1., 0.) ;(0., 0.) ;(5., -2.) ;(1., 1.)] ;;
(* 
let point_sort (critere:point->float) (s:point list) : point list =
  match s with 
  [] -> []
  |a::b -> if (distO a) =   *)

(* tri_insertion (fun x y -> ( (distO x ) < (distO y))) pl ;; nous permet
de trier nos points sans créer de nouvelle fonction de tri, là est l'interêt
de l'ordre supperieur pour nous :) *)

(* nous pouvons créer le raccourci suivant : *)
let tri_distO = tri_insertion (fun x y -> ( (distO x ) < (distO y))) ;;

assert( (tri_distO pl )= [(0., 0.); (1., 0.); (0., 1.); (1., 1.); (5., -2.)]);;

(* equivalent de *)
(* 
let tri_distO (pl:point list) : point list =
  tri_insertion (fun x y -> ( (distO x ) < (distO y))) pl ;; *)
