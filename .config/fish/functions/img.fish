 function img --description 'get image preview'
  command fzf -q 'png | jpeg | jpg' --preview='kitty icat --clear --transfer-mode=memory --stdin=no --place=$(echo $FZF_PREVIEW_COLUMNS)x$(echo $FZF_PREVIEW_LINES)@0x0 {}'
 end

