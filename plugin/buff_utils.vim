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
