let non :('a->bool)->('a->bool)=
  (fun f x-> not (f x));;
  
let rec pour_tous (f : 'a -> bool) (l : 'a list) : bool =
  match l with
  [] -> true
  |x::y -> (f x) && (pour_tous f y);;
  
let rec il_existe (f : 'a -> bool) (l : 'a list) : bool =
  match l with
  [] -> false
  |x::y -> (f x) || (il_existe f y);;
  
let il_existe_v2 (f : 'a -> bool) (l : 'a list) : bool =
  not (pour_tous (non f) l);;


let inf b a : bool = (a<b) ;; 
let l = [1;2;3;40];;
let modzerobis a b : bool = a mod b = 0 ;;

let rec liste_ent (l:int list) (i:int) (n:int) : int list =
  if i<n then (liste_ent (i::l) (i+1) n)
  else l
;;

let liste_ent_inf = liste_ent [] 2 ;;
(* on génère uns liste d'entiers inferieurs au nombre dont on veut déterminer le caractère premier *)


assert(il_existe_v2 (inf 10) l);;

assert(pour_tous (non (modzerobis 101)) (liste_ent_inf 101));;
(* assertion verification du caractère premier d'un entier *)


let est_premier (n:int) : bool = 
  pour_tous (non (modzerobis n)) (liste_ent_inf n) = true;;
(* tout les entiers inf à n ne divisent pas n (crible d'Eratostène) *)

assert(est_premier 2);;
assert(est_premier 101);;
assert(est_premier 7);;
assert(est_premier 11) ;;
assert(est_premier 5449);;

assert(not (est_premier 6)) ;;
assert(not (est_premier 8)) ;;
assert(not (est_premier 12)) ;;
assert(not (est_premier 42));;