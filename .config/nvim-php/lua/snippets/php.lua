local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local fmt = require("luasnip.extras.fmt").fmt

local function get_namespace()
  local file = vim.fn.expand("%:p") -- Get full file path
  local base_dir = vim.fn.getcwd() .. "/app" -- Adjust to your PSR-4 base (e.g., 'app')
  local relative_path = file:gsub(base_dir, ""):gsub("/[^/]+$", ""):gsub("^/", ""):gsub("/", "\\")
  local namespace = relative_path == "" and "App" or "App\\" .. relative_path
  return namespace
end

ls.add_snippets("php", {
  s(
    "class",
    fmt(
      [[
<?php

namespace {};

class {} {{
    {}
}}
]],
      {
        f(function()
          return get_namespace()
        end), -- Dynamically resolved at expansion time
        i(1, "ClassName"),
        i(0),
      }
    )
  ),
})
