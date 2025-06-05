return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "ibhagwan/fzf-lua", -- Replace Telescope with fzf-lua
  },
  keys = function()
    local keys = {
      { "h", false },
      { "H", false },

      -- Open Harpoon list using fzf-lua
      {
        "<leader>hl",
        function()
          local harpoon = require("harpoon")
          local file_paths = {}

          for _, item in ipairs(harpoon:list().items) do
            table.insert(file_paths, item.value)
          end

          require("fzf-lua").fzf_exec(file_paths, {
            prompt = "Harpoon Files> ",
            previewer = "builtin",
            actions = {
              ["default"] = function(selected)
                if #selected > 0 then
                  vim.cmd("edit " .. selected[1])
                end
              end,
            },
          })
        end,
        desc = "Harpoon: Open file list (fzf-lua)",
      },

      -- Clear all Harpoon marks
      {
        "<leader>hc",
        function()
          require("harpoon"):list():clear()
        end,
        desc = "Harpoon: Clear all marks",
      },

      -- Add current file to Harpoon
      {
        "<leader>ha",
        function()
          require("harpoon"):list():add()
        end,
        desc = "Harpoon: Add current file",
      },
    }

    for i = 1, 5 do
      table.insert(keys, {
        "<leader>h" .. i,
        function()
          require("harpoon"):list():select(i)
        end,
        desc = "Harpoon to File " .. i,
      })
    end

    return keys
  end,
  config = function()
    require("harpoon"):setup()
  end,
}
