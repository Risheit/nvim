return {
    'akinsho/toggleterm.nvim',
    opts = {
        open_mapping = [[<c-\>]],
        shade_terminals = true,
        shading_factor = 2,
        direction = 'float',
        border = 'curved',
        insert_mappings = true,
        hide_numbers = true, -- hide the number column in toggleterm buffers
        auto_scroll = true, -- automatically scroll to the bottom on terminal output
    }
}

