" encoding ("MUST BE" on top)
set fileencodings=utf-8,euc-kr,cp949
set encoding=utf-8
set termencoding=utf-8
set fenc=utf-8
set fencs=utf-8,cp949,cp932,euc-jp,shift-jis,big5,latin1,ucs-2le

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

colorscheme torte

" 커서 위치 항상 보이기
set ru

" 완성중인 명령을 표시
set sc

" 줄번호 표시
set nu

" 화면 우측 하단에 현재 커서의 위치 표시
set ruler               

" Tab 크기를 4로 설정
set tabstop=4           

" 자동들여쓰기 크기를 4로 설정
set shiftwidth=4        

" 이전 작업하던 라인을 기억한다.
set history=999         

set nocompatible

" 자동으로 들여쓰기를 한다.
set ai

" 클립보드 복사, 붙여넣기
map <C-c> "+y
map <C-v> "+P

nmap <C-J> <C-w>j<C-W>_
nmap <C-K> <C-W>k<C-W>_
nmap <C-S> <C-C>:wq
set wmh=0
set ts=4
set sw=4
set nobackup
set nowritebackup
set paste
set autoindent
set guifont=Consolas:h11:cANSI

" 메뉴와 메시지창 한글 깨짐 문제 해결
source $VIMRUNTIME/delmenu.vim
set langmenu=ko.UTF-8
source $VIMRUNTIME/menu.vim
