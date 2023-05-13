let char_list_to_string (lst : char list) : string =
  lst
  |> List.map (fun c -> String.make 1 c)
  |> String.concat ""

let filter_char (str : string) (bad : char) : string =
  str
  |> String.to_seq
  |> List.of_seq
  |> List.filter (fun c -> c <> bad)
  |> char_list_to_string

let filter (str : string) (f : 'a -> 'b) : string =
  str
  |> String.to_seq
  |> List.of_seq
  |> List.filter f
  |> char_list_to_string

let string_to_char_list (str : string) : char list =
  String.to_seq str |> List.of_seq

let pop (str : string) : string =
  char_list_to_string
    (List.rev
       (List.tl
          (List.rev
             (string_to_char_list str))))

let split_on_string (str : string) (split : string) : string list =
  let rec trim_acc (acc : char list) (num_to_remove : int) : char list =
    match num_to_remove with
    | 0 -> acc
    | _ -> trim_acc (List.rev (List.tl (List.rev acc))) (num_to_remove - 1)
  in
  let rec split_on_string'
            (str : char list) (split : char list) (acc : char list)
            (res : string list) (ptr1 : int) (ptr2 : int) : string list =
    match ptr1 = (List.length str) with
    | true ->
       (match (List.length acc) > 0 with
        | true -> (List.append res [(char_list_to_string acc)])
        | false -> res)
    | false ->
       (match (List.nth str ptr1) = (List.nth split ptr2) with
        | true ->
           (match ptr2 = (List.length split) - 1 with
            | true ->
               split_on_string'
                 str split []
                 (List.append res [(char_list_to_string (trim_acc acc ptr2))])
                 (ptr1 + 1) 0
            | false -> split_on_string' str split
                         (List.append acc [(List.nth str ptr1)])
                         res (ptr1 + 1) (ptr2 + 1))
        | false ->
           (match ptr2 <> 0 with
            | true -> split_on_string' str split acc res ptr1 0
            | false ->
               split_on_string'
                 str split
                 (List.append acc [(List.nth str ptr1)])
                 res (ptr1 + 1) ptr2))
  in split_on_string'
       (string_to_char_list str)
       (string_to_char_list split)
       [] [] 0 0

let () =
  let s = "this is a test\n" in
  Printf.printf "%s\n" (pop s)
                (* let bad = "\n" in *)
                (* List.iter (fun k -> k |> Printf.printf "item: %s\n") (split_on_string s bad) *)
