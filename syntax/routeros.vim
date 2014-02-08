" Vim syntax file
" Language: RouterOS configuration files
" Maintainer: Ryan Carter
" Latest Revision: 16OCT2012
" GistID: 3904202

if exists("b:current_syntax")
    finish
endif

syn keyword	confTodo	contained TODO FIXME XXX
" Avoid matching "text#text", used in /etc/disktab and /etc/gettytab
syn match	confComment	"^#.*" contains=confTodo
syn match	confComment	"\s#.*"ms=s+1 contains=confTodo
syn region	confString	start=+"+ skip=+\\\\\|\\"+ end=+"+ skipwhite skipnl
syn region	confString	start=+'+ skip=+\\\\\|\\'+ end=+'+ skipwhite skipnl

" match key-value-pair key
syn match kvpK "\([a-zA-Z0-9._-]\)\+\(=\)\@="
" match key-value-pair delimiter
syn match kvpD "="
" match key-value-pair value

syn match ipaddr "/\(\(25\_[0-5]\|2\_[0-4]\_[0-9]\|\_[01]\?\_[0-9]\_[0-9]\?\)\.\)\{3\}\(25\_[0-5]\|2\_[0-4]\_[0-9]\|\_[01]\?\_[0-9]\_[0-9]\?\)/"

hi link ipaddr Number
highlight link kvpK Identifier
highlight link kvpD Delimiter
highlight link kvpV Constant

" Define the default highlighting.
" Only used when an item doesn't have highlighting yet
hi def link confComment	Comment
hi def link confTodo	Todo
hi def link confString	String

let b:current_syntax = "routeros"
