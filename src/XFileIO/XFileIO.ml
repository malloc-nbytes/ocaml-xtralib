module XFileIO = struct
  let file_to_string (filepath : string) : string =
    (* https://stackoverflow.com/questions/53839695/ *)
    let ch = open_in_bin filepath in
    let s = really_input_string ch (in_channel_length ch) in
    close_in ch;
    s

  (* TODO: delim should be an optional arg. *)
  let file_to_string_list (filepath : string) (delim : char) : string list =
    String.split_on_char delim (file_to_string filepath)
end
