open XList
open XString
open XChar
open XFileIO

type monkey =
  { items     : int list
  ; operation : int option * char * int option
  ; div       : int
  ; if_true   : int
  ; if_false  : int
  }

let parse_monkey_iffalse (data : string) : int =
  failwith "todo"

let parse_monkey_iftrue (data : string) : int =
  failwith "todo"

let parse_monkey_div (data : string) : int =
  failwith "todo"

let parse_monkey_operation (data : string) : int option * char * int option =
  match XList.nth (XString.split_on_string data " = ") 1 with
  | None -> failwith "unreachable"
  | Some k ->
     let k = String.split_on_char ' ' (List.hd k) in
     let n1 = List.hd k in
     let op = List.hd (List.tl k) in
     let n2 = List.hd (List.tl (List.tl k)) in
     let n1 = match n1 with
       | "old" -> None
       | _ -> Some (int_of_string n1) in
     let n2 = match n2 with
       | "old" -> None
       | _ -> Some (int_of_string n2) in
     (n1, op.[0], n2)

let parse_monkey_items (data : string) : int list =
  match XList.nth (XString.split_on_string data ": ") 1 with
  | None -> failwith "unreachable"
  | Some k ->
     let k = List.map (fun s -> XString.filter_char s ',') k in
     let k = String.split_on_char ' ' (List.hd k) in
     List.map (fun s -> int_of_string s) k

let parse_monkey_data (data : string) : monkey =
  let lines = String.split_on_char '\n' data |> List.map String.trim in
  let items = parse_monkey_items (List.hd lines) in
  let lines = List.tl lines in
  let operation = parse_monkey_operation (List.hd lines) in
  let lines = List.tl lines in
  let div = parse_monkey_div (List.hd lines) in
  let lines = List.tl lines in
  let if_true = parse_monkey_iftrue (List.hd lines) in
  let lines = List.tl lines in
  let if_false = parse_monkey_iffalse (List.hd lines) in
  { items      = items
  ; operation  = operation
  ; div        = div
  ; if_true    = if_true
  ; if_false   = if_false
  }

let filepath = "input.txt"

let () =
  let data = XFileIO.file_to_string filepath in
  let data = XString.split_on_string data "\n\n" in
  let data = List.map (fun s -> XString.pop_front_n_elems s 11) data in
  let _ = List.map (fun s -> parse_monkey_data s) data in
  failwith "todo"

