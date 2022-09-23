# VIM COMMANDS AND TIPS

## OPEN A FILE IN A SPECIFIC LINE

    Type vim <+line number> <file>
    example:
    vim +35 file1.txt

## CONFIGURE VIM

### ACTIVATE SYNTAX HIGHLIGHT

    :syntax on

### ACTIVATE LINE NUMBERS

    :set number

### CREATE PERSISTENT CONFIGURATION ON VIM

    Open or create .vimrc in home directory

    $ vim .vimrc

        Inside .vimrc type the configurations you want to persist:

        :set number
        :set syntax

        save to persist your changes:
        :wq

## UNDO and REDO CHANGES

    Press U to undo
    Press crt+r to redo

## INSERT IN VIM

### INSERT TEXT

    Press i to insert text where the cursor is pointing

    Press o to insert a new line after the one the cursor is in

    Press shift+p to insert a new line before the one the cursor is in

### APPEND TEXT AFTER

    Press a to append text after the character where the cursor is pointing
    example:
    in "/* js */" this will insert after the first / if you are at the beginning of the line

    Press shift+a to append text at the end of the line where the cursor is positioned

## DELETE WITHIN VIM

    In command mode to delete the word you are positioned press dw
    If you want to delete all th line press dd
    If you want to delete certain numbers of lines press d+<number of lines>+d
    If you want to delete all lines through the end of the file press d+shift+G

    To delete from where cursor is to beginning of the word press d+b
    To delete from where cursor is to end of the word press d+shift+$

## CUT AND PASTE

    To cut a line press dd (this do not delete the line only cuts it and put it in clipboard)
    To paste what you have on clipboard press p , this will paste that where the cursor is positioned

## NAVIGATION WITH VIM

    ### MOVING IN COMMAND MODE
        J = down
        K = up
        L = left
        H = right

        W = move to end/next of word
        B = move to start/previous word

        0 = go to start of line
        $ = go to end of line
        ^ = go to start of line after white spaces
        gg = beginning of document/first line
        shift+G  = end of document/last line

    ### To move to a specific line type
        <line number>+gg
        example:
        88gg

## SEARCH AND REPLACE IN VIM

    ###SEARCH
    To search for a word in command mode press /+<word>
    example:
    /final+enter    ####this takes you to the first word
    to navigate to the next word it found towards the end of the file press n
    to navigate to the previous word it found towards the beginning of the file press shift+n

    ###SEARCH AND REPLACE
    To search and replace a string type:
    :%/s/<search for>/<replace with>/gc     #### gc is used to prompt for confirmation on replacement, if you only use g (without c) it will go and replace all occurrences on file
    example:
    :%s/gender/Non-binary

## CREATE A NEW FILE

    To create a new file type:

    vim <file name>
