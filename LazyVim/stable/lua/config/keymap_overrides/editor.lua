return {
  neo_tree = {
    neotree_toggle_root = "",
    neotree_toggle_cwd = "<leader>fe",
    neotree_toggle_root_alt = "",
    neotree_toggle_cwd_alt = "<leader>e",
    neotree_toggle_git_status = "<leader>ge",
    neotree_toggle_buffers = "<leader>be",
    window = {
      neotree_win_open = "l",
      neotree_win_close_node = "h",
      neotree_win_copy_path_to_clipboard = "Y",
      neotree_win_open_with_system_application = "O",
      neotree_win_toggle_preview = "P",
    },
  },
  grug_far = {
    grugfar_open = "<leader>fr",
  },
  flash = {
    flash_jump = "",
    flash_treesitter = "<leader>s",
    flash_remote = "",
    flash_treesitter_search = "",
    flash_toggle = "", -- toggle when in command-line mode (: / ?)
  },
  which_key = {
    group = {
      tabs_prefix = "<leader><tab>",
      code_prefix = "",
      file_find_prefix = "<leader>f",
      git_prefix = "<leader>g",
      hunks_prefix = "<leader>gh",
      quit_session_prefix = "<leader>q",
      search_prefix = "<leader>s",
      ui_prefix = "<leader>u",
      diagnostics_quickfix_prefix = "<leader>x",
      buffer_prefix = "<leader>b",
      windows_prefix = "",
    },
    buffer_keymaps = "",
    window_hydra_mode = "<c-w><space>",
  },
  gitsigns = {
    gitsigns_next_hunk = "]h",
    gitsigns_prev_hunk = "[h",
    gitsigns_last_hunk = "]H",
    gitsigns_first_hunk = "[H",
    gitsigns_stage_hunk = "<leader>ghs",
    gitsigns_reset_hunk = "<leader>ghr",
    gitsigns_stage_buffer = "<leader>ghS",
    gitsigns_undo_stage_hunk = "<leader>ghu",
    gitsigns_reset_buffer = "<leader>ghR",
    gitsigns_preview_hunk_inline = "<leader>ghp",
    gitsigns_blame_line = "",
    gitsigns_blame_buffer = "",
    gitsigns_diff_index = "<leader>ghd",
    gitsigns_diff_commit = "<leader>ghD",
    gitsigns_select_hunk = "ih",
  },
  trouble = {
    trouble_diagnostics_toggle = "<leader>xx",
    trouble_diagnostics_buffer_toggle = "<leader>xX",
    trouble_symbols_toggle = "<leader>ls",
    trouble_lsp_toggle = "<leader>lS",
    trouble_loclist_toggle = "<leader>xL",
    trouble_qflist_toggle = "<leader>xQ",
    trouble_previous_trouble = "[q",
    trouble_next_trouble = "]q",
  },
  todo_comments = {
    todo_next_todo = "]t",
    todo_prev_todo = "[t",
    todo_trouble = "<leader>xt",
    todo_fix_fixme_trouble = "<leader>xT",
    todo_telescope = "",
    todo_fix_fixme_telescope = "<leader>ft",
  },
}
