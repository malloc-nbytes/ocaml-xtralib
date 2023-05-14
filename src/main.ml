open XList
open XString

let () =
  let s = "This,,is,,a,,test" in
  let split = ",," in
  XString.split_on_string s split
  |> XList.print_string_list
