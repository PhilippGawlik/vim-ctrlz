function! ThisIsOnlyOpenBuffer()
    let numberOfOpenBuffers = len(getbufinfo({'bufloaded': 1}))
    return numberOfOpenBuffers <= 1
endfunction


function! MultipleOpenBuffer()
    return ThisIsOnlyOpenBuffer() == 0
endfunction


function! GoToBuffer(buffer)
    silent execute 'b '. a:buffer
endfunction


function! BufferDoesNotExist(buffername)
    return bufexists(a:buffername) == 0
endfunction


function! RefreshPreviousBuffer(buffername, previousBufferNr)
   " refresh previous buffer backjump position
   " without this step the backjump position
   " is the terminal buffer before renaming as 'terminal'
   " and because it is renamed and doesn't exist any more
   " a new, unnamed terminal buffer would be created
   "
   " refresh previousBufferNr means go forth-and-back one time
   call GoToBuffer(a:previousBufferNr)
   call GoToBuffer(a:buffername)
endfunction


function! CreateAndGoToTerminalBuffer(buffername, previousBufferNr)
  silent execute 'terminal'
  silent execute 'file ' . a:buffername
  echom a:buffername . ' buffer created'
  " if check available previous buffer (e.g. coming from Startify)
  if MultipleOpenBuffer() 
     call RefreshPreviousBuffer(a:buffername, a:previousBufferNr)
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
    let currentBufName = bufname()
    if currentBufName == "terminal"
      if ThisIsOnlyOpenBuffer()
          echom 'This is the only open buffer! Opening new one.'
          silent execute ':enew'
      else
          silent execute ':b #'
      endif
    endif
endfunction


nnoremap <silent> <C-z> :call ControlZ("terminal")<CR>
vnoremap <silent> <C-z> :call ControlZ("terminal")<CR>
tnoremap <silent> <C-z> <C-\><C-n>:call JumpToPreviousBuffer()<CR>
