#!/usr/bin/env python2.7
"""Edit a file in the host nvim instance."""
import os
import sys

from neovim import attach

args = sys.argv[1:]

addr = os.environ.get("NVIM_LISTEN_ADDRESS", None)
if not addr:
    os.execvp('nvim', ['nvim'] + args)

nvim = attach("socket", path=addr)

nvim.vars['files_to_edit'] = list(reversed(args))
for _ in args:
    nvim.command('exe "split ".remove(g:files_to_edit, 0)')
