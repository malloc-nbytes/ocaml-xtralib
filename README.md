# ocaml-xtralib
Extra functions and wrappers that would be nice in the stdlib of OCaml.

## module XString

### `char_list_to_string`
`char list -> string`

Convert a char list to a string.

Example:
```ml
open XString

let () =
  let lst = ['a';'b';'c'] in
  let str = XString.char_list_to_string lst in
  print_endline str
```
Output:
```
abc
```

### `filter_char`
`string -> char -> string`

Filter out a character from a string.

Example:
```ml
open XString

let () =
  let str = "Hello World!" in
  print_endline (XString.filter_char str 'l')
```
Output:
```
Heo Word!
```

### `filter`
`string -> (char -> bool) -> string`

Filter out characters given a predicate.

Example:
```ml
open XString

let () =
  let str = "Hello World!" in
  print_endline
    (XString.filter str (fun c -> c <> 'l' && c <> 'e'))
```
Output:
```
Ho Word!
```

### `string_to_char_list`
`string -> char list`

Convert a string to a char list.

Example:
```ml
open XString

let () =
  XString.string_to_char_list "Hello world"
  |> List.iter (fun c -> Printf.printf "%c" c)
```
Output:
```
Hello world
```

### `pop_front`
`string -> string`

Remove the front-most character in a string.

Example:
```ml
open XString

let () =
  let str = "Hello world" in
  let _ = print_endline str in
  let str = XString.pop_front str in
  print_endline str
```
Output:
```
Hello world
ello world
```

### `pop_front_n_elems`
`string -> int -> string`

Pop `n` number of elements from the front.

Example:
```ml
open XString

let () =
  let str = "Hello world" in
  let _ = print_endline str in
  let str = XString.pop_front_n_elems str 3 in
  print_endline str
```
Output:
```
Hello world
o world
```

### `pop`
`string -> string`

Remove the last character.

Example:
```ml
open XString

let () =
  let str = "Hello world" in
  let _ = print_endline str in
  let str = XString.pop str in
  print_endline str
```
Output:
```
Hello world
Hello worl
```

### `to_uppercase`
`string -> string`

Convert a string to uppercase.

Example:
```ml
open XString

let () =
  let str = "Hello world" in
  print_endline (XString.to_uppercase str)
```
Output:
```
HELLO WORLD
```

### `to_lowercase`
`string -> string`

Convert a string to lowercase.

Example:
```ml
open XString

let () =
  let str = "HELLO WORLD" in
  print_endline (XString.to_lowercase str)
```
Output:
```
hello world
```

### `replace_char`
`string -> char -> char -> string`

Replace all characters that match a given character with a substitute.

Example:
```ml
open XString

let () =
  let str = "Hello world" in
  print_endline (XString.replace_char str 'l' 'x')
```
Output:
```
Hexxo worxd
```

### `replace_char_fst`
`string -> char -> char -> string`

Replace the first character that matches a given character with a substitute.

Example:
```ml
open XString

let () =
  let str = "Hello world" in
  print_endline (XString.replace_char_fst str 'l' 'x')
```
Ouput:
```
Hexlo world
```

### `rev`
`string -> string`

Reverse a string.

Example:
```ml
open XString

let () =
  let str = "Hello world" in
  print_endline (XString.rev str)
```
Output:
```
dlrow olleH
```

### `split_on_chars`
`string -> char list -> string list`

Split a string into a string list by a char list of delimiters.

Example:
```ml
open XString

let () =
  let str = "foo, bar baz" in
  let delims = [','; ' '] in
  let lst = XString.split_on_chars str delims in
  List.iter (fun s -> Printf.printf "item: %s\n" s) lst
```
Output:
```
item: foo
item: bar
item: baz
```

### `split_on_string`
`string -> string -> string list`

Split a string by a given string delimiter.

Example:
```ml
open XString

let () =
  let str = "foo;;;bar;;;baz" in
  let split = ";;;" in
  List.iter (fun s -> Printf.printf "item: %s\n" s)
    (XString.split_on_string str split)
```
Output:
```
item: foo
item: bar
item: baz
```

