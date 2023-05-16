module XChar = struct

  let is_lowercase (c : char) : bool =
    let c = int_of_char c in
    c > 96 && c < 123


  let is_uppercase (c : char) : bool =
    let c = int_of_char c in
    c > 64 && c < 91


  let is_alphabetic (c : char) : bool =
    is_lowercase c || is_uppercase c


  let is_numeric (c : char) : bool =
    let c = int_of_char c in
    c > 47 && c < 58


  let is_alnum (c : char) : bool =
    is_alphabetic c || is_numeric c


end
