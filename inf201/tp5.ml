(*

Cpt rendu TP 5

date
mercredi 14 février 2018, 12:45:11 (UTC+0100)

étudiants
Joris Placette
Matéo Perez
*)

(* 3.2 *)

(*char codé sur 1 octet donc interval concerné = [0,255] car 2^8 = 256 *)


let rec fact1 n = 
	if (n = 0) then 1 else (n * fact1 (n-1) )
;;

(*let fact2 n = 
	if (n = 0) then 1 else (n * fact2 (n-1) ) ;;
*)

(* sans rec on a message d'erreur *)

type natPeano = O | P of natPeano
;;
(* type natBaton =  0 | 1 ;; NOUS N'AVONS PAS COMPRIS LE SUJET AVEC LES BATONS :/  *)

let rec natPeano_of_int (n:int) : natPeano = 
	match n with
	 0           -> O 
	| n (* p-1 *) -> P ( natPeano_of_int  (n-1) )
;;

let rec int_of_natPeano (n:natPeano) : int = 
	match n with
	O -> 0
	|P(x) -> ( ( int_of_natPeano x) + 1) (* déclaration implicite de x pour l'utiliser après '->' .*)
;;

(* let rec addP (n: natPeano)(o: natPeano) : natPeano =
	match  *)

let rec add (n1:natPeano)(n2:natPeano) : natPeano = 
	match n1,n2 with
		|	O			, O 		-> O 
		| (P x) , O 		-> (P x)
		| O			, (P y) -> (P y)
		| (P x) , (P y)	-> (P (P (add x y)))
;;

let a = natPeano_of_int 2 ;;
let b = natPeano_of_int 3 ;;
let aPlusb = add a b ;; 

assert(add a b = add b a ) ;;
assert(aPlusb = add a (add b O));;

(* 3.3 *)

let quotient (a:int) (b: int) : int  = 
	let rec quo_rec c d acc = 
		if c-d*acc < d then acc
		else quo_rec a b (acc+1)
	in 
		quo_rec a b 0 ;;

assert(quotient 5 2 = 2);;
assert(quotient 5 20 = 0) ;;

let modu (a:int) (b: int) : int  = 
	let rec modu_rec c d acc = 
		if c-d*acc < d then c-d*acc
		else modu_rec a b (acc+1)
	in 
		modu_rec a b 0 ;;

assert(modu 5 2 =1 );;
assert(modu 5 20 = 5) ;;

let qr (a:int) (b:int): int*int  = 
	((quotient a b), (modu a b))
;;
assert(qr 5 2 = (2,1));;
(*nb : (2,1) != 2,1 *)


