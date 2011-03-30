" Copyright Stefan Otte.
"
" xabsl.vim: Vim syntax file for xabsl. www.xabsl.de
"
" mostly stolen from the go.vim syntax file


" Quit when a (custom) syntax file was already loaded
if exists("b:current_syntax")
  finish
endif

syn case match

syn keyword     xabslDirective         option namespace include agent 
syn keyword     xabslDeclaration       internal input output

hi def link     xabslDirective         Statement
hi def link     xabslDeclaration       Keyword

syn keyword     xabslStatement         stay goto
syn keyword     xabslConditional       if else
syn keyword     xabslLabel             state initial target decision action common

hi def link     xabslStatement         Statement
hi def link     xabslConditional       Conditional
hi def link     xabslLabel             Label

" Predefined types
syn keyword     xabslType              bool enum true false
syn keyword     xabslFloats            float
"syn keyword     xabslComplexes         \@

hi def link     xabslType              Type
hi def link     xabslFloats            Type


" Predefined functions and values
"syn keyword     xabslBuiltins          ???
"syn keyword     xabslConstants         true false

"hi def link     xabslBuiltins          Keyword
"hi def link     xabslConstants         Keyword

" Comments; their contents
syn keyword     xabslTodo              contained TODO FIXME XXX BUG
syn cluster     xabslCommentGroup      contains=xabslTodo
syn region      xabslComment           start="/\*" end="\*/" contains=@xabslCommentGroup,@Spell
syn region      xabslComment           start="//" end="$" contains=@xabslCommentGroup,@Spell

hi def link     xabslComment           Comment
hi def link     xabslTodo              Todo

" xabsl escapes
" probably not necessary
syn match       xabslEscapeOctal       display contained "\\[0-7]\{3}"
syn match       xabslEscapeC           display contained +\\[abfnrtv\\'"]+
syn match       xabslEscapeX           display contained "\\x\x\{2}"
syn match       xabslEscapeU           display contained "\\u\x\{4}"
syn match       xabslEscapeBigU        display contained "\\U\x\{8}"
syn match       xabslEscapeError       display contained +\\[^0-7xuUabfnrtv\\'"]+

hi def link     xabslEscapeOctal       xabslSpecialString
hi def link     xabslEscapeC           xabslSpecialString
hi def link     xabslEscapeX           xabslSpecialString
hi def link     xabslEscapeU           xabslSpecialString
hi def link     xabslEscapeBigU        xabslSpecialString
hi def link     xabslSpecialString     Special
hi def link     xabslEscapeError       Error

" Strings and their contents
" probably not necessary
syn cluster     xabslStringGroup       contains=xabslEscapeOctal,xabslEscapeC,xabslEscapeX,xabslEscapeU,xabslEscapeBigU,xabslEscapeError
syn region      xabslString            start=+"+ skip=+\\\\\|\\"+ end=+"+ contains=@xabslStringGroup
syn region      xabslRawString         start=+`+ end=+`+

hi def link     xabslString            String
hi def link     xabslRawString         String

" Characters; their contents
" probably not necessary
syn cluster     xabslCharacterGroup    contains=xabslEscapeOctal,xabslEscapeC,xabslEscapeX,xabslEscapeU,xabslEscapeBigU
syn region      xabslCharacter         start=+'+ skip=+\\\\\|\\'+ end=+'+ contains=@xabslCharacterGroup

hi def link     xabslCharacter         Character

" Regions
syn region      xabslBlock             start="{" end="}" transparent fold
syn region      xabslParen             start='(' end=')' transparent

" Integers
syn match       xabslDecimalInt        "\<\d\+\([Ee]\d\+\)\?\>"
syn match       xabslHexadecimalInt    "\<0x\x\+\>"
syn match       xabslOctalInt          "\<0\o\+\>"
syn match       xabslOctalError        "\<0\o*[89]\d*\>"

hi def link     xabslDecimalInt        Integer
hi def link     xabslHexadecimalInt    Integer
hi def link     xabslOctalInt          Integer
hi def link     Integer             Number

" Floating point
syn match       xabslFloat             "\<\d\+\.\d*\([Ee][-+]\d\+\)\?\>"
syn match       xabslFloat             "\<\.\d\+\([Ee][-+]\d\+\)\?\>"
syn match       xabslFloat             "\<\d\+[Ee][-+]\d\+\>"

hi def link     xabslFloat             Float


" Search backwards for a global declaration to start processing the syntax.
"syn sync match xabslSync grouphere NONE /^\(const\|var\|type\|func\)\>/

" There's a bug in the implementation of grouphere. For now, use the
" following as a more expensive/less precise workaround.
syn sync minlines=500

let b:current_syntax = "xabsl"
