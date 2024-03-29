-- Requring plugin
local installed, LuaLine = pcall(require, "lualine")
if not installed then
    vim.notify("Plugin 'lualine' not installed")
    return
end

local function diff_source()
    local gitsigns = vim.b.gitsigns_status_dict
    if gitsigns then
        return {
            added = gitsigns.added,
            modified = gitsigns.changed,
            removed = gitsigns.removed,
        }
    end
end

local custom_fname = require('lualine.components.filename'):extend()
local highlight = require'lualine.highlight'
local default_status_colors = { saved = '#8aadf4', modified = '#FFB86C' }

function custom_fname:init(options)
  custom_fname.super.init(self, options)
  self.status_colors = {
    saved = highlight.create_component_highlight_group(
      {fg = default_status_colors.saved}, 'filename_status_saved', self.options),
    modified = highlight.create_component_highlight_group(
      {fg = default_status_colors.modified}, 'filename_status_modified', self.options),
  }
  if self.options.color == nil then self.options.color = '' end
end

function custom_fname:update_status()
  local data = custom_fname.super.update_status(self)
  data = highlight.component_format_highlight(vim.bo.modified
                                              and self.status_colors.modified
                                              or self.status_colors.saved) .. data
  return data
end

local get_color = require("lualine.utils.utils").extract_highlight_colors

LuaLine.setup({
    options = {
        icons_enabled = true,
        theme = "catppuccin",
        -- theme = "dracula-nvim",
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        disabled_filetypes = {
            statusline = {},
            winbar = {},
            "alpha",
            "plugins",
            "[No Name]",
            "vim-plug",
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
        },
    },
    sections = {
        lualine_a = { "mode" },
        lualine_b = {
            {
                "b:gitsigns_head",
                icon = " "
            },
            {
                "diff",
                source = diff_source
            },
        },
        lualine_c = {
            {
                custom_fname,
                path = 3,
                file_status = true,
                newfile_status = true,
                shorting_target = 40,
                symbols = {
                    modified = "[SAVE ME]",
                },
            },
            {
                "%=",
                "%t%m",
                "%3p",
            },
        },
        lualine_x = {
            { function()
                    local ok, pomo = pcall(require, "pomo")
                    if not ok then
                        return ""
                    end

                    local timer = pomo.get_first_to_finish()
                    if timer == nil then
                        return ""
                    end

                    return "󰄉 " .. tostring(timer)
                end,
            },
            {
                "searchcount",
                maxcount = 100,
                timeout = 200,
            },
            {
                "diagnostics",
                sources = {
                    'nvim_diagnostic',
                    'nvim_workspace_diagnostic',
                    'nvim_lsp'
                },
                symbols = { error = " ", warn = " ", info = " ", hint = " " },
                colored = true,
                diagnostics_color = {
                    error = { fg = get_color("DiagnosticSignError", "fg") },
                    warn = { fg = get_color("DiagnosticSignWarn", "fg") },
                    info = { fg = get_color("DiagnosticSignInfo", "fg") },
                    hint = { fg = get_color("DiagnosticSignHint", "fg") },
                },
            },
        },
        lualine_y = {
            "filetype",
            "fileformat",
            "encoding",
        },
        lualine_z = {
            -- "progress",
            "location",
        },
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {
            {
                "filename",
                file_status = true,
                path = 3,
            },
        },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
    },
    tabline = {
        lualine_a = { "buffers" },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = { "tabs" },
        lualine_z = { "datetime" },
    },
    statusline = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {
            "lsp_progress",
            display_components = { "lsp_client_name", "spinner", { "title", "percentage", "message" } },
            spinner_symbols = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" },
        },
    },
    winbar = {
        lualine_a = { "branch" },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {
            {
                "filename",
                file_status = true,
                path = 1,
            },
        },
    },

    inactive_winbar = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {
            {
                "filename",
                file_status = true,
                path = 4,
                shorting_target = 40,
            },
        },
    },
    extensions = {
        "nvim-tree",
        "fzf",
        "quickfix",
        "toggleterm",
        "trouble",
        "lazy",
    },
})
