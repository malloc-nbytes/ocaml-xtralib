open XList

let () =
  let lst = [1;2;3;4;5] in
  match XList.has_some_ret_hd lst with
  | Some k -> List.iter (fun x -> Printf.printf "%d\n" x) k
  | _ -> failwith "tail is none"
