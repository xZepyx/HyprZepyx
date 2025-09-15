-- File: ~/.config/nvim/lua/plugins/lsp.lua

return {
  -- Main LSP Configuration
  'neovim/nvim-lspconfig',

  dependencies = {
    { 'williamboman/mason.nvim', config = true },
    'williamboman/mason-lspconfig.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    { 'j-hui/fidget.nvim', opts = {} },
    'hrsh7th/cmp-nvim-lsp',

    -- LSP Signature plugin (function args popup)
    {
      'ray-x/lsp_signature.nvim',
      config = function()
        require('lsp_signature').setup({
          bind            = true,
          hint_enable     = true,
          floating_window = true,
          hint_prefix     = " ",
          handler_opts    = { border = "rounded" },
        })
      end,
    },
  },

  config = function()
    ------------------------------------------------------------------------------------------------
    -- 1) When any LSP attaches to a buffer, set up keymaps & highlights
    ------------------------------------------------------------------------------------------------
    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
      callback = function(event)
        local bufmap = function(keys, func, desc, mode)
          mode = mode or 'n'
          vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
        end

        bufmap('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
        bufmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
        bufmap('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
        bufmap('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')
        bufmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
        bufmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
        bufmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
        bufmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction', { 'n', 'x' })
        bufmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
          local highlight_grp = vim.api.nvim_create_augroup('kickstart-lsp-highlights', { clear = false })
          vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
            buffer = event.buf,
            group = highlight_grp,
            callback = vim.lsp.buf.document_highlight,
          })
          vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
            buffer = event.buf,
            group = highlight_grp,
            callback = vim.lsp.buf.clear_references,
          })
          vim.api.nvim_create_autocmd('LspDetach', {
            group = vim.api.nvim_create_augroup('kickstart-lsp-detach', { clear = true }),
            callback = function(ev2)
              vim.lsp.buf.clear_references()
              vim.api.nvim_clear_autocmds { group = 'kickstart-lsp-highlights', buffer = ev2.buf }
            end,
          })
        end

        if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
          bufmap('<leader>th', function()
            vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf })
          end, '[T]oggle Inlay [H]ints')
        end
      end,
    })

    ------------------------------------------------------------------------------------------------
    -- 2) Build LSP capabilities (for nvim-cmp)
    ------------------------------------------------------------------------------------------------
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

    ------------------------------------------------------------------------------------------------
    -- 3) List exactly the Mason packages you want
    ------------------------------------------------------------------------------------------------
    local mason_servers = {
      'clangd',              -- C/C++
      'pyright',             -- Python language server
      'ruff-lsp',            -- Ruff-based linting for Python
      'lua-language-server', -- Lua (for editing init.lua)
      'bash-language-server',-- Bash
      'html',                -- HTML
      'cssls',               -- CSS
      'jsonls',              -- JSON
      'yamlls',              -- YAML
    }

    ------------------------------------------------------------------------------------------------
    -- 4) Set up Mason & auto-install those servers
    ------------------------------------------------------------------------------------------------
    require('mason').setup()

    require('mason-tool-installer').setup {
      ensure_installed = mason_servers,
      auto_update      = false,
      run_on_start     = true,
    }

    require('mason-lspconfig').setup {
      ensure_installed = mason_servers,
      handlers = {
        function(server_name)
          local opts = { capabilities = capabilities }

          -- You can add server-specific overrides here if needed:
          -- if server_name == "clangd" then opts.cmd = { "clangd", "--background-index" } end

          require('lspconfig')[server_name].setup(opts)
        end,
      },
    }
  end,
}

