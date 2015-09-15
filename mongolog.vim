" Vim syntax file
" Language: mongo logs
" Maintainer: Niko Janceski (@deathanchor)
" Latest Revision: 2015-09-03

if exists("b:current_syntax")
  finish
endif

let b:current_syntax = "mongolog"

" Keywords
syn keyword commands query command update insert remove update nextgroup=dbcollection skipwhite contained

" Matches
syn match mongoCommand '\v\]\s\w+\s+\S+' contains=commands
syn match dbcollection '\v\w+\.\$?\w+' contained contains=database,collection
syn match database '\v\w+' contained nextgroup=collection
syn match collection '\v\.\$?\w+' contained

syn match datetime '^\v\w+\s+\w+\s+\d+\s+\S+' contains=date,time
syn match date '^\v\w+\s+\w+\s+\d+' contained nextgroup=time
syn match time '\d\d:\d\d:\d\d' contained


syn match longReadWrites '[rw]:\v\d{7,}'
syn match longOps '\v\d{5,}ms'
syn match fatals '\v(exception|fatal|error)\c.*'


" Regions
syn region document start='{' end='}'


hi def link commands Statement
hi def link database Identifier
hi def link collection PreProc
hi def link document Normal
hi def link date Comment
hi def link time Ignore
hi def link longReadWrites Error
hi def link longOps Error
hi def link fatals Error

