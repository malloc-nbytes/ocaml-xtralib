open XList
open XString
open XFileIO

let read_whole_file filename =
  let ch = open_in_bin filename in
  let s = really_input_string ch (in_channel_length ch) in
  close_in ch;
  s

let () =
  "Hello world" |> print_endline
