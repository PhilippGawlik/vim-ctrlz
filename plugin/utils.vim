function! FindPatternOnCurrentLine(Pattern)
  return search(a:Pattern, 'bn', line('.')-1)
endfunction


function! AskForPermissionYesNo(question)
  let answer = input(a:question)
  if answer == "y"
    return 1
  elseif answer == "n"
    return 0
  else
    return AskForPermissionYesNo(a:question)
endfunction
