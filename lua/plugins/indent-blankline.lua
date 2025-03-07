return {
  'lukas-reineke/indent-blankline.nvim',
  main = 'ibl',
  opts = {
    indent = {
      char = '▏',
      smart_indent_cap = true, -- Ensures proper indentation detection
    },
    scope = {
      enabled = true, -- Show indentation scope
      show_start = true, -- Show starting indentation line
      show_end = false,
      show_exact_scope = false,
    },
    exclude = {
      filetypes = {
        'help',
        'startify',
        'dashboard',
        'packer',
        'neogitstatus',
        'NvimTree',
        'Trouble',
      },
    },
  },
}
