; Blade directive highlighting
([
  (directive)
  (directive_start)
  (directive_end)
] @tag
  (#set! priority 101))

; Blade bracket pair highlighting
([
  (bracket_start)
  (bracket_end)
] @tag.delimiter
  (#set! priority 101))

; Blade comments
((comment) @comment @spell
  (#set! priority 101))

