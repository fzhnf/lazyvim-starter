; Blade block folds for directive pairs and bracket pairs
((directive_start) @start
  (directive_end) @end.after
  (#set! role block))

((bracket_start) @start
  (bracket_end) @end
  (#set! role block))

; Standard directive folds
[
  (authorization)
  (conditional)
  (envoy)
  (fragment)
  (livewire)
  (loop)
  (once)
  (php_statement)
  (section)
  (stack)
  (switch)
  (verbatim)
] @fold
