open XList
open XString
open XFileIO

let filepath = "./input.txt"

let () =
  Printf.printf "%s\n" (XString.replace_char_fst "this is a test" 'i' 'x')
