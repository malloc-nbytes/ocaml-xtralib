open XList
open XString
open XFileIO

let filepath = "./input.txt"

let () =
  XList.print_string_list
    (XString.split_on_chars "this is a, test" [' '])

