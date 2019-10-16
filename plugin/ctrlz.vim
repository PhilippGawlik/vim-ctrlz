let path = expand('%:p:h')
exec 'source' path . '/utils.vim'
exec 'source' path . '/buff_utils.vim'

tnoremap <expr> <CR> NestedVimWarning() ? '<CR>' : ''


function! NestedVimWarning()
  let Pattern = "vim"
  if FindPatternOnCurrentLine(Pattern)
    let Question = "Looks like you are about to open vim in vim. Proceed? (y/n)"
    if AskForPermissionYesNo(Question)
      return 1
    else
      echom "Ignoring command execution because of user decision"
      return 0
    endif
  else
    return 1
  endif
endfunction


function! ControlZ(buffername)
    let previousBufferNr = bufnr("%")
    if BufferDoesNotExist(a:buffername)
       call CreateAndGoToTerminalBuffer(a:buffername, previousBufferNr)
    else
       call GoToBuffer(a:buffername)
    endif
    silent execute 'startinsert'
 endfunction


" Go to the last active buffer if current buffer is not the only buffer
function! JumpToPreviousBuffer()
    if ThisIsOnlyOpenBuffer()
        echom 'This is the only open buffer! Opening new one.'
        silent execute ':enew'
    else
        silent execute ':b #'
    endif
endfunction
