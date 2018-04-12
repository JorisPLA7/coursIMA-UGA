(*

Cpt rendu TP 4

date
jeudi 8 février 2018, 15:16:09 (UTC+0100)

étudiants
Joris Placette
Mateo perez

*)

(*2.9*)
let a : int = 222 ;;
let rec chaine (a : int)(r:int) : int =
  if a <10 then r+a else chaine (a/10) (r+a mod 10)
;;
let somme_ch (a: int) : int = chaine(a)(0) ;;

assert(6 = somme_ch 222);;

(*2.10*)
let poCouple (x,y : 't * 't) : 't * 't =
  if x <= y then (x,y) else (y,x) ;;

assert (poCouple (1,9) = (1,9) && poCouple('g','a') = ('a','g')) ;;
assert (poCouple (true, false) = (false, true) && poCouple(42.,41.9999999 ) = (41.9999999,42.)) ;;
(* trofassil ;)*)

(*2.11*)

type jour = int ;;
type heure = int ;;
type minute = int ;;
type seconde = int ;;
type duree = jour * heure * minute * seconde ;;

let maDuree : duree = 1,1,1,0 ;;
let maDuree2 : duree = 1,2,1,42 ;;


let sec_en_duree (a: int) : duree =
  let jour = a/(60*60*24) and resj = a mod (60*60*24) in 
    let heure = resj/(60*60) and resh = resj mod (60*60) in
      let minute = resh/(60) and seconde = resh mod 60 in
          (jour,heure,minute,seconde)
;;


let duree_en_sec (d : duree) : int =
  let j,h,m,s = d in
  j*60*60*24+h*60*60+m*60+s
;;

let vec_en_duree ((a,b,c,d) : int*int*int*int) : duree = sec_en_duree (duree_en_sec (a,b,c,d)) ;; 
(* on passe par les fonctions pour avoir un resultat correct
càd transformer les 61 sec en 1m1sec par exemple *)

assert (maDuree =  sec_en_duree (duree_en_sec maDuree)) ;;

let somme_duree (d1:duree) (d2: duree) : duree =
  sec_en_duree(duree_en_sec d1 + duree_en_sec d2)
;; 

let eg_duree (d1:duree) (d2: duree) : bool =
  (duree_en_sec d1 = duree_en_sec d2)
;;

let inf_duree (d1:duree) (d2: duree) : bool =
  (duree_en_sec d1 < duree_en_sec d2)
;;

assert (inf_duree maDuree maDuree2);;
assert (eg_duree maDuree (1,1,0,60));;
