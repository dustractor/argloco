#argloco


Vim plugin that extends Taboo.vim as a project setup utility for setting up
named tabs.

#commands provided

* GoForth
    Traverse forwards the argument list
* GoBackth
    Traverse backwards the argument list

In both cases, if there is a tab-local argument list, then that is used,
otherwise the normal vim-wide argument list is traversed.

* ArgLoco

Recieves a list of lists.  The sublists should each have 2 items, both string.
The first item on each list is the tab name.  The second item is used to set
the argument list for that tab.

gcmt/taboo.vim is being used to create the named tabs, thus it is required.

``Plug 'gcmt/taboo.vim'``


