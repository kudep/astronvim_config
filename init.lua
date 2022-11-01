local config = {
  -- Set dashboard header
  header = {},

  plugins = {
    init = {
      -- Git diff
      ["sindrets/diffview.nvim"] = {
            cmd = {"DiffviewOpen", "DiffviewFileHistory"}
          },
      },
    },
}

return config
