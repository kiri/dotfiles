return {
    'akinsho/bufferline.nvim',
    event = "VeryLazy",
    opts = {
        options = {
            mode = "buffers",
            separator_style = "slant",
            always_show_bufferline = true,
            show_buffer_close_icons = true,
            show_close_icon = true,
            color_icons = true,
        },
    },
    keys = {
        { "<Tab>",   "<Cmd>BufferLineCycleNext<CR>" },
        { "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>" },
    },
}
