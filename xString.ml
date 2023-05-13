let filter_char (str : string) (repl : char) : string =
  str
  |> String.to_seq
  |> List.of_seq
  |> List.filter (fun c -> c <> repl)
  |> List.map (fun c -> String.make 1 c)
  |> String.concat ""

let filter (str : string) (f : 'a -> 'b) : string =
  str
  |> String.to_seq
  |> List.of_seq
  |> List.filter (f)
  |> List.map (fun c -> String.make 1 c)
  |> String.concat ""

let () =
  let str = "this is a test" in
  let f = (fun c -> c <> 't') in
  filter str f |> print_endline
