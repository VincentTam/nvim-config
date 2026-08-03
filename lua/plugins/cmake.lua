return {
  "Civitasv/cmake-tools.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
  },
  config = function()
    require("cmake-tools").setup({
      cmake_build_directory = "build/${variant:buildType}",
      cmake_generate_options = {
        "-G",
        "Ninja",
                "-DCMAKE_EXPORT_COMPILE_COMMANDS=ON",
        },
    })
    vim.keymap.set("n", "<leader>cg", "<cmd>CMakeGenerate<CR>", { desc = "CMake Generate" })
    vim.keymap.set("n", "<leader>cb", "<cmd>CMakeBuild<CR>", { desc = "CMake Build" })
    vim.keymap.set("n", "<leader>cc", "<cmd>CMakeRun<CR>", { desc = "CMake Run" })
    vim.keymap.set("n", "<leader>cr", "<cmd>CMakeDebug<CR>", { desc = "CMake Debug" })
  end,
}
