r-- Define a Neovim plugin configuration for Mason
return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    -- Import Mason for plugin management
    local mason = require("mason")

    -- Import Mason LSPConfig for language server configuration
    local mason_lspconfig = require("mason-lspconfig")

    -- Import Mason Tool Installer for tool installation
    local mason_tool_installer = require("mason-tool-installer")

    -- Enable Mason and configure icons
    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    -- Configure Mason LSPConfig with a list of servers to install
    mason_lspconfig.setup({
      ensure_installed = {
        "tsserver",
        "html",
        "cssls",
        "tailwindcss",
        "svelte",
        "lua_ls",
        "graphql",
        "emmet_ls",
        "prismals",
        "pyright",
      },
      automatic_installation = true, -- Auto-install configured servers (with lspconfig)
    })

    -- Configure Mason Tool Installer with a list of tools to ensure installation
    mason_tool_installer.setup({
      ensure_installed = {
        "prettier",   -- Prettier formatter
        "stylua",     -- Lua formatter
        "isort",      -- Python formatter
        "black",      -- Python formatter
        "pylint",     -- Python linter
        "eslint_d",   -- JavaScript linter
      },
    })
  end,
}
