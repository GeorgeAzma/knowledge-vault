- comments
``` ocaml
(* inline comment *)
(** docstring *)
```
- variables
``` ocaml
# 5.0 +. 5.0;; (* ;; = end expression and print *)
- : float = 10. (* print result *)

let boolean = "a" = "b"
```
- arrays
``` ocaml
# let u = [1; 2; 3; 4];;
val u : int list = [1; 2; 3; 4]

# ["a"; "b"; "c"];;
- : string list = ["a"; "b"; "c"]

# [1; 2] @ [3; 4]
-: int list = [1; 2; 3; 4]

# [1; 2] :: [3; 4] (* :: = cons operator *)
- : int list = [1; 2; [3; 4]]

# [];;
- : 'a list = []

# [[1; 2]; [3]; [4; 5; 6]];;
- : int list list = [[1; 2]; [3]; [4; 5; 6]]
```
- expressions
``` ocaml
if "a" = "b" then 1 else 2 (* if/then/else is expr *)
let x = 50 in x * x (* x = 2500, local only *)
let a = 1 in let b = 2 in a + b;;;
```
- functions
``` ocaml
# let square x = x * x
val square : int -> int = <fun>

(* anonymous fn, like lambda *)
# fun x -> x * x;;
- : int -> int = <fun>
(fun x -> x * x) 50;; (* apply fn to 50 *)

(* multi-param fn *)
# let cat a b = a ^ " " ^ b;;
val cat : string -> string -> string = <fun>
# cat "a" "b"

(* partial application *)
let say_hi = cat "hi";; (* 1 param fn *)
# say_hi "friend";;
- : string = "hi friend"

(* labeled fn param *)
# String.ends_width;;
- : suffix:string -> string -> bool = <fun> (* suffix is labeled parameter *)
# String.ends_with ~suffix:"less" "stateless";; (* true *)

(* higher order fn *)
List.map;;
- : ('a -> 'b) -> 'a list -> 'b list = <fun>

# List.map (fun x -> x * x);;
- : inst list -> int list = <fun>

function (* same as *) fun x -> match x with ...
```
- IO
``` ocaml
(* IO ops like read_line don't have input *)
read_line;; (* use unit, for no input *)
- : unit -> string = <fun>
# read_line ();;

# print_endline;;
- : string -> unit = <fun>
# print_endline "hi" ;;
- : unit = ()
```
- recursion + match
``` ocaml
# let rec range lo hi = 
    if lo > hi then
        []
    else
        lo :: range (lo + 1) hi;;
val range : int -. int -> int list = <fun>
# range 2 5;;
- : int list = [2; 3; 4; 5]
(* [2; (range 3 5)] *)
(* [2; 3; (range 4 5)] *)
(* [2; 3; 4; (range 5 5)] *)
(* [2; 3; 4; 5; (range 6 5)] *)
(* [2; 3; 4; 5; []] -> [2; 3; 4; 5] *)

# let rec length u =
    match u with
    | [] -> 0
    | _ :: v -> 1 + length v;;
val length : 'a list -> int = <fun>
# length [[]];;
- : int = 1

# let rec map f u =
    match u with
    | [] -> []
    | x :: u -> f x :: map f u;;
val map : ('a -> 'b) -> 'a list -> 'b list = <fun>

(* tail recursion *)
let length lst =
  let rec aux acc = function
    | [] -> acc
    | _::t -> aux (acc + 1) t
  in aux 0 lst
```
- option
``` ocaml
type 'a option = None | Some of 'a
# let f opt = match opt with
    | None -> None
    | Some None -> None
    | Some (Some x) -> Some x;
val f : 'a option option-> 'a option = <fun>
```
- tuple
``` ocaml
# (1, "one", 'K');;
- : int * string * char = (1, "one", 'K')
```
- type / variant / union
``` ocaml
type color = Red | Green | Blue;;
[Red; Blue; Red]

type http_response = Data of string | Error_code of int;;

type point = { x: int; y: int }
type shape = Circle of float | Rect of float * float
```
- modules
``` ocaml
module Math = struct
  let pi = 3.1415
  let square x = x *. x
end

let area r = Math.pi *. Math.square r
```
- interface like modules
``` ocaml
(* module type, like an interface *)
module type MATH = sig
  val pi : float
  val square : float -> float
end

module Math : MATH = struct
  let pi = 3.1415
  let square x = x *. x
end
```
- abstract modules
``` ocaml
(* abstract type *)
module type STACK = sig
  type 'a t
  val empty : 'a t
  val push : 'a -> 'a t -> 'a t
  val pop  : 'a t -> 'a t
  val top  : 'a t -> 'a option
end

module Stack : STACK = struct
  type 'a t = 'a list
  let empty = []
  let push x s = x :: s
  let pop = function _::xs -> xs | [] -> []
  let top = function x::_ -> Some x | [] -> None
end
```
- functors `module that takes module as arg`
``` ocaml
module type ORDERED = sig
  type t
  val compare : t -> t -> int
end

module MakeSet (Ord : ORDERED) = struct
  type elt = Ord.t
  type t = elt list

  let empty = []

  let rec add x = function
    | [] -> [x]
    | h::t ->
      match Ord.compare x h with
      | 0 -> h :: t
      | n when n < 0 -> x :: h :: t
      | _ -> h :: add x t
end
```
- result
``` ocaml
type ('a, 'b) result = Ok of 'a | Error of 'b
```
### Features
- immutable by default
