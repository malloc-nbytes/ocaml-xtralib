# ocaml-xtralib
Extra functions and wrappers that would be nice in the normal stdlib of OCaml.

## module XString

### `char_list_to_string`
`char_list_to_string (lst : char list) : string`

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
`filter_char (str : string) (bad : char) : string`

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
`filter (str : string) (f : 'a -> 'b) : string`

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
`string_to_char_list (str : string) : char list`

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
`pop_front (str : string) : string`

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
`pop_front_n_elems (str : string) (n : int) : string`

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
`pop (str : string) : string`

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
`to_uppercase (str : string) : string`

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
`to_lowercase (str : string) : string`

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
`replace_char (str : string) (repl : char) (subst : char) : string`

Replace all characters that match `repl` with `subst`.

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
`replace_char_fst (str : string) (repl : char) (subst : char) : string`

Replace only the first character `repl` with `subst`.

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
`rev (str : string) : string`

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
`split_on_chars (str : string) (delims : char list) : string list`

Split `str` into a string list by `delims`.

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
`split_on_string (str : string) (split : string) : string list`

Split `str` by `split`.

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
`string_to_ascii_list (str : string) : int list`

Convert a `str` to an int list consisting of ascii values.

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

## TODO
