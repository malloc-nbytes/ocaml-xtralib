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


  let __print_list (lst : string list) =
    lst |> List.iter (fun x -> x |> Printf.printf "(+) %s\n")


  let print_string_list (lst : string list) =
    let _ = "(print_string_list) ->" |> print_endline in
    __print_list lst


  let print_int_list (lst : int list) =
    let _ = "(print_int_list) ->" |> print_endline in
    __print_list (List.map string_of_int lst)


  let has_some_ret_fst (lst : 'a list) : 'a option =
    match List.length lst with
    | 0 -> None
    | _ -> Some (List.hd lst)


  let has_some_ret_last (lst : 'a list) : 'a option =
    match List.length lst with
    | 0 -> None
    | _ -> Some (List.hd (List.rev lst))


  let has_some_ret_tl (lst : 'a list) : 'a list option =
    match List.length lst with
    | 0 -> None
    | _ -> Some (List.tl lst)


  let has_some_ret_hd (lst : 'a list) : 'a list option =
    match List.length lst with
    | 0 -> None
    | _ -> Some [(List.hd lst)]

end
