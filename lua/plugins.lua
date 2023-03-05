-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- use({
    --     'dense-analysis/neural',
    --     config = function()
    --         require('neural').setup({
    --             open_ai = {
    --                 api_key = os.getenv("OPENAPI_API_KEY")
    --             }
    --         })
    --     end,
    --     requires = {
    --         'MunifTanjim/nui.nvim',
    --         'ElPiloto/significant.nvim'
    --     }
    -- })
end)
