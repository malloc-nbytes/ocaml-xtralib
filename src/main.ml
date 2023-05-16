open XList
open XString
open XChar
open XFileIO

let () =
  let c = XChar.is_lowercase 'a' in
  if c then print_endline "true"
  else print_endline "false";

