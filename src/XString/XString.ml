module XString = struct
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


  let pop_front (str : string) : string =
    str
    |> string_to_char_list
    |> List.tl
    |> char_list_to_string


  let pop (str : string) : string =
    char_list_to_string
      (List.rev
         (List.tl
            (List.rev
               (string_to_char_list str))))


  let remove_char (str : string) (del : char) : string =
    let rec remove_char'
              (str : char list) (del : char) (acc : char list)
            : string =
      match str with
      | [] -> char_list_to_string acc
      | hd :: tl ->
         (match hd = del with
          | true -> remove_char' tl del acc
          | false -> remove_char' tl del (List.append acc [hd]))
    in remove_char' (string_to_char_list str) del []


  let replace_char (str : string) (repl : char) (subst : char)
      : string =
    let rec replace_char'
              (str : char list) (repl : char) (subst: char) (acc : char list)
            : string =
      match str with
      | [] -> char_list_to_string acc
      | hd :: tl ->
         (match hd = repl with
          | true -> replace_char' tl repl subst (List.append acc [subst])
          | false -> replace_char' tl repl subst (List.append acc [hd]))
    in replace_char' (string_to_char_list str) repl subst []


  let split_on_chars (str : string) (delims : char list)
      : string list =
    let rec contains (elem : char) (delims : char list) : bool =
      (match delims with
       | [] -> false
       | hd :: tl ->
          (match hd = elem with
           | true -> true
           | false -> contains elem tl))
    in
    let rec split_on_chars'
              (str : char list) (delims : char list)
              (acc : char list) (res: string list)
            : string list =
      (match str with
       | [] ->
          (match List.length acc > 0 with
           | true -> List.append res [(char_list_to_string acc)]
           | false -> res)
       | hd :: tl ->
          (match contains hd delims with
           | true -> split_on_chars'
                       tl delims [] (match List.length acc > 0 with
                                     | true -> List.append res [(char_list_to_string acc)]
                                     | false -> res)
           | false -> split_on_chars' tl delims (List.append acc [hd]) res))
    in split_on_chars' (string_to_char_list str) delims [] []


  let split_on_string (str : string) (split : string) : string list =
    let rec trim_acc (acc : char list) (n : int) : char list =
      match n with
      | 0 -> acc
      | _ -> trim_acc (List.rev (List.tl (List.rev acc))) (n - 1)
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


  let string_to_ascii_list (str : string) : int list =
    str
    |> string_to_char_list
    |> List.map int_of_char
end

