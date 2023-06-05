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


  let int_sum (lst : int list) : int =
    let rec int_sum' (lst : int list) (sum : int) : int =
      match lst with
      | [] -> sum
      | hd :: tl -> int_sum' tl (sum + hd)
    in int_sum' lst 0


  let for_each (lst : 'a list) (f : 'a -> 'b) =
    let rec for_each' (lst : 'a list) (f : 'a -> 'b) =
      match lst with
      | [] -> ()
      | hd :: tl -> let _ = hd |> f in for_each' tl f
    in for_each' lst f


  let int_min (lst : int list) : int =
    let rec int_min' (lst : int list) (min : int) : int =
      match lst with
      | [] -> min
      | hd :: tl ->
         (match hd < min with
         | true -> int_min' tl hd
         | false -> int_min' tl min)
    in int_min' (List.tl lst) (List.nth lst 0)


  let int_max (lst : int list) : int =
    let rec int_max' (lst : int list) (max : int) : int =
      match lst with
      | [] -> max
      | hd :: tl ->
         (match hd > max with
          | true -> int_max' tl hd
          | false -> int_max' tl max)
    in int_max' (List.tl lst) (List.nth lst 0)


  let nth (lst : 'a list) (i : int) : 'a list option =
    let rec nth' (lst : 'a list) (i : int) (idx : int) : 'a list option =
      match i = idx with
      | true -> Some lst
      | false -> nth' (List.tl lst) i (idx + 1)
    in nth' lst i 0


  let unwrap_list (lst : 'a list option) : 'a list =
    match lst with
    | Some k -> k
    | None -> failwith "called unwrap on None value"


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


  let prepend (lst : 'a list) (elem : 'a) : 'a list =
    List.rev (List.append (List.rev lst) [elem])


  let from_range (i : int) (k : int) : int list =
    let rec from_range' i k (acc : int list) : int list =
      match i > k with
      | true -> acc
      | false -> from_range' (i + 1) k (List.append acc [i])
    in from_range' i k []

end
