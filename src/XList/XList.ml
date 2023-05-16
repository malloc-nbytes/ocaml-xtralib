module XList = struct

  let pop (lst : 'a list) : 'a list =
    (List.rev
       (List.tl
          (List.rev lst)))


  let rec pop_n_elems (lst : 'a list) (n : int) : 'a list =
    match n with
    | 0 -> lst
    | _ -> pop_n_elems (pop lst) (n - 1)


  let pop_front (lst : 'a list) : 'a list =
    match lst with
    | [] -> []
    | _ :: tl -> tl


  let rec pop_front_n_elems (lst : 'a list) (n : int) : 'a list =
    match n with
    | 0 -> lst
    | _ -> pop_front_n_elems (pop_front lst) (n - 1)


  let rec print_list' (lst : string list) =
    lst |> List.iter (fun x -> x |> Printf.printf "(+) %s\n")


  let print_string_list (lst : string list) =
    let _ = "(print_string_list) ->" |> print_endline in
    print_list' lst


  let print_int_list (lst : int list) =
    let _ = "(print_int_list) ->" |> print_endline in
    print_list' (List.map string_of_int lst)

end

