local keyMapper = require("utils.keyMapper").mapKey

return {
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local builtin = require("telescope.builtin")
      keyMapper("<leader>ff", builtin.find_files)
      keyMapper("<leader>fg", builtin.live_grep)
      keyMapper("<leader>fb", builtin.buffers)
      keyMapper("<leader>fh", builtin.help_tags)
    end
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    config = function()
      require('telescope').setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown {
            }
          }
        }
      })
      require("telescope").load_extension("ui-select")
    end
  }
}
