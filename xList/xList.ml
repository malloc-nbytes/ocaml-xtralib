let pop (lst : 'a list) : 'a list =
  (List.rev (List.tl (List.rev lst)))

let rec pop_n_elems (lst : 'a list) (n : int) : 'a list =
  match n with
  | 0 -> lst
  | _ -> pop (pop lst)

let rec print_list' (lst : string list) (n : int) =
  match lst with
  | [] -> ()
  | hd :: tl ->
     let _ = Printf.printf "  (%d -> %s)\n" n hd in
     print_list' tl (n + 1)

let print_string_list (lst : string list) =
  let _ = "(print_string_list) ->" |> print_endline in
  print_list' lst 0

let print_int_list (lst : int list) =
  let _ = "(print_int_list) ->" |> print_endline in
  print_list' (List.map string_of_int lst) 0

let () =
  print_string_list ["this";"is";"a";"test"]
