vim.o.background = 'dark'

local function lighten(color, amount)
    local r, g, b = tonumber(color:sub(2, 3), 16), tonumber(color:sub(4, 5), 16), tonumber(color:sub(6, 7), 16)
    r, g, b = math.min(255, r + amount), math.min(255, g + amount), math.min(255, b + amount)
    return string.format("#%02x%02x%02x", r, g, b)
end

vim.o.background = 'dark'

require('solarized').setup({
    transparent = true,
    styles = {
        comments = { italic = true },
        functions = { italic = false, bold = false },
        variables = { italic = false, bold = false },
        numbers = { italic = false, bold = false },
        constants = { italic = false, bold = false },
        parameters = { italic = true, bold = false },
        keywords = { italic = false, bold = true },
        types = { italic = false, bold = false },
        strings = { italic = true, bold = false },
    },
    enables = {
        cmp = true,
        lsp = true,
        telescope = true,
        treesitter = true,
    },
    highlights = function(colors)
        return {
            Normal = { fg = colors.fg, bg = colors.bg },
            CursorLine = { bg = lighten(colors.base03, 20) }, 
        }
    end,
    colors = {},
    theme = 'neo',
})

vim.cmd([[colorscheme solarized]])
