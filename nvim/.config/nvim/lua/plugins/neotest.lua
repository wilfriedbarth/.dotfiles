return {
  { "nvim-neotest/neotest-python" },
  { "nvim-neotest/neotest-go" },
  { "nvim-neotest/neotest-jest" },
  {
    "nvim-neotest/neotest",
    opts = { adapters = { "neotest-python", "neotest-go", "neotest-jest" } },
  },
}
