# vim-addtions

## Overview

Tools for making failed bash jobs easily alerting via nagios

## Authors

### Main Author
 Nikola Janceski (@deathanchor)

## Installation

Install mongolog.vim into your ~/.vim/syntax/ directory.

To highlight, in vim you can do:
<pre><code>
:set filetype=mongolog
</code></pre>

If you have specific filename like 'mongod.log' add this to your .vimrc for auto file typeset:

<pre><code>
au BufRead,BufNewFile mongod.log set filetype=mongolog
</code></pre>

