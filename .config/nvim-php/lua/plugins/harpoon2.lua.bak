return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
  },
  keys = function()
    local keys = {
      -- Group leader key
      { "<leader>h", false },
      { "<leader>H", false },

      -- Open Harpoon list using Telescope
      {
        "<leader>hl",
        function()
          local harpoon = require("harpoon")
          local conf = require("telescope.config").values

          local file_paths = {}
          for _, item in ipairs(harpoon:list().items) do
            table.insert(file_paths, item.value)
          end

          require("telescope.pickers")
            .new({}, {
              prompt_title = "Harpoon",
              finder = require("telescope.finders").new_table({
                results = file_paths,
              }),
              previewer = conf.file_previewer({}),
              sorter = conf.generic_sorter({}),
            })
            :find()
        end,
        desc = "Harpoon: Open file list (Telescope)",
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
