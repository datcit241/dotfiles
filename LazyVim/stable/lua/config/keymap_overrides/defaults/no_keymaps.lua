local default_keymaps = {
  keymaps = {
    window = {
      window_left = "",
      window_lower = "",
      window_upper = "",
      window_right = "",
    },
    resize_window = {
      size_increase_height = "",
      size_decrease_height = "",
      size_decrease_width = "",
      size_increase_width = "",
    },
    move_lines = {
      move_down = "",
      move_up = "",
    },
    buffers = {
      buf_prev = "",
      buf_next = "",
      buf_prev_alt = "",
      buf_next_alt = "",
      buf_switch_to_other = "",
      buf_switch_to_other_alt = "",
      buf_delete = "",
      buf_delete_and_close = "",
    },
    clear_search_diff_update_and_redraw = "",
    save_file = "",
    keywordprg = "",
    commenting = {
      comment_add_below = "",
      comment_add_above = "",
    },
    lazy = "",
    new_file = "",
    location_list = "",
    quickfix_list = "",
    previous_quickfix = "",
    next_quickfix = "",
    format = "",
    diagnostics = {
      diagnostic_line_diagnostics = "",
      diagnostic_next_diagnostic = "",
      diagnostic_prev_diagnostic = "",
      diagnostic_next_error = "",
      diagnostic_prev_error = "",
      diagnostic_next_warning = "",
      diagnostic_prev_warning = "",
    },
    toggle_options = {
      toggle_auto_format_buffer = "",
      toggle_auto_format_global = "",
      toggle_spelling = "",
      toggle_wrap = "",
      toggle_relativenumber = "",
      toggle_diagnostics = "",
      toggle_number = "",
      toggle_conceallevel = "",
      toggle_treesitter = "",
      toggle_background = "",
      toggle_inlay_hints = "",
    },
    lazygit = {
      lazygit_toggle_root = "",
      lazygit_toggle_cwd = "",
      lazygit_blame_line = "",
      lazygit_browse = "",
      lazygit_current_file_history = "",
      lazygit_git_log_root = "",
      lazygit_git_log_cwd = "",
    },
    quit_all = "",
    inspect_pos = "",
    inspect_tree = "",
    lazyvim_changelog = "",
    terminal = {
      floating_terminal = {
        terminal_toggle_root = "",
        terminal_toggle_cwd = "",
        terminal_toggle_root_alt_1 = "",
        terminal_toggle_root_alt_2 = "",
      },
      terminal_enter_normal_mode = "",
      terminal_hide_terminal = "",
      terminal_hide_terminal_alt = "",
    },
    windows = {
      window_prefix = "",
      window_split_window_below = "",
      window_split_window_right = "",
      window_delete_window = "",
      window_toggle_maximize_window = "",
    },
    tabs = {
      tab_last_tab = "",
      tab_close_other_tabs = "",
      tab_first_tab = "",
      tab_new_tab = "",
      tab_next_tab = "",
      tab_close_tab = "",
      tab_previous_tab = "",
    },
  },
  quit_buffer = "",
  coding = {
    cmp = {
      cmp_scroll_docs_backward = "",
      cmp_scroll_docs_forward = "",
      cmp_select_next_item = "",
      cmp_select_prev_item = "",
      cmp_complete = "",
      cmp_confirm_auto_select = "",
      cmp_confirm_select = "",
      cmp_confirm_replace = "",
      cmp_abort = "",
      snippet = {
        snippet_jump_prev = "",
        snippet_jump_next = "",
      },
    },
  },
  editor = {
    neo_tree = {
      neotree_toggle_root = "",
      neotree_toggle_cwd = "",
      neotree_toggle_root_alt = "",
      neotree_toggle_cwd_alt = "",
      neotree_toggle_git_status = "",
      neotree_toggle_buffers = "",
      window = {
        neotree_win_open = "",
        neotree_win_close_node = "",
        neotree_win_copy_path_to_clipboard = "",
        neotree_win_open_with_system_application = "",
        neotree_win_toggle_preview = "",
      },
    },
    grug_far = {
      grugfar_open = "",
    },
    flash = {
      flash_jump = "",
      flash_treesitter = "",
      flash_remote = "",
      flash_treesitter_search = "",
      flash_toggle = "",
    },
    which_key = {
      group = {
        tabs_prefix = "",
        code_prefix = "",
        file_find_prefix = "",
        git_prefix = "",
        hunks_prefix = "",
        quit_session_prefix = "",
        search_prefix = "",
        ui_prefix = "",
        diagnostics_quickfix_prefix = "",
        buffer_prefix = "",
        windows_prefix = "",
      },
      buffer_keymaps = "",
      window_hydra_mode = "",
    },
    gitsigns = {
      gitsigns_next_hunk = "",
      gitsigns_prev_hunk = "",
      gitsigns_last_hunk = "",
      gitsigns_first_hunk = "",
      gitsigns_stage_hunk = "",
      gitsigns_reset_hunk = "",
      gitsigns_stage_buffer = "",
      gitsigns_undo_stage_hunk = "",
      gitsigns_reset_buffer = "",
      gitsigns_preview_hunk_inline = "",
      gitsigns_blame_line = "",
      gitsigns_blame_buffer = "",
      gitsigns_diff_index = "",
      gitsigns_diff_commit = "",
      gitsigns_select_hunk = "",
    },
    trouble = {
      trouble_diagnostics_toggle = "",
      trouble_diagnostics_buffer_toggle = "",
      trouble_symbols_toggle = "",
      trouble_lsp_toggle = "",
      trouble_loclist_toggle = "",
      trouble_qflist_toggle = "",
      trouble_previous_trouble = "",
      trouble_next_trouble = "",
    },
    todo_comments = {
      todo_next_todo = "",
      todo_prev_todo = "",
      todo_trouble = "",
      todo_fix_fixme_trouble = "",
      todo_telescope = "",
      todo_fix_fixme_telescope = "",
    },
  },
  formatting = {
    conform = {
      conform_format = "",
    },
  },
  treesitter = {
    ts_increment_selection = "",
    ts_decrement_selection = "",
    textobjects = {
      goto_next_start = {
        ts_ns_function_outer = "",
        ts_ns_class_outer = "",
        ts_ns_parameter_inner = "",
      },
      goto_next_end = {
        ts_ne_function_outer = "",
        ts_ne_class_outer = "",
        ts_ne_parameter_inner = "",
      },
      goto_previous_start = {
        ts_ps_function_outer = "",
        ts_ps_class_outer = "",
        ts_ps_parameter_inner = "",
      },
      goto_previous_end = {
        ts_pe_function_outer = "",
        ts_pe_class_outer = "",
        ts_pe_parameter_inner = "",
      },
    },
  },
  ui = {
    nvim_notify = {
      nvimnotify_dismiss_all_notifications = "",
    },
    bufferline = {
      bufferline_toggle_pin = "",
      bufferline_delete_non_pinned_buffers = "",
      bufferline_delete_other_buffers = "",
      bufferline_delete_buffers_to_the_right = "",
      bufferline_delete_buffers_to_the_left = "",
      bufferline_prev_buffer = "",
      bufferline_next_buffer = "",
      bufferline_prev_buffer_alt = "",
      bufferline_next_buffer_alt = "",
      bufferline_move_buffer_prev = "",
      bufferline_move_buffer_next = "",
    },
    indent_blankline = {
      indentblankline_toggle = "",
    },
    noice = {
      noice_prefix = "",
      noice_redirect_cmdline = "",
      noice_last_message = "",
      noice_history = "",
      noice_all = "",
      noice_dismiss = "",
      noice_pick = "",
      noice_scroll_forward = "",
      noice_scroll_backward = "",
    },
    dashboard = {
      dashboard_find_file = "",
      dashboard_new_file = "",
      dashboard_recent_files = "",
      dashboard_find_text = "",
      dashboard_config = "",
      dashboard_restore_session = "",
      dashboard_lazy_extras = "",
      dashboard_lazy = "",
      dashboard_quit = "",
      dashboard_projects = "",
    },
  },
  util = {
    persistence = {
      persistence_restore_session = "",
      persistence_select_session = "",
      persistence_restore_last_session = "",
      persistence_skip_current_session = "",
    },
    mini_pairs = {
      minipairs_toggle = "",
    },
  },
  extras = {
    coding = {
      copilot_chat = {
        copilotchat_submit_prompt = "",
        copilotchat_prefix = "",
        copilotchat_toggle = "",
        copilotchat_clear = "",
        copilotchat_quick_chat = "",
        copilotchat_diagnostic_help = "",
        copilotchat_prompt_actionsr = "",
      },
      mini_surround = {
        minisurround_prefix = "",
        minisurround_add = "",
        minisurround_delete = "",
        minisurround_find = "",
        minisurround_find_left = "",
        minisurround_highlight = "",
        minisurround_replace = "",
        minisurround_update_n_lines = "",
      },
      yanky = {
        yanky_yank_history = "",
        yanky_yank = "",
        yanky_put_text_after_cursor = "",
        yanky_put_text_before_cursor = "",
        yanky_put_text_after_selection = "",
        yanky_put_text_before_selection = "",
        yanky_cycle_forward_yank_history = "",
        yanky_cycle_backward_yank_history = "",
        yanky_put_indent_after_cursor_linewise = "",
        yanky_put_indent_before_cursor_linewise = "",
        yanky_put_indent_after_cursor_linewise_alt = "",
        yanky_put_indent_before_cursor_linewise_alt = "",
        yanky_put_and_indent_right = "",
        yanky_put_and_indent_left = "",
        yanky_put_before_indent_right = "",
        yanky_put_before_indent_left = "",
        yanky_put_after_filter = "",
        yanky_put_before_filter = "",
      },
    },
    dap = {
      core = {
        nvim_dap = {
          dap_prefix = "",
          dap_breakpoint_condition = "",
          dap_toggle_breakpoint = "",
          dap_continue = "",
          dap_run_with_args = "",
          dap_run_to_cursor = "",
          dap_go_to_line_no_execute = "",
          dap_step_into = "",
          dap_down = "",
          dap_up = "",
          dap_run_last = "",
          dap_step_out = "",
          dap_step_over = "",
          dap_pause = "",
          dap_toggle_repl = "",
          dap_session = "",
          dap_terminate = "",
          dap_widgets = "",
        },
        nvim_dap_ui = {
          dap_toggle_dap_ui = "",
          dap_eval_dap_ui = "",
        },
      },
    },
    editor = {
      aerial = {
        aerial_toggle = "",
      },
      dial = {
        dial_increment = "",
        dial_decrement = "",
        dial_increment_g = "",
        dial_decrement_g = "",
      },
      harpoon2 = {
        harpoon_file = "",
        harpoon_quick_menu = "",
        harpoon_to_file_prefix = "",
      },
      vim_illuminate = {
        illuminate_next = "",
        illuminate_prev = "",
      },
      inc_rename = {
        increname_rename = "",
      },
      leap = {
        leap_next = "",
        leap_prev = "",
        leap_from_windows = "",
      },
      mini_diff = {
        minidiff_toggle_overlay = "",
      },
      mini_files = {
        minifiles_open_current_file_dir = "",
        minifiles_open_cwd = "",
      },
      outline = {
        outline_up_and_jump = "",
        outline_down_and_jump = "",
      },
      overseer = {
        overseer_prefix = "",
        overseer_toggle = "",
        overseer_quick_action = "",
        overseer_run = "",
        overseer_info = "",
        overseer_build = "",
        overseer_task_action = "",
        overseer_clear_cache = "",
      },
      refactoring = {
        refactoring_prefix = "",
        refactoring_refactor = "",
        refactoring_inline_variable = "",
        refactoring_extract_block = "",
        refactoring_extract_block_to_file = "",
        refactoring_debug_print = "",
        refactoring_debug_print_variable = "",
        refactoring_debug_cleanup = "",
        refactoring_extract_function = "",
        refactoring_extract_function_to_file = "",
        refactoring_extract_variable = "",
      },
      picker = {
        picker_switch_buffer = "",
        picker_grep_root = "",
        picker_command_history = "",
        picker_find_files_root = "",
        picker_find_buffers = "",
        picker_find_config_file = "",
        picker_find_files_root_alt = "",
        picker_find_files_cwd = "",
        picker_find_git_files = "",
        picker_find_recent_files = "",
        picker_find_recent_files_cwd = "",
        picker_find_projects = "",
        picker_git_commits = "",
        picker_git_status = "",
        picker_search_registers = "",
        picker_search_autocommands = "",
        picker_search_buffer = "",
        picker_search_command_history = "",
        picker_search_commands = "",
        picker_search_document_diagnostics = "",
        picker_search_workspace_diagnostics = "",
        picker_search_grep_root = "",
        picker_search_grep_cwd = "",
        picker_search_help_pages = "",
        picker_search_highlight_groups = "",
        picker_search_jumplist = "",
        picker_search_keymaps = "",
        picker_search_loclist = "",
        picker_search_man_pages = "",
        picker_search_marks = "",
        picker_search_options = "",
        picker_search_resume = "",
        picker_search_quickfix = "",
        picker_search_word_root = "",
        picker_search_word_cwd = "",
        picker_search_selection_root = "",
        picker_search_selection_cwd = "",
        picker_colorscheme_preview = "",
        picker_go_to_symbol = "",
        picker_go_to_symbol_workspace = "",
        actions = {
          picker_open_with_trouble = "",
          picker_open_with_trouble_alt = "",
          picker_find_files_no_ignore = "",
          picker_find_files_with_hidden = "",
          picker_cycle_history_next = "",
          picker_cycle_history_prev = "",
          picker_preview_scrolling_down = "",
          picker_preview_scrolling_up = "",
          picker_close = "",
        },
        flash = {
          flash_normal = "",
          flash_insert = "",
        },
      },
    },
    test = {
      core = {
        test_prefix = "",
        test_run_file = "",
        test_run_all_test_files = "",
        test_run_nearest = "",
        test_run_last = "",
        test_toggle_summary = "",
        test_show_output = "",
        test_toggle_output_panel = "",
        test_stop = "",
        test_toggle_watch = "",
        test_debug_nearest = "",
      },
    },
    lang = {
      lang_lsp_info = "",
      lang_mason = "",
      lang_go_to_definition = "",
      lang_go_to_declaration = "",
      lang_references = "",
      lang_file_references = "",
      lang_go_to_implementation = "",
      lang_go_to_type_definition = "",
      lang_go_to_super = "",
      lang_go_to_subjects = "",
      lang_hover = "",
      lang_signature_help = "",
      lang_insert_signature_help = "",
      lang_code_action = "",
      lang_run_codelens = "",
      lang_refresh_codelens = "",
      lang_rename_file = "",
      lang_rename = "",
      lang_source_action = "",
      lang_next_reference = "",
      lang_prev_reference = "",
      lang_cycle_next_reference = "",
      lang_cycle_prev_reference = "",
      lang_organize_imports = "",
      lang_add_missing_imports = "",
      lang_remove_unused_imports = "",
      lang_fix_all_diagnostics = "",
      lang_select_lang_version = "",
      extract = {
        lang_extract_prefix = "",
        lang_extract_method = "",
        lang_extract_variable = "",
        lang_extract_constant = "",
      },
      ansible = {
        ansible_run_playbook_role = "",
      },
      clangd = {
        clangd_switch_source_header = "",
      },
      clojure = {
        clojure_jump_prev_evaluation_output = "",
        clojure_jump_next_evaluation_output = "",
      },
      elixir = {
        elixir_to_pipe = "",
        elixir_from_pipe = "",
      },
      lean = {
        lean_abbreviations_leader = "",
      },
      markdown = {
        markdown_preview_toggle = "",
        markdown_render_markdown_toggle = "",
      },
      python = {
        python_debug_method = "",
        python_debug_class = "",
        python_select_virtual_env = "",
      },
      r = {
        r_send = "",
        r_send_all = "",
        r_send_between_marks = "",
        r_send_chunks = "",
        r_send_functions = "",
        r_send_goto = "",
        r_send_install = "",
        r_send_knit = "",
        r_send_paragraph = "",
        r_send_quarto = "",
        r_send_general = "",
        r_send_split_or_send = "",
        r_send_terminal = "",
        r_send_view = "",
      },
      rust = {
        rust_code_action = "",
        rust_debuggables = "",
        rust_show_crate_documentation = "",
      },
      scala = {
        scala_metals_commands = "",
        scala_metals_compile_cascade = "",
      },
      sql = {
        sql_toggle_dbui = "",
      },
      tex = {
        tex_prefix = "",
        tex_vimtex_docs = "",
      },
      typescript = {
        typescript_go_to_source_definition = "",
      },
    },
    ui = {
      edgy = {
        edgy_toggle = "",
        edgy_select_window = "",
      },
      mini_animate = {
        minianimae_toggle = "",
      },
      treesitter_context = {
        tscontext_toggle = "",
      },
    },
    util = {
      chezmoi = {
        chezmoi_pick_chezmoi = "",
        chezmoi_select = "",
        chezmoi_key = "",
      },
      octo = {
        octo_issue_list = "",
        octo_issue_search = "",
        octo_pr_list = "",
        octo_pr_search = "",
        octo_repo_list = "",
        octo_search = "",
        octo_assignee = "",
        octo_comment_code = "",
        octo_label = "",
        octo_issue = "",
        octo_react = "",
        octo_pr = "",
        octo_review = "",
        octo_insert_at = "",
        octo_insert_hashtag = "",
      },
      rest = {
        kulala = {
          kulala_prefix = "",
          kulala_send_request = "",
          kulala_toggle_view = "",
          kulala_jump_to_previous_request = "",
          kulala_jump_to_next_request = "",
        },
      },
    },
    vscode = {
      vscode_find = "",
      vscode_find_in_files = "",
      vscode_go_to_symbol = "",
    },
  },
}

return {}
