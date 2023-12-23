return {
  {
    "CRAG666/code_runner.nvim",
    opts = {
      filetype = {
        java = {
          "cd $dir &&",
          "javac $fileName &&",
          "java $fileNameWithoutExt",
        },
        python = "python3 -u",
        typescript = "bun",
        javascript = "bun",
        reactjavascript = "bun",
        typescriptreact = "bun",
        rust = {
          "cd $dir &&",
          "rustc $fileName &&",
          "$dir/$fileNameWithoutExt",
        },
        markdown = {
          "slides",
        },
      },
    },
    keys = {
      { "<leader>r", desc = "Code runner" },
      { "<leader>rr", ":RunCode<cr>", desc = "run code" },
      { "<leader>rf", ":RunFile<cr>", desc = "run file" },
      { "<leader>rp", ":RunProject<cr>", desc = "run project" },
      { "<leader>rc", ":RunClose<cr>", desc = "close" },
    },
  },
}
