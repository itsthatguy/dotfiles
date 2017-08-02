# Your init script
#
# Atom will evaluate this file each time a new window is opened. It is run
# after packages are loaded/activated and after the previous editor state
# has been restored.
#
# An example hack to log to the console when each text editor is saved.
#
# atom.workspace.observeTextEditors (editor) ->
#   editor.onDidSave ->
#     console.log "Saved! #{editor.getPath()}"
atom.commands.add 'atom-text-editor',
  'custom:const-case': (event) ->
    editorElement = atom.views.getView(atom.workspace.getActiveTextEditor())
    atom.commands.dispatch(editorElement, 'editor:select-word')
    atom.commands.dispatch(editorElement, 'vim-mode-plus:snake-case')
    atom.commands.dispatch(editorElement, 'editor:upper-case')
    atom.commands.dispatch(editorElement, 'vim-mode-plus:reset-normal-mode')
