vim.cmd [[
    let g:vimspector_enable_mappings = 'HUMAN'
    let g:vimspector_install_gadgets = [ 'debugpy', 'vscode-go', 'CodeLLDB', 'vscode-node-debug2' ]

    nmap <leader>vl :call vimspector#Launch()<CR>
    nmap <Leader>vt :call vimspector#LaunchWithSettings({ "configuration": "run_test" })
    nmap <leader>vr :VimspectorReset<CR>
    nmap <leader>ve :VimspectorEval
    nmap <leader>vw :VimspectorWatch
    nmap <leader>vo :VimspectorShowOutput
    nmap <leader>vi <Plug>VimspectorBalloonEval
    xmap <leader>vi <Plug>VimspectorBalloonEval

    nmap <Leader>vc <Plug>VimspectorContinue
    nmap <Leader>vq <Plug>VimspectorStop
    nmap <Leader>vr <Plug>VimspectorRestart
    nmap <Leader>vb <Plug>VimspectorToggleBreakpoint
    nmap <Leader>v<Leader> <Plug>VimspectorRunToCursor
    nmap <Leader>vi <Plug>VimspectorStepInto
    nmap <Leader>vo <Plug>VimspectorOver
    nmap <Leader>vO <Plug>VimspectorOut
    nmap <Leader>vj <Plug>VimspectorDownFrame
    nmap <Leader>vk <Plug>VimspectorUpFrame
]]

return {
    "puremourning/vimspector",
    cmd = { "VimspectorInstall", "VimspectorUpdate" },
    fn = { "vimspector#Launch()", "vimspector#ToggleBreakpoint", "vimspector#Continue" },
    opts = {}
}
