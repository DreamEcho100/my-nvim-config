return {
  'nvimtools/none-ls.nvim',
  dependencies = {
    'nvimtools/none-ls-extras.nvim',
    'jayp0521/mason-null-ls.nvim', -- ensure dependencies are installed
  },
  config = function()
    local null_ls = require 'null-ls'
    local formatting = null_ls.builtins.formatting -- to setup formatters
    local diagnostics = null_ls.builtins.diagnostics -- to setup linters

    -- Formatters & linters for mason to install
    require('mason-null-ls').setup {
      ensure_installed = {
        'prettier',
        'prettierd', -- ts/js formatter
        'biome', -- Alternative JS/TS formatter
        'stylua', -- lua formatter
        'eslint_d', -- ts/js linter
        'shfmt', -- Shell formatter
        'checkmake', -- linter for Makefiles
        'ruff', -- Python linter and formatter
        'black', -- Python formatter
        'clang-format', -- C/C++ formatter
        'cpplint', -- C/C++ linter
      },
      automatic_installation = true,
    }

    local sources = {
      -- C/C++
      formatting.clang_format,
      -- diagnostics.cpplint,
      require 'none-ls.diagnostics.cpplint',

      -- JavaScript, TypeScript, HTML, CSS
      formatting.prettier.with { filetypes = { 'html', 'json', 'yaml', 'markdown' } },
      formatting.prettierd,
      formatting.biome,
      -- diagnostics.eslint_d,
      require 'none-ls.diagnostics.eslint_d',

      -- Lua
      formatting.stylua,

      -- Shell
      formatting.shfmt.with { args = { '-i', '4' } },

      -- Python
      require('none-ls.formatting.ruff').with { extra_args = { '--extend-select', 'I' } },
      require 'none-ls.formatting.ruff_format',
      formatting.black,

      -- Makefiles
      diagnostics.checkmake,

      -- Terraforme
      formatting.terraform_fmt,
      require('none-ls.formatting.ruff').with { extra_args = { '--extend-select', 'I' } },
    }

    local augroup = vim.api.nvim_create_augroup('LspFormatting', {})
    null_ls.setup {
      -- debug = true, -- Enable debug mode. Inspect logs with :NullLsLog.
      sources = sources,
      -- you can reuse a shared lspconfig on_attach callback here
      on_attach = function(client, bufnr)
        if client.supports_method 'textDocument/formatting' then
          vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
          vim.api.nvim_create_autocmd('BufWritePre', {
            group = augroup,
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format { async = false }
            end,
          })
        end
      end,
    }
  end,
}
