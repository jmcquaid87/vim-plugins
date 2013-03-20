" Vim syntax file
" Language: git output : diff
" Maintainer: Wolfgang Mehner <wolfgang-mehner@web.de>
" Last Change: 19.03.2013

if exists("b:current_syntax")
	finish
endif

syn sync fromstart
syn case match

"-------------------------------------------------------------------------------
" Syntax
"-------------------------------------------------------------------------------

" top-level categories:
" - GitDiffRegion

syn region GitDiffRegion       start=/^diff / end=/^\%(diff \)\@=/ contains=GitDiffHeader,GitDiffLines,GitMergeLines fold
syn region GitDiffLines        start=/^@@ /   end=/^\%(@@ \)\@=\|^\%(diff \)\@=/ contains=GitDiffRange,GitDiffLineP,GitDiffLineM fold contained
syn region GitMergeLines       start=/^@@@ /  end=/^\%(@@@ \)\@=\|^\%(diff \)\@=/ contains=GitMergeRange,GitMergeLineP,GitMergeLineM,GitMergeConflict fold contained

syn match  GitDiffHeader       "^\w.*$"    contained
syn match  GitDiffHeader       "^--- .*$"  contained
syn match  GitDiffHeader       "^+++ .*$"  contained

syn match  GitDiffRange        "^@@[^@]\+@@"  contained
syn match  GitDiffLineP        "^+.*$"        contained
syn match  GitDiffLineM        "^-.*$"        contained

syn match  GitMergeRange       "^@@@[^@]\+@@@"   contained
syn match  GitMergeLineP       "^+ .*$"          contained
syn match  GitMergeLineP       "^ +.*$"          contained
syn match  GitMergeLineM       "^- .*$"          contained
syn match  GitMergeLineM       "^ -.*$"          contained
syn match  GitMergeConflict    "^++<<<<<<< .\+"  contained
syn match  GitMergeConflict    "^++======="      contained
syn match  GitMergeConflict    "^++>>>>>>> .\+"  contained

"-------------------------------------------------------------------------------
" Highlight
"-------------------------------------------------------------------------------

highlight default link GitDiffHeader     GitHeading1
highlight default link GitDiffRange      GitHeading2
highlight default link GitDiffLineP      GitAdd
highlight default link GitDiffLineM      GitRemove
highlight default link GitMergeRange     GitHeading2
highlight default link GitMergeLineP     GitAdd
highlight default link GitMergeLineM     GitRemove
highlight default link GitMergeConflict  GitConflict

let b:current_syntax = "gitsdiff"
