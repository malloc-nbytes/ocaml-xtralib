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


  let __change_case (str : string) (lower_bound : int) (upper_bound) : string =
    match lower_bound = 96 && upper_bound = 123,
          lower_bound = 64 && upper_bound = 91 with
    | (false, false) ->
       failwith "invalid uppper/lower bound. Call to_uppercase or to_lowercase."
    | _ ->
       let rec __change_case'
                 (str : char list) (acc : char list)
                 (lower_bound : int) (upper_bound : int) : string =
         (match str with
          | [] -> char_list_to_string acc
          | hd :: tl ->
             let hdascii = int_of_char hd in
             (match hdascii > lower_bound && hdascii < upper_bound with
              | true ->
                 (match lower_bound with
                  | 96 -> 
                     __change_case'
                       tl (List.append acc [char_of_int ((hdascii - 97) + 65)])
                       lower_bound upper_bound
                  | 64 ->
                     __change_case'
                       tl (List.append acc [char_of_int (hdascii + (97 - 65))])
                       lower_bound upper_bound
                  | _ -> failwith "invalid lower_bound")
              | false -> __change_case' tl (List.append acc [hd]) lower_bound upper_bound))
       in __change_case' (string_to_char_list str) [] lower_bound upper_bound


  let to_uppercase (str : string) : string =
    __change_case str 96 123


  let to_lowercase (str : string) : string =
    __change_case str 64 91


  let replace_char (str : string) (repl : char) (subst : char) : string =
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


  let replace_char_fst (str : string) (repl : char) (subst : char) : string =
    let rec replace_char_fst'
              (str : char list) (repl : char) (subst : char) (acc: char list)
            : string =
      match str with
      | [] -> char_list_to_string acc
      | hd :: tl ->
         (match hd = repl with
          | true ->
             let rec app acc xs =
               match xs with
               | [] -> acc
               | hd :: tl -> app (List.append acc [hd]) tl
             in char_list_to_string (app (List.append acc [subst]) tl)
          | false -> replace_char_fst' tl repl subst (List.append acc [hd]))
    in replace_char_fst' (string_to_char_list str) repl subst []


  let rev (str : string) : string =
    char_list_to_string (List.rev (string_to_char_list str))


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


  let help () =
    print_endline "(XString help)";
    print_endline "  char_list_to_string (lst : char list) -> string";
    print_endline "    * Convert a char list to a string.";
    print_endline "  filter_char (str : string) (bad : char) -> string";
    print_endline "    * Filter out a char from a string.";
    print_endline "  filter (str : string) (f : 'a -> 'b) -> string";
    print_endline "    * Filter out a char given a function.";
    print_endline "  string_to_char_list (str : string) -> char list";
    print_endline "    * Convert a string to a char list.";
    print_endline "  pop_front (str : string) -> string";
    print_endline "    * Remove the front-most character of a string";
    print_endline "  pop (str : string) -> string";
    print_endline "    * Remove the last character of a string.";
    print_endline "  to_uppercase (str : string) -> string";
    print_endline "    * Convert a string to uppercase.";
    print_endline "  to_lowercase (str : string) -> string";
    print_endline "    * Convert a string to lowercase.";
    print_endline "  replace_char (str : string) (repl : char) (subst : char) -> string";
    print_endline "    * Replace all occurrences of a char with a substitute.";
    print_endline "  replace_char_fst (str : string) (repl : char) (subst : char) -> string";
    print_endline "    * Only replace the first occurrence of a char with a substitute.";
    print_endline "  rev (str : string) -> string";
    print_endline "    * Reverse a string.";
    print_endline "  split_on_chars (str : string) (delims : char list) -> string list";
    print_endline "    * Split a string given a set of delimiters and return a string list.";
    print_endline "  split_on_string (str : string) (split : string) -> string list";
    print_endline "    * Split a string with the string delimiter.";
    print_endline "  string_to_ascii_list (str : string) -> int list";
    print_endline "    * Convert a string to an int list of ascii values.";
end

