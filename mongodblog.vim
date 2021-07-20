" Vim syntax file
" Language: mongo logs
" Maintainer: Niko Janceski (@deathanchor)
" Latest Revision: 2015-09-03

if exists("b:current_syntax")
  finish
endif

let b:current_syntax = "mongodblog"

" comment this one if you have trouble with new matches
" it's a very general match
syn match mCommand '\v\]\s\w+\s+\S+' contains=mCommands,mStateChange
syn keyword mCommands query command update insert remove update nextgroup=mDbCollection skipwhite contained
hi def link mCommands Statement

syn match mDbCollection '\v(\w|-)+\.\$?(\w|-)+' contained contains=mDatabase,mCollection
syn match mDatabase '\v(\w|-)+' contained nextgroup=mCollection
syn match mCollection '\v\.\$?(\w|-)+' contained
hi def link mDatabase Identifier
hi def link mCollection PreProc

" dates times
syn match datetime '^\v\w+\s+\w+\s+\d+\s+\S+' contains=date,time
syn match date '^\v\w+\s+\w+\s+\d+' contained nextgroup=time
syn match time '\d\d:\d\d:\d\d' contained
hi def link date Comment
hi def link time Ignore

" bad things
syn match mLongReadWrites '[rw]:\v\d{7,}'
syn match mLongOps '\v\d{5,}ms'
syn match mFatals '\v(exception|fatal|error)\c.*'
hi def link longReadWrites Error
hi def link longOps Error
hi def link fatals Error

" replication process
syn match mRsProcess '\v\[rs\w+\]'
hi def mRsProcess ctermbg=0 ctermfg=1 guifg=Red guibg=Black

" state changes
syn match mStateChange 'transition to \v\S+' contains=mPrimary,mSecondary,mOtherStates

syn keyword mOtherStates OTHER RECOVERING STARTUP ROLLBACK contained
hi def link mOtherStates ErrorMsg

syn match mPrimary '\cprimary' contained
hi def link mPrimary StatusLineTerm

syn match mSecondary '\csecondary' contained
hi def link mSecondary Pmenu

" big things
syn region mDocument start='{' end='}'
hi def link document Normal
