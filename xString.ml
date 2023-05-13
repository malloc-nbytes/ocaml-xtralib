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

let split_on_string (str : string) (split : string) : string list =
  let rec split_on_string'
            (str : char list)     (split : char list)
            (buffer : char list)  (acc : char list)
            (res : string list)   (ptr1 : int)
            (ptr2 : int) : string list =
    match ptr1 = (List.length str) with
    | true -> failwith "convert acc -> res"
    | false ->
       Printf.printf "%c -> %c\n" (List.nth str ptr1) (List.nth split ptr2);
       match (List.nth str ptr1) = (List.nth split ptr2) with
       | true -> 
          failwith "todo"
       | false ->
          split_on_string'
            str split buffer
            (List.append acc [(List.nth str ptr1)])
            res (ptr1 + 1) ptr2
  in split_on_string'
       (string_to_char_list str) (string_to_char_list split) [] [] [] 0 0

let () =
  let s = "this is\n\na test" in
  let bad = "\n\n" in
  List.iter (fun k -> k |> Printf.printf "%s") (split_on_string s bad)
