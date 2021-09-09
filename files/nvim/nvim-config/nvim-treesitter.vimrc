lua <<EOF
    require'nvim-treesitter.configs'.setup {
      highlight = {
        enable = true,
        disable = {},
      },
      ensure_installed = {
        "norg",
        "haskell",
        "c",
        "cpp",
        "json",
        "yaml",
        "rust"
      },
    }

    local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
    parser_config.norg = {
        install_info = {
            url = "https://github.com/nvim-neorg/tree-sitter-norg",
            files = { "src/parser.c", "src/scanner.cc" },
            branch = "main"
        },
    }
EOF
