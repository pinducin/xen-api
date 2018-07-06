(* sample mli showing everything that 'with fields' introduces *)

(*
  NOTES:
    (1) this file was hand generated and can therefore get out of sync with
        the actual interface of the generated code.
    (2) The file generated_test.mli does not have this problem as it is
        generated by ocamlp4o from the file test.mli
    (3) The types we list here are actually more general than those in
        generated_test.mli (see make_creator, for example)
*)



type ('a,'b) t = {
  dir : 'a * 'b;
  quantity : ('a , 'b) t;
  price : int * 'a;
  mutable cancelled : bool;
(*   symbol : string;   *)
} [@@deriving fields]

type foo = {
  a : [`Bar | `Baz of string];
  b : int;
} [@@deriving fields]

module Private_in_mli : sig
  type ('a,'b) t = private {
    dir : 'a * 'b;
    quantity : ('a , 'b) t;
    price : int * 'a;
    mutable cancelled : bool;
    (*   symbol : string;   *)
  } [@@deriving fields]
end

module Private_in_ml : sig
  type ('a,'b) t = ('a,'b) Private_in_mli.t = private {
    dir : 'a * 'b;
    quantity : ('a , 'b) t;
    price : int * 'a;
    mutable cancelled : bool;
    (*   symbol : string;   *)
  } [@@deriving fields]
end


