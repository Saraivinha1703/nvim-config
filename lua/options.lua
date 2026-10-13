vim.g.mapleader = " "

-- tab / identing
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = -1

-- yank to clipboard
vim.opt.clipboard = "unnamedplus"

-- relative numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- replace tilde
vim.opt.fillchars:append({
    eob = " ",
    fold = ".",
    foldopen = "",
    foldclose = "",
    foldsep = "│"
})

-- roundend windows
vim.opt.winborder = "rounded"

local function setup_float_highlights()
    -- Grab the background color of the default 'Normal' highlight group
    local normal = vim.api.nvim_get_hl(0, { name = "Normal" })

    -- Extract the background hex value, or fallback to a default dark color if none exists
    local bg_color = normal.bg and string.format("#%06x", normal.bg) or "#1f2335"

    -- Apply it to your floating windows and borders
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = bg_color })
    vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#565f89", bg = bg_color })

    -- Blink.cmp specific float and menu highlights (fixes completion menu squaring)
    vim.api.nvim_set_hl(0, "BlinkCmpMenu", { bg = bg_color })
    vim.api.nvim_set_hl(0, "BlinkCmpMenuBorder", { fg = "#565f89", bg = bg_color })
    vim.api.nvim_set_hl(0, "BlinkCmpDoc", { bg = bg_color })
    vim.api.nvim_set_hl(0, "BlinkCmpDocBorder", { fg = "#565f89", bg = bg_color })
end

-- Run it initially
setup_float_highlights()

-- Change themes dynamically or via a command
vim.api.nvim_create_autocmd("ColorScheme", {
    callback = setup_float_highlights
})

-- code folding
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldenable = true
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.foldcolumn = "auto"

-- status column
_G.custom_fold_column = function()
    local line = vim.v.lnum
    local foldlevel = vim.fn.foldlevel(line)
    local foldlevel_prev = vim.fn.foldlevel(line - 1)

    local fold_icon = " "
    if foldlevel > 0 then
        if vim.fn.foldclosed(line) ~= -1 then
            fold_icon = vim.opt.fillchars:get().foldclose or ""
        elseif foldlevel > foldlevel_prev then
            fold_icon = vim.opt.fillchars:get().foldopen or ""
        else
            fold_icon = vim.opt.fillchars:get().foldsep or "│"
        end
    end

    -- Return the fold icon combined with the sign column and line number items
    return fold_icon .. " %s%l "
end

vim.opt.statuscolumn = "%!v:lua.custom_fold_column()"

-- diagnostics
vim.diagnostic.config({
    update_in_insert = true,
    virtual_text = {
        prefix = "●",
        spacing = 2,
    },
    underline = true,
    severity_sort = true,
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = "󰅚",
            [vim.diagnostic.severity.WARN] = "󰀪",
            [vim.diagnostic.severity.INFO] = "󰋽",
            [vim.diagnostic.severity.HINT] = "󰌶",
        }
    },
})
