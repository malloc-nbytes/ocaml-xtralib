open XList
open XString
open XFileIO

let filepath = "./input.txt"

let () =
  XList.print_string_list
    (XString.split_on_multiple_delims "this is a, test" [' '])

