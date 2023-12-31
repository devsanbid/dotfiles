return {
  {
    "ThePrimeagen/harpoon",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
    cmd = { "Harpoon" },
    keys = {
      {
        "<C-x>",
        function()
          vim.ui.input({ prompt = "Harpoon mark index: " }, function(input)
            local num = tonumber(input)
            if num then require("harpoon.ui").nav_file(num) end
          end)
        end,
        desc = "Goto index of mark",
      },
      { "<C-p>", function() require("harpoon.ui").nav_prev() end, desc = "Goto previous mark" },
      { "<C-n>", function() require("harpoon.ui").nav_next() end, desc = "Goto next mark" },
    },
  },
}
