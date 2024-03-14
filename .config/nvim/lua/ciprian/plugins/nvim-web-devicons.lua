-- Configuration table for the nvim-web-devicons plugin.
-- This table customizes icons in the Neovim file explorer (nvim-tree) and other UI components.
return {
  -- Specifies the plugin repository on GitHub.
  "nvim-tree/nvim-web-devicons",

  -- The 'config' function is executed to customize the plugin's behaviour after it is loaded.
  config = function()
    -- Sets a custom icon for GraphQL files using the 'set_icon' method.
    -- This method updates the plugin's icon set with custom settings for specified file types.
    require("nvim-web-devicons").set_icon({
      gql = {  -- 'gql' key represents GraphQL files.
        icon = "",  -- The icon to display, in this case, a specific icon chosen for GraphQL.
        color = "#e535ab",  -- Hex color for the icon when displayed in a GUI (Graphical User Interface).
        cterm_color = "199",  -- Color code for the icon in a CTerm (color terminal) environment.
        name = "GraphQL",  -- A descriptive name for the file type, used for reference.
      },
    })
  end,
}
