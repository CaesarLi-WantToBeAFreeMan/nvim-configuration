return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  cmd = "Neotree",
  keys = {
    { "<F1>", "<cmd>Neotree toggle<cr>", desc = "toggle Neo-tree" },
  },
  opts = {
    close_if_last_window = true,
    enable_git_status = true,
    enable_diagnostics = false,
    sort_case_insensitive = true,

    -- === default component config ===
    default_component_configs = {
      container = {
        enabled_character_fade = true,
      },
      indent = {
        indent_size = 2,
        padding = 1,
        with_markers = false,
        indnet_marker = "|",
        last_indent_marker = "└",
        highlight = "NeoTreeIndentMarker",
        with_expanders = true,
        expander_collapsed = "→",
        expander_expanded = "↓",
        exapnder_highlight = "NeoTreeExpander",
      },
      icon = {
        folder_closed = "🗀",
        folder_open = "🗁",
        folder_empty = "🖿",
        default = "📁",
        highliaght = "NeoTreeFileIcon",
      },
      modified = {
        symbol = "📝",
        highlight = "NeoTreeModified",
      },
      name = {
        trailing_slash = true,
        use_git_status_colors = true,
        highlight = "NeoTreeFileName",
      },
      git_status = {
        symbols = {
          added = "📝",
          modified = "🏷",
          deleted = "❌",
          renamed = "🔄",
          untracked = "🗑",
          ignored = "⛔️",
          unstaged = "🖊",
          staged = "✔",
          conflict = "⚔",
        },
      },
    },

    -- === window config ===
    window = {
      position = "left",
      width = 40,
      mapping_options = {
        noremap = true,
        nowait = true,
      },
      mappings = {
        --disable dislike built-in mappings
        ["#"] = "none",
        ["<BS>"] = "none",
        ["."] = "none",
        ["<2-LeftMouse>"] = "none",
        ["z"] = "none",
        ["P"] = "none",
        ["l"] = "none",
        ["<C-x>"] = "none",
        ["S"] = "none",
        ["w"] = "none",
        ["[g"] = "none",
        ["]g"] = "none",
        ["a"] = "none",
        ["A"] = "none",
        ["d"] = "none",
        ["r"] = "none",
        ["b"] = "none",
        ["<Space>"] = "none",
        ["D"] = "none",
        ["e"] = "none",
        ["f"] = "none",

        -- === my custom maoppings
        -- navigation
        ["u"] = "navigate_up",
        ["C"] = "set_root",
        ["gk"] = "prev_git_modified",
        ["gj"] = "next_git_modified",

        --opening && preview
        ["<CR>"] = function(state)
          if state.tree:get_node().type == "directory" then
            require("neo-tree.sources.filesystem.commands").toggle_node(state)
          else
            require("neo-tree.sources.filesystem.commands").open_vsplit(state)
          end
        end,
        ["o"] = function(state)
          if state.tree:get_node().type == "directory" then
            require("neo-tree.sources.filesystem.commands").toggle_node(state)
          else
            require("neo-tree.sources.filesystem.commands").open(state)
          end
        end,
        ["i"] = "open_split",
        ["s"] = "open_vsplit",
        ["t"] = "open_tabnew",
        ["T"] = "open_tab_drop",
        ["go"] = "toggle_preview",
        ["gl"] = "focus_preview",

        --node expansion || collapse
        ["x"] = "close_node",
        ["X"] = "close_all_nodes",
        ["oc"] = "expand_all_nodes",
        ["oC"] = "expand_all_subnodes",

        --file || directory management
        ["fa"] = "add",
        ["fA"] = "add_directory",
        ["fd"] = "delete",
        ["ff"] = "show_file_details",
        ["n"] = "rename",
        ["N"] = "rename_basename",

        --clipboard actions
        ["y"] = "copy_to_clipboard",
        ["p"] = "paste_from_clipboard",
        ["c"] = "cut_to_clipboard",
        ["m"] = "move",
      },
    },

    -- === filesystem ===
    filesystem = {
      filtered_items = {
        visible = false,
        hide_dotfiles = false,
        hide_gitignored = true,
        hide_hidden = false,
        hide_by_name = {
          "node_modules",
          "target",
          "build",
          "dist",
          "out",
          ".gradle",
          ".m2",
          ".pytest_cache",
          "__pycache__",
          ".git",
          ".DS_Store",
          "thumbs.db",
        },
        hide_by_pattern = {
          "*.tmp",
          "*.log",
        },
        always_show = {
          ".gitignore",
        },
        never_show = {
          ".DS_Store",
          "thumbs.db",
        },
        never_show_by_pattern = {
          ".null-ls_*",
        },
      },
      follow_current_file = {
        enabled = true,
        level_dirs_open = false,
      },
      group_empty_dirs = false,
      hijack_netrw_behavior = "open_default",
      use_libuv_file_watcher = true,
    },

    -- === buffers ===
    buffers = {
      follow_current_file = {
        enabled = true,
        level_dirs_open = false,
      },
      group_empty_dirs = true,
      show_uploaded = true,
    },

    -- === git status ===
    git_status = {
      window = {
        position = "float",
        mappings = {
          ["A"] = "git_add_all",
          ["gu"] = "git_unstage_file",
          ["ga"] = "git_add_file",
          ["gc"] = "git_commit",
          ["gp"] = "git_push",
          ["gP"] = "git_pull",
          ["gg"] = "git_commit_and_push",
        },
      },
    },

    -- === event handlers ===
    event_handlers = {
      {
        event = "file_opened",
        handler = function(filePath)
          require("neo-tree.command").execute({ action = "close" })
        end,
      },
      {
        event = "neo_tree_buffer_enter",
        handler = function()
          vim.cmd([[setlocal relativenumber]])
        end,
      },
    },
  },
}
