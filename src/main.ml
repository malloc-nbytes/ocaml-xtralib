open XList
open XString
open XChar
open XFileIO

let () =
  let lst = [1;2;3;4;5] in
  XList.for_each lst (fun x -> Printf.printf "%d\n" x)

