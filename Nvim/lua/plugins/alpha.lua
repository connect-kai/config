return {
  "goolord/alpha-nvim",
  cmd = "Alpha",
  specs = {
    {
      "AstroNvim/astrocore",
      opts = function(_, opts)
        local maps = opts.mappings
        maps.n["<Leader>h"] = {
          function()
            local is_valid_win = function(win)
              local bufnr = vim.api.nvim_win_get_buf(win)
              return require("astrocore.buffer").is_valid(bufnr) or vim.bo[bufnr].filetype == "alpha"
            end
            local cur_win = vim.api.nvim_get_current_win()
            -- try to find the most suitable window for Alpha
            if not is_valid_win(cur_win) then
              for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
                if win ~= cur_win and is_valid_win(win) then
                  vim.fn.win_gotoid(win)
                  break
                end
              end
            end
            require("alpha").start(false)
          end,
          desc = "Home Screen",
        }
        opts.autocmds.alpha_settings = {
          {
            event = { "User", "BufWinEnter" },
            desc = "Disable status, tablines, and cmdheight for alpha",
            callback = function(event)
              if
                (
                  (event.event == "User" and event.file == "AlphaReady")
                  or (event.event == "BufWinEnter" and vim.bo[event.buf].filetype == "alpha")
                ) and not vim.g.before_alpha
              then
                vim.g.before_alpha = {
                  showtabline = vim.opt.showtabline:get(),
                  laststatus = vim.opt.laststatus:get(),
                  cmdheight = vim.opt.cmdheight:get(),
                }
                vim.opt.showtabline, vim.opt.laststatus, vim.opt.cmdheight = 0, 0, 0
              elseif vim.g.before_alpha and event.event == "BufWinEnter" and vim.bo[event.buf].buftype ~= "nofile" then
                vim.opt.laststatus, vim.opt.showtabline, vim.opt.cmdheight =
                  vim.g.before_alpha.laststatus, vim.g.before_alpha.showtabline, vim.g.before_alpha.cmdheight
                vim.g.before_alpha = nil
              end
            end,
          },
        }
        opts.autocmds.alpha_autostart = {
          {
            event = "VimEnter",
            desc = "Start Alpha when vim is opened with no arguments",
            callback = function()
              local should_skip
              local lines = vim.api.nvim_buf_get_lines(0, 0, 2, false)
              if
                vim.fn.argc() > 0 -- don't start when opening a file
                or #lines > 1 -- don't open if current buffer has more than 1 line
                or (#lines == 1 and lines[1]:len() > 0) -- don't open the current buffer if it has anything on the first line
                or #vim.tbl_filter(function(bufnr) return vim.bo[bufnr].buflisted end, vim.api.nvim_list_bufs()) > 1 -- don't open if any listed buffers
                or not vim.o.modifiable -- don't open if not modifiable
              then
                should_skip = true
              else
                for _, arg in pairs(vim.v.argv) do
                  if arg == "-b" or arg == "-c" or vim.startswith(arg, "+") or arg == "-S" then
                    should_skip = true
                    break
                  end
                end
              end
              if should_skip then return end
              require("lazy").load { plugins = { "alpha-nvim" } }
              require("alpha").start(true)
              vim.schedule(function() vim.cmd.doautocmd "FileType" end)
            end,
          },
        }
      end,
    },
  },
  opts = function()
    local dashboard = require "alpha.themes.dashboard"

    dashboard.leader = "LDR"

    --- @param shortcut string Shortcut string of a button mapping
    --- @param desc string Real text description of the mapping
    --- @param rhs string? Righthand side of mapping if defining a new mapping (_optional_)
    --- @param map_opts table? `keymap.set` options used during keymap creating (_optional_)
    dashboard.button = function(shortcut, desc, rhs, map_opts)
      -- HACK: fixes leader customization, remove after fixed upstream
      -- https://github.com/goolord/alpha-nvim/pull/271
      local lhs = shortcut:gsub("%s", ""):gsub(dashboard.leader, "<Leader>")
      local default_map_opts = { noremap = true, silent = true, nowait = true, desc = desc }

      local leader = vim.g.mapleader
      if leader == " " then leader = "SPC" end

      return {
        type = "button",
        val = desc,
        on_press = function()
          vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(rhs or lhs .. "<Ignore>", true, false, true), "t", false)
        end,
        opts = {
          position = "center",
          shortcut = shortcut:gsub(dashboard.leader, leader),
          cursor = -2,
          width = 70,
          align_shortcut = "right",
          hl = "DashboardCenter",
          hl_shortcut = "DashboardShortcut",
          keymap = rhs and { "n", lhs, rhs, require("astrocore").extend_tbl(default_map_opts, map_opts) },
        },
      }
    end

    dashboard.section.header.val = {
      [[                                                                            ]],
      [[ ██╗  ██╗ █████╗ ██╗                                                        ]],
      [[ ██║ ██╔╝██╔══██╗██║                                                        ]],
      [[ █████╔╝ ███████║██║                                                        ]],
      [[ ██╔═██╗ ██╔══██║██║                                                        ]],
      [[ ██║  ██╗██║  ██║██║                                                        ]],
      [[ ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝                                                        ]],
      [[                                                                            ]],
      [[ ██╗    ██╗ ██████╗ ██████╗ ██╗  ██╗███████╗██████╗  █████╗  ██████╗███████╗]],
      [[ ██║    ██║██╔═══██╗██╔══██╗██║ ██╔╝██╔════╝██╔══██╗██╔══██╗██╔════╝██╔════╝]],
      [[ ██║ █╗ ██║██║   ██║██████╔╝█████╔╝ ███████╗██████╔╝███████║██║     █████╗  ]],
      [[ ██║███╗██║██║   ██║██╔══██╗██╔═██╗ ╚════██║██╔═══╝ ██╔══██║██║     ██╔══╝  ]],
      [[ ╚███╔███╔╝╚██████╔╝██║  ██║██║  ██╗███████║██║     ██║  ██║╚██████╗███████╗]],
      [[  ╚══╝╚══╝  ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝╚═╝     ╚═╝  ╚═╝ ╚═════╝╚══════╝]],
      [[                                                                            ]],
    }

    dashboard.section.header.opts.hl = "dashboardheader"
    dashboard.section.footer.opts.hl = "DashboardFooter"

    dashboard.section.buttons.val = {
      dashboard.button("p", "🦭  Projects  ", ":Telescope projects<CR>"),
      dashboard.button("LDR f f", "🔍  Find File  "),
      dashboard.button("LDR f o", "🌎  Recents  "),
      dashboard.button("LDR f '", "📙  Bookmarks  "),
      dashboard.button("LDR S l", "🧤  Last Session  "),
      dashboard.button("S", "🚕  Settings  ", "<cmd>e ~/.config/nvim/<CR>"),
    }

    dashboard.config.layout = {
      { type = "padding", val = vim.fn.max { 2, vim.fn.floor(vim.fn.winheight(0) * 0.2) } },
      dashboard.section.header,
      { type = "padding", val = 5 },
      dashboard.section.buttons,
      { type = "padding", val = 3 },
      dashboard.section.footer,
    }
    dashboard.config.opts.noautocmd = true
    return dashboard
  end,
  config = function(...) require "astronvim.plugins.configs.alpha"(...) end,
}
