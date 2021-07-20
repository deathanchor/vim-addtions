# vim-addtions

## Overview

Vim settings and other nice things

## Authors

### Main Author
 Nikola Janceski (@deathanchor)

## Installation

Install mongodblog.vim into your ~/.vim/syntax/ directory.

To highlight, in vim you can do:
<pre><code>
:set filetype=mongodblog
</code></pre>

If you have specific filename like 'mongod.log' add this to your .vimrc for auto file typeset:

<pre><code>
augroup mongodblog
  au!
  autocmd BufRead,BufNewFile *mongod*.log set filetype=mongodblog
augroup end
</code></pre>
