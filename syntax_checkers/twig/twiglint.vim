"============================================================================
"File:        twig.vim
"Description: Syntax checking plugin for syntastic.vim
"Maintainer:  Alexander <iam.asm89 at gmail dot com>
"License:     This program is free software. It comes without any warranty,
"             to the extent permitted by applicable law. You can redistribute
"             it and/or modify it under the terms of the Do What The Fuck You
"             Want To Public License, Version 2, as published by Sam Hocevar.
"             See http://sam.zoy.org/wtfpl/COPYING for more details.
"
"============================================================================

if exists("g:loaded_syntastic_twig_twiglint_checker")
    finish
endif
let g:loaded_syntastic_twig_twiglint_checker = 1

let s:save_cpo = &cpo
set cpo&vim

function! SyntaxCheckers_twig_twiglint_GetHighlightRegex(item)
    " Let's match the full line for now
    return '\V'
endfunction

function! SyntaxCheckers_twig_twiglint_GetLocList() dict
    let makeprg = self.makeprgBuild({ 'args': 'lint --format=csv' })

    let errorformat = '"%f"\,%l\,%m'

    return SyntasticMake({
        \ 'makeprg': makeprg,
        \ 'errorformat': errorformat})
endfunction

call g:SyntasticRegistry.CreateAndRegisterChecker({
    \ 'filetype': 'twig',
    \ 'name': 'twiglint',
    \ 'exec': 'twig-lint'})

let &cpo = s:save_cpo
unlet s:save_cpo

" vim: set et sts=4 sw=4:
