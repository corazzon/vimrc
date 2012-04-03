set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

colorscheme tango

set fencs=utf-8,cp949,cp932,ucs-2le,shift-jis,big5,latin1,latin2
set fenc=utf-8
set bomb

" 커서 위치 항상 보이기
set ru
완성중인 명령을 표시
set sc

" 줄번호 표시
set nu

" 줄 번호 표시 너비 설정
set nuw=5

" 탭 크기 설정
set ts=4
set tabstop=4

nmap <C-J> <C-w>j<C-W>_
nmap <C-K> <C-W>k<C-W>_

"  백업파일 생성 하지 않음
set nobackup

" 메뉴와 메시지창 한글 깨짐 문제 해결
source $VIMRUNTIME/delmenu.vim
set langmenu=ko.UTF-8
source $VIMRUNTIME/menu.vim
