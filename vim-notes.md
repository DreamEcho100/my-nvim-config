```
            ^ k
   h        |     l
    <-  | j     ->
        *
```

- `w` move forward by word, `W` move by non-seprated whitespce word.
- `b` move backward by word, `B` move by non-seprated whitespce word.

- `gg` move to the start of the file, `G` moves to the end of it.

- `u` to undo changes, ctrl+`r` for redo.

- `%` will move between matching ()[]{}.

## Changes/Delete

- `d` + [command|count|motion], to delete.
- `c` + [command|count|motion], to change (delete and go to insert mode).

For now we will use unquoted

- %% to action on the current line.

- % + `i` + motion, to action inside, eg. on `(wwwwwwwwww)` a `di(` will make `()`.
- % + `a` + motion, to action with around, eg. on `(wwwwwwwwww)` a `di(` will make ``.
