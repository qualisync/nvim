return {
   -- buffer remove
   {
      "echasnovski/mini.bufremove",
    -- stylua: ignore
    keys = function ()
    return {
      { "<D-w>", function() require("mini.bufremove").delete(0, false) end, desc = "Delete Buffer" },
      { "<leader>bW", function() require("mini.bufremove").delete(0, true) end, desc = "Delete Buffer (Force)" },
   }
        end
,
   },
}
