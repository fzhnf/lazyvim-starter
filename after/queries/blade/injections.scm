; WARNING: This file extends default blade injections
; If you experience duplicate highlighting, you may need to replace rather than extend

; Text content → HTML (excluding envoy blocks)
; Note: #not-has-ancestor with multiple ancestors may not work as expected
; This attempts to exclude envoy and php_only contexts
((text) @injection.content
  (#not-has-ancestor? @injection.content "envoy")
  (#set! injection.combined)
  (#set! injection.language html))

; Envoy blocks → bash
((text) @injection.content
  (#has-ancestor? @injection.content "envoy")
  (#set! injection.combined)
  (#set! injection.language bash))

; PHP-only nodes → php_only
((php_only) @injection.content
  (#set! injection.language php_only))

; Directive parameters → php_only
((parameter) @injection.content
  (#set! injection.include-children)
  (#set! injection.language php_only))

; Comments → comment (if comment grammar exists)
((comment) @injection.content
  (#set! injection.language comment))

