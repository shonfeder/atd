(* $Id: atd_predef.ml 51874 2010-11-16 05:28:46Z martin $ *)

(*
  Table of predefined types.
*)

open Atd_ast

let list_def : type_def = 
  let loc = dummy_loc in
  (
    loc, 
    ("list", ["a"], []),
    `List (loc, `Tvar (loc, "a"), [])
  )

let option_def : type_def = 
  let loc = dummy_loc in
  (
    loc, 
    ("option", ["a"], []),
    `Option (loc, `Tvar (loc, "a"), [])
  )

let shared_def : type_def = 
  let loc = dummy_loc in
  (
    loc, 
    ("shared", ["a"], []),
    `Shared (loc, `Tvar (loc, "a"), [])
  )


let list = [
    "unit", 0, None;
    "bool", 0, None;
    "int", 0, None;
    "float", 0, None;
    "string", 0, None;
    "abstract", 0, None;
    "list", 1, Some list_def;
    "option", 1, Some option_def;
    "shared", 1, Some shared_def;
  ]

let make_table () =
  let tbl = Hashtbl.create 20 in
  List.iter (
    fun (k, n, opt_t) ->
      Hashtbl.add tbl k (n, opt_t)
  ) list;
  tbl
