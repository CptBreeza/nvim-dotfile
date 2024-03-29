local _, lsp_installer = pcall(require, "nvim-lsp-installer")

local options = {
   -- ensure_installed is not needed as automatic_installation is enabled
   -- then any lsp server you setup by lspconfig is going to get installed automatically!

   -- ensure_installed = { "lua" },
   automatic_installation = false,

   ui = {
      icons = {
         server_installed = "",
         server_pending = "",
         server_uninstalled = "ﮊ",
      },
      keymaps = {
         toggle_server_expand = "<CR>",
         install_server = "i",
         update_server = "u",
         check_server_version = "c",
         update_all_servers = "U",
         check_outdated_servers = "C",
         uninstall_server = "X",
      },
   },

   max_concurrent_installers = 20,
}

lsp_installer.setup(options)
