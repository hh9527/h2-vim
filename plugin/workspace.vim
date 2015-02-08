if !exists('g:loaded_workspace')
  let g:loaded_workspace = 1
  function! AutoWorkspaceConfigure(force)
    if a:force || !exists('b:workspace_conf')
      let b:workspace_conf = {'fpath': '', 'ftime': 0, 'cmds': []}
    endif
    let fn = findfile('.workspace.json', '.;')
    if fn != ''
      let fpath = fnamemodify(fn, ':p')
      let ftime = getftime(fpath)
      if b:workspace_conf.fpath != fpath || b:workspace_conf.ftime != ftime
        let cmds = []
        try
          let conf = eval(join(readfile(fpath)))
          let e = 0
        catch
          let e = 1
        endtry
        if e == 0
          let saved_top = $TOP
          let $TOP = fnamemodify(fpath, ':h')
          if has_key(conf, 'path')
            call add(cmds, 'set path=' . join(map(conf.path, 'fnameescape(fnamemodify(expand(v:val), ":p"))'), ','))
          endif
          if has_key(conf, 'tags')
            call add(cmds, 'set tags=' . join(map(conf.tags, 'fnameescape(fnamemodify(expand(v:val), ":p"))'), ','))
          endif
          if has_key(conf, 'compiler')
            call add(cmds, 'compiler! ' . conf.compiler)
          endif
          if has_key(conf, 'working_dir')
            call add(cmds, 'cd! ' . fnameescape(fnamemodify(expand(conf.working_dir), ':p:h')))
          else
            call add(cmds, 'cd! ' . fnameescape($TOP))
          endif
          let b:workspace_conf.fpath = fpath
          let b:workspace_conf.ftime = ftime
          let b:workspace_conf.cmds = cmds
          let $TOP = saved_top
        else
          echo 'Config file "' . fpath . '" load failed.'
        endif
      endif
    endif
    if !empty(b:workspace_conf.cmds)
      for cmd in b:workspace_conf.cmds
        exec cmd
      endfor
    endif
  endfunction
  autocmd BufEnter * call AutoWorkspaceConfigure(0)
endif

