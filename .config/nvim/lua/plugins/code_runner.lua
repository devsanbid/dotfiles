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
        fish = "fish",
        bash = "bash",
        python = "python3 -u",
        typescript = "bun",
        javascript = "bun",
        reactjavascript = "bun",
        go = "go run $fileName",
        c = {
          "cdx $dir &&",
          "gcc $fileName",
          "-o $dir/$fileNameWithoutExt.out &&",
          "$dir/$fileNameWithoutExt.out",
        },
        cpp = {
          "cdx $dir &&",
          "g++ $fileName",
          "-o $dir/$fileNameWithoutExt.out &&",
          "$dir/$fileNameWithoutExt.out",
        },

        typescriptreact = "bun",
        rust = "cargo run -q",
        markdown = {
          "slides",
        },
      },
    },
    keys = {
      { "<leader>r",  desc = "Code runner" },
      { "<leader>rr", ":RunCode<cr>",      desc = "run code" },
      { "<leader>rf", ":RunFile<cr>",      desc = "run file" },
      { "<leader>rp", ":RunProject<cr>",   desc = "run project" },
      { "<leader>rc", ":RunClose<cr>",     desc = "close" },
    },
  },
}
