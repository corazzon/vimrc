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

" Ŀ�� ��ġ �׻� ���̱�
set ru

" �ϼ����� ����� ǥ��
set sc

" �ٹ�ȣ ǥ��
set nu

" ȭ�� ���� �ϴܿ� ���� Ŀ���� ��ġ ǥ��
set ruler               

" Tab ũ�⸦ 4�� ����
set tabstop=4           

" �ڵ��鿩���� ũ�⸦ 4�� ����
set shiftwidth=4        

" ���� �۾��ϴ� ������ ����Ѵ�.
set history=999         

set nocompatible

" �ڵ����� �鿩���⸦ �Ѵ�.
set ai

" Ŭ������ ����, �ٿ��ֱ�
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

" �޴��� �޽���â �ѱ� ���� ���� �ذ�
source $VIMRUNTIME/delmenu.vim
set langmenu=ko.UTF-8
source $VIMRUNTIME/menu.vim
