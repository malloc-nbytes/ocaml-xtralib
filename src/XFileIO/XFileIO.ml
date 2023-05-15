module XFileIO = struct
  let file_to_string (filepath : string) : string =
    (*
      Code from:
      https://stackoverflow.com/questions/53839695/
     *)
    let ch = open_in_bin filepath in
    let s = really_input_string ch (in_channel_length ch) in
    close_in ch;
    s


  let file_to_string_list ?(delim='\n') (filepath : string) : string list =
    String.split_on_char delim (file_to_string filepath)
end