### `string_to_ascii_list`
`string -> int list`

Convert a string to an int list consisting of ascii values.

Example:
```ml
open XString

let () =
  List.iter (fun x -> Printf.printf "item: %d\n" x)
    (XString.string_to_ascii_list "abcdefg")
```
Output:
```
item: 97
item: 98
item: 99
item: 100
item: 101
item: 102
item: 103
```

## module XList

### `pop`
`'a list -> 'a list`

Remove the last element in a list.

Example:
```ml
open XList

let () =
  List.iter (fun x -> Printf.printf "%d\n" x)
    (XList.pop [1;2;3;4;5])
```
Output:
```
1
2
3
4
```

### `pop_n_elems`
`'a list -> int -> 'a list`

Remove `n` elements from the end of the list.

Example:
```ml
open XList

let () =
  List.iter (fun x -> Printf.printf "item: %d\n" x)
    (XList.pop_n_elems [1;2;3;4;5] 3)
```
Output:
```
1
2
```

### `pop_front`
`'a list -> 'a list`

Remove the first element in a list.

Example:
```ml
open XList

let () =
  List.iter (fun x -> Printf.printf "%d\n" x)
    (XList.pop_front [1;2;3;4;5])
```
Output:
```
2
3
4
5
```

### `pop_front_n_elems`
`'a list -> int -> 'a list`

Remove `n` elements at the front of the list.

Example:
```ml
open XList

let () =
  List.iter (fun x -> Printf.printf "%d\n" x)
    (XList.pop_front_n_elems [1;2;3;4;5] 2)
```
Output:
```
3
4
5
```

### `print_string_list`
`string list -> unit`

Print a string list.

Example:
```ml
open XList

let () =
  XList.print_string_list ["foo"; "bar"; "baz"]
```
Output:
```
(print_string_list) ->
(+) foo
(+) bar
(+) baz
```

### `print_int_list`
`int list -> unit`

Print an int list.

Example:
```ml
open XList

let () =
  XList.print_int_list [1;2;3;4;5]
```
Output:
```
(print_int_list) ->
(+) 1
(+) 2
(+) 3
(+) 4
(+) 5
```

### `int_sum`
`int list -> int`

Return the sum of an int list.

Example:
```ml
open XList

let () =
  Printf.printf "%d\n" (XList.int_sum [4;2;1;6;5])
```
Output:
```
18
```

### `for_each`
`'a list -> ('a -> 'b) -> unit`

Apply an immutable function on each element.

Example:
```ml
open XList

let func (elem : int) : unit =
  match elem mod 2 = 0 with
  | true -> print_endline "even"
  | false -> print_endline "odd"

let () =
  XList.for_each [1;2;3;4;5] func
```
Output:
```
odd
even
odd
even
odd
```

### `int_min`
`int list -> int`

Return the minimum element of an int list.

Example:
```ml
open XList

let () =
  Printf.printf "%d\n" (XList.int_min [5;3;1;2])
```
Output:
```
1
```

### `int_max`
`int list -> int`

Return the maximum element of an int list.

Example:
```ml
open XList

let () =
  Printf.printf "%d\n" (XList.int_min [5;3;1;2])
```
Output:
```
5
```

### `nth`
`'a list -> int -> 'a list option`

Given index `i`, return the slice of the list as an option after and including index `i`: (`Some lst[i..((List.length lst) - 1)]`).

Example:
```ml
open XList

let () =
  let lst = [1;2;3;4;5] in
  match XList.nth lst 3 with
  | Some k -> List.iter (fun x -> Printf.printf "%d\n" x) k
  | _ -> failwith "List is none"
```
Output:
```
4
5
```

### `unwrap_list`
`'a list option -> 'a list`

Return the list inside of an option.

Example:
```ml
open XList

let () =
  let lst = Some [1;2;3;4;5] in
  List.iter (fun x -> Printf.printf "%d\n" x)
    (XList.unwrap_list lst)
```
Output:
```
1
2
3
4
5
```

