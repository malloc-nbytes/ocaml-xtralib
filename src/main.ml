open XList

let () =
  let lst = XList.from_range 1 5 in
  List.iter (fun x -> Printf.printf "%d\n" x) lst
