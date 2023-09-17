-- Include the Treesitter context setup directly within the plugin specification
return {
   -- Your other plugins and configurations...
 
   -- Add and configure nvim-treesitter-context
   {
     "nvim-treesitter/nvim-treesitter-context",
     config = function()
       require'treesitter-context'.setup{
         enable = true,
         max_lines = 0,
         min_window_height = 0,
         line_numbers = true,
         multiline_threshold = 20,
         trim_scope = 'outer',
         mode = 'cursor',
         separator = nil,
         zindex = 20,
         on_attach = nil,
       }
     end,
   },
 
   -- Your other plugins and configurations...
 }
 