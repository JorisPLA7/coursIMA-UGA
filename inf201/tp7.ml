type monome = int*int ;;
type polynome = monome list;;

let m3 = (2,  3)
and m2 = (3,  2)
and m1 = (-2, 1)
and m0 = (1,  0);;

let p0 = [m3;m2; m1];;
let p1 = [m2; m1; m0];;
let p_somme = [m3;(6,2);(-4,1);m0]
let rec clear (s) : polynome =
  match s with
  [] -> s
  |p::q -> 
    match p with 
      (0,a) -> q
      |_ -> p::q
;;


  
  
    
let derivMono (a,b : monome) : monome = if b > 0 then (a*b,b-1) else (0,0);;

let rec derivPoly (s : polynome) : polynome =  
  match s with
    [] -> s
    |p::q -> derivMono(p)::clear(derivPoly(q)) ;;


(*  :: est le constructeur de la liste , et pour cause : 
sont équivalentes les expressions suivantes : 

[1; 2; 3]
1 :: [2; 3]
1 :: 2 :: [3]
1 :: 2 :: 3 :: []

*)

assert(derivMono(m3)=(6,2)) ;;

assert(derivPoly(p0)=[(6,2); (6,1); (-2,0)]) ;;


let rec sommePoly (p : polynome) (q : polynome) : polynome = 
  match p,q with
  [], []  -> []
  |[], q  -> q
  |p, []  -> p
  |(c1,p1)::p_queue, (c2 ,p2)::q_queue -> 
    if p1=p2 then
      if c1+c2=0 then
      sommePoly p_queue q_queue
      else (c1+c2, p1)::(sommePoly p_queue q_queue)
    else 
      if p1<p2 then
      (c2, p2)::(sommePoly ((c1,p1)::p_queue) q_queue)
      else (c1, p1)::(sommePoly p_queue ((c2,p2)::q_queue))
;;

assert(p_somme = sommePoly p0 p1) ;;

assert((sommePoly (derivPoly p0) (derivPoly p1)) = ( derivPoly (sommePoly p0 p1))) ;;