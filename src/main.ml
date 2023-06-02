open XChar

let () =
  let _ = Printf.printf "%b\n" (XChar.is_alphanumeric '1') in
  let _ = Printf.printf "%b\n" (XChar.is_alphanumeric 'a') in
  Printf.printf "%b\n" (XChar.is_numeric '~')
