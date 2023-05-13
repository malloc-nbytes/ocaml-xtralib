let pop (lst : 'a list) : 'a list =
  (List.rev (List.tl (List.rev lst)))

let rec pop_n_elems (lst : 'a list) (n : int) : 'a list =
  match n with
  | 0 -> lst
  | _ -> pop_n_elems (pop lst) (n - 1)

let pop_front (lst : 'a list) : 'a list =
  match lst with
  | [] -> []
  | hd :: tl -> tl

let rec pop_front_n_elems (lst : 'a list) (n : int) : 'a list =
  match n with
  | 0 -> lst
  | _ -> pop_front_n_elems (pop_front lst) (n - 1)

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
  let l = [1;2;3;4;5] in
  let l2 = pop_front_n_elems l 3 in
  print_int_list l2