### `has_some_ret_fst`
`'a list -> 'a option`

Return the head of a list as an option.

Example:
```ml
open XList

let () =
  let lst = [1;2;3;4;5] in
  match XList.has_some_ret_fst lst with
  | Some k -> Printf.printf "%d\n" k
  | _ -> failwith "Element does not exist"
```
Output:
```
1
```

### `has_some_ret_last`
`'a list -> 'a option`

Return the last element of a list as an option.

Example:
```ml
open XList

let () =
  let lst = [1;2;3;4;5] in
  match XList.has_some_ret_last lst with
  | Some k -> Printf.printf "%d\n" k
  | _ -> failwith "Element does not exist"
```
Output:
```
5
```

### `has_some_ret_tl`
`'a list -> 'a list option`

Return the tail of a list as a list option.

Example:
```ml
open XList

let () =
  let lst = [1;2;3;4;5] in
  match XList.has_some_ret_tl lst with
  | Some k -> List.iter (fun x -> Printf.printf "%d\n" x) k
  | _ -> failwith "tail is none"
```
Output:
```
2
3
4
5
```

### `has_some_ret_hd`
`'a list -> 'a list option`

Return the head of a list as a list option.

Example:
```ml
open XList

let () =
  let lst = [1;2;3;4;5] in
  match XList.has_some_ret_hd lst with
  | Some k -> List.iter (fun x -> Printf.printf "%d\n" x) k
  | _ -> failwith "tail is none"
```
Output:
```
1
```

## module XFileIO

Assume a file `input.txt` contains the following:
```
Hello World!
This is some text.
More text.
```

### `file_to_string`
`string -> string`

Read in contents of a file as a string.

Example:
```ml
open XFileIO

let filepath = "./input.txt"

let () =
  let str = XFileIO.file_to_string filepath in
  print_endline str
```
Output:
```
Hello World!
This is some text.
More text.
```

### `file_to_string_list`
`?delim:char -> string -> string list`

Read in data from a file and return a string list split on `delim`. By default, `delim` is `\n`.

Example:
```ml
open XFileIO

let filepath = "./input.txt"

let () =
  let lst = XFileIO.file_to_string_list ~delim:'.' filepath in
  List.iter (fun s -> print_endline s) lst
```

Output:
```
Hello World!
This is some text

More text

```

## module XChar

### `is_lowercase`
`char -> bool`

Checks to see if a char is lowercase.

Example:
```ml
open XChar

let () =
  let _ = Printf.printf "%b\n" (XChar.is_lowercase 'a') in
  Printf.printf "%b\n" (XChar.is_lowercase 'A')
```
Output:
```
true
false
```

### `is_uppercase`
`char -> bool`

Checks to see if a char is uppercase.

Example:
```ml
open XChar

let () =
  let _ = Printf.printf "%b\n" (XChar.is_uppercase 'a') in
  Printf.printf "%b\n" (XChar.is_uppercase 'A')
```
Output:
```
false
true
```

### `is_alphabetic`
`char -> bool`

Checks to see if a char is alphabetic.

Example:
```ml
open XChar

let () =
  let _ = Printf.printf "%b\n" (XChar.is_alphabetic 'a') in
  Printf.printf "%b\n" (XChar.is_alphabetic '1')
```
Output:
```
true
false
```

### `is_numeric`
`char -> bool`

Checks to see if a char is numeric.

Example:
```ml
open XChar

let () =
  let _ = Printf.printf "%b\n" (XChar.is_numeric '1') in
  Printf.printf "%b\n" (XChar.is_numeric 'a')
```
Output:
```
true
false
```

### `is_alphanumeric`
`char -> bool`

Checks to see if a char is alphanumeric.

Example:
```ml
open XChar

let () =
  let _ = Printf.printf "%b\n" (XChar.is_alphanumeric '1') in
  let _ = Printf.printf "%b\n" (XChar.is_alphanumeric 'a') in
  Printf.printf "%b\n" (XChar.is_numeric '~')
```
Output:
```
true
true
false
```
