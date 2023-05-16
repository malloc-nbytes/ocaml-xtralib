module XFileIO = struct

  let file_to_string (filepath : string) : string =
    let channel = open_in_bin filepath in
    let data = really_input_string
                 channel
                 (in_channel_length channel) in
    let _ = close_in channel in
    data


  let file_to_string_list ?(delim='\n') (filepath : string) : string list =
    String.split_on_char delim (file_to_string filepath)

end
