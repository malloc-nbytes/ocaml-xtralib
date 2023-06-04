open XList

let () =
  let lst = [1;2;3;4;5] in
  List.iter (fun x -> Printf.printf "%d\n" x)
    (XList.prepend lst 99)
