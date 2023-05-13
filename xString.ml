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
            (str : char list) (split : char list)
            (history : char list) (acc : string list)
            (count : int) : char list =
    failwith "todo"
  in split_on_string'
       (string_to_char_list str) (string_to_char_list split) [] [] 0

let () =
  "this is\n\na test"
  |> split_on_string "\n\n"
  |> List.iter (fun k -> k |> Printf.printf "%s");
