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

colorscheme tango

if v:lang =~ "^ko"
  set encoding=cp949
  set fileencodings=utf-8,cp949
  set guifontset=-*-*-medium-r-normal--16-*-*-*-*-*-*-*
elseif v:lang =~ "^ja_JP"
  set fileencodings=euc-jp
  set guifontset=-misc-fixed-medium-r-normal--14-*-*-*-*-*-*-*
elseif v:lang =~ "^zh_TW"
  set fileencodings=big5
  set guifontset=-sony-fixed-medium-r-normal--16-150-75-75-c-80-iso8859-1,-taipei-fixed-medium-r-normal--16-150-75-75-c-160-big5-0
elseif v:lang =~ "^zh_CN"
  set fileencodings=gb2312
  set guifontset=*-r-*
endif
if v:lang =~ "utf8$" || v:lang =~ "UTF-8$"
  set encoding=utf-8
  set fileencodings=utf-8,cp949
endif

set bomb

" Ŀ�� ��ġ �׻� ���̱�
set ru
" �ϼ����� ����� ǥ��
set sc

" �ٹ�ȣ ǥ��
set nu

" �� ��ȣ ǥ�� �ʺ� ����
set nuw=5

" �� ũ�� ����
set ts=4
set tabstop=4

nmap <C-J> <C-w>j<C-W>_
nmap <C-K> <C-W>k<C-W>_

"  ������� ���� ���� ����
set nobackup

" �޴��� �޽���â �ѱ� ���� ���� �ذ�
source $VIMRUNTIME/delmenu.vim
set langmenu=ko.UTF-8
source $VIMRUNTIME/menu.vim

" ���� ���� ���� ��ġ ����
if has("autocmd")
    " When editing a file, always jump to the last cursor position
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \   exe "normal g'\"" |
    \ endif
endif

