open XString

let () =
  let str = "Hello World!" in
  print_endline
    (XString.filter str (fun c -> c <> 'l' && c <> 'e'))

