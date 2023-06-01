open XString

let () =
  List.iter (fun x -> Printf.printf "item: %d\n" x)
    (XString.string_to_ascii_list "abcdefg")
