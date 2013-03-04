function! InsertCFArgumentIfNotThere()
  call setreg('x', getline("."))
  if match(@x, "cfargument") < 0
     normal I <cfargument name="placeholder_for_consistency" required="no">
  else
     echom "No match!"
  endif
endfunction
