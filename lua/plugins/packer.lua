-----------------------------------------------------------
-- Plugin manager configuration file
-----------------------------------------------------------

-- Plugin manager: packer.nvim
-- https://github.com/wbthomason/packer.nvim

local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap =
    fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
end

return require("packer").startup(function(use)
    -- Plugins a continuacion:
    -------------------------------------------------------
    -- Alpha Nvim - Startup Page
    -- Pantalla de Inicio al abrir Nvim
    use({
        "goolord/alpha-nvim",
        requires = {
            "kyazdani42/nvim-web-devicons",
            "ahmedkhalf/project.nvim",
        },
    })

    -- Nvim BufDel
    -- Permite borrar buffer tab
    use({ "ojroques/nvim-bufdel" })

    -- Harpoon
    -- Plugin Utilizado para guardar marks
    -- esto permite volver a puntos que uno quiera radidamente
    use({
        "ThePrimeagen/harpoon",
        requires = {
            "nvim-lua/plenary.nvim",
            "nvim-lua/popup.nvim",
        },
    })

    -- Color theme
    use("EdenEast/nightfox.nvim")


    --------------------------------------------------------

    -- buffer linea
    use({ "akinsho/bufferline.nvim", tag = "v3.*", requires = "kyazdani42/nvim-web-devicons" })
    -- file explorer
    --use 'kyazdani42/nvim-tree.lua'
    use({
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v2.x",
        requires = {
            "nvim-lua/plenary.nvim",
            "kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
        },
    })
    use("sidebar-nvim/sidebar.nvim")

    use("numToStr/Comment.nvim") -- Easily comment stuff
    use("JoosepAlviste/nvim-ts-context-commentstring")

    -- icons
    use("kyazdani42/nvim-web-devicons")

    -- treesitter interface
    use("nvim-treesitter/nvim-treesitter")
    use("nvim-treesitter/nvim-tree-docs")
    use("p00f/nvim-ts-rainbow")
    -- Completition
    use("hrsh7th/nvim-cmp")
    use("hrsh7th/cmp-buffer")
    use("hrsh7th/cmp-path")
    use("hrsh7th/cmp-nvim-lua")
    use("hrsh7th/cmp-nvim-lsp")
    use("saadparwaiz1/cmp_luasnip")
    use("onsails/lspkind-nvim")
    use("hrsh7th/cmp-nvim-lsp-signature-help")
    use("windwp/nvim-autopairs")
    use({
        "ray-x/lsp_signature.nvim",
    })

    use("L3MON4D3/LuaSnip")
    use({
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
        --        'neovim/nvim-lspconfig',
        --       'williamboman/nvim-lsp-installer',
    })

    -- formatter
    use({
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
            require("null-ls").setup()
        end,
        require = { "nvim-lua/plenary.nvim" },
    })

    use({ "mhartington/formatter.nvim" })
    use("MunifTanjim/prettier.nvim")
    use("tjdevries/colorbuddy.nvim")
    -- Terminal
    use({
        "akinsho/toggleterm.nvim",
        tag = "*",
        config = function()
            require("toggleterm").setup()
        end,
    })
    -- LSP
    use({
        "lvimuser/lsp-inlayhints.nvim",
        config = function()
            require("lsp-inlayhints").setup()
        end,
    })

    use("folke/lsp-colors.nvim")
    use("kkoomen/vim-doge")

    use("rafamadriz/friendly-snippets")

    -- statusline
    use("nvim-lualine/lualine.nvim") -- Statusline

    -- fuzzy finder
    use("nvim-lua/popup.nvim")
    use("nvim-lua/plenary.nvim")
    use("nvim-telescope/telescope.nvim")
    use("nvim-telescope/telescope-ui-select.nvim")
    use("nvim-telescope/telescope-symbols.nvim")
    use("nvim-telescope/telescope-media-files.nvim")
    use("nvim-telescope/telescope-file-browser.nvim")
    --use 'ibhagwan/fzf-lua'

    -- git labels
    use({
        "lewis6991/gitsigns.nvim",
        requires = { "nvim-lua/plenary.nvim" },
        config = function()
            require("gitsigns").setup()
        end,
    })
    -- help for git
    use("kdheepak/lazygit.nvim")
    -- diffview
    use({
        "sindrets/diffview.nvim",
        requires = "nvim-lua/plenary.nvim",
    })

    -- autosave
    use("Pocco81/auto-save.nvim")

    -- just
    use("NoahTheDuke/vim-just")
    use("IndianBoy42/tree-sitter-just")
    -- require('tree-sitter-just').setup()
    use("norcalli/nvim-colorizer.lua")
    require("colorizer").setup()

    use("soywod/himalaya.vim")

    -- Put this at the end after all plugins
    use("wbthomason/packer.nvim")

    if packer_bootstrap then
        require("packer").sync()
    end
end)
