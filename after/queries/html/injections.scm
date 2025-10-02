; This file extends default HTML injections
; The base HTML queries are automatically inherited when using after/queries/

; PyScript inline scripts
(element
  (start_tag
    (tag_name) @_py_script)
  (text) @injection.content
  (#any-of? @_py_script "py-script" "py-repl")
  (#set! injection.language python))

; PyScript in script tags with type attribute
(script_element
  (start_tag
    (attribute
      (attribute_name) @_attr
      (quoted_attribute_value
        (attribute_value) @_type)))
  (raw_text) @injection.content
  (#eq? @_attr "type")
  (#any-of? @_type "pyscript" "py-script")
  (#set! injection.language python))

; PyScript config blocks
(element
  (start_tag
    (tag_name) @_py_config)
  (text) @injection.content
  (#eq? @_py_config "py-config")
  (#set! injection.language toml))

; AlpineJS attributes (x-* directives)
(attribute
  (attribute_name) @_attr
  (#lua-match? @_attr "^x%-%l")
  (quoted_attribute_value
    (attribute_value) @injection.content)
  (#set! injection.language javascript))

; Blade component escaped JS attributes (::attr)
; Example: <x-button ::click="handler" />
(element
  (start_tag
    (tag_name) @_tag
    (#lua-match? @_tag "^x%-%l")
    (attribute
      (attribute_name) @_attr
      (#lua-match? @_attr "^::%l")
      (quoted_attribute_value
        (attribute_value) @injection.content)
      (#set! injection.language javascript))))

; Blade component PHP attributes (:attr)
; Example: <x-button :disabled="$isDisabled" />
(element
  (start_tag
    (tag_name) @_tag
    (#lua-match? @_tag "^x%-%l")
    (attribute
      (attribute_name) @_attr
      (#lua-match? @_attr "^:%l")
      (#not-lua-match? @_attr "^::%l")
      (quoted_attribute_value
        (attribute_value) @injection.content)
      (#set! injection.language php_only))))
