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

### `pop_front`

### `pop_front_n_elems`

### `pop`

### `to_uppercase`

### `to_lowercase`

### `replace_char`

### `replace_char_fst`

### `rev`

### `split_on_chars`

### `split_on_string`

### `string_to_ascii_list`

