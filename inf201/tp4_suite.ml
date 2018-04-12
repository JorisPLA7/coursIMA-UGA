
(*

Cpt rendu TP 4

date
mercredi 14 février 2018, 12:45:11 (UTC+0100)

étudiants
Joris Placette
Matéo Perez
*)

(*char codé sur 1 octet donc interval concerné = [0,255] car 2^8 = 256 *)

(*2.12.1 
q3
tel que : - : int -> string = <fun>

q4
tel que : - : string -> int = <fun>
	 
q6 cf int_of_char et char_of_int 

2.14
q4
	"on prendra soin de ne pas réécrire du code déjà écrit " -> c'est noté !
*)

let carhex (a:int) : string = 
	if a<10 then string_of_int a else
		match a with 
			10-> "A"
			|11 -> "B"
			|12 -> "C"
			|13 -> "D"
			|14 -> "E"
			|15 -> "F"
;;

let ecriture_hex (a : int) : string = 
	let c3, c2, c1 ,c0 = 16*16*16, 16*16, 16, 1 in
		let b3 = a/c3 in
		let b2 = (a-b3*c3)/c2 in 
		let b1 = (a-b3*c3-b2*c2)/c1 in
		let b0 = (a-b3*c3-b2*c2-b1*c1) in
			carhex b3 ^ carhex b2 ^ carhex b1 ^ carhex b0
;;

assert (ecriture_hex 1342 = "053E") ;;
assert (ecriture_hex 0x123A = "123A")

(*Fin TP4*)

 
