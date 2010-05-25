--[[ Copyright (c) 2010 Manuel "Roujin" Wolf

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
of the Software, and to permit persons to whom the Software is furnished to do
so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE. --]]

dofile("dialogs/resizable")

--! A menu list with a scrollbar. Used by load_game, save_game and custom_game.
class "UIOptions" (UIResizable)

local col_bg = {
  red = 154,
  green = 146,
  blue = 198,
}

local col_button = {
  red = 84,
  green = 200,
  blue = 84,
}

function UIOptions:UIOptions(ui)
  self:UIResizable(ui, 320, 240, col_bg)

  local app = ui.app
  self.modal_class = "main menu"
  self.esc_closes = true
  self.resizable = false
  self:setDefaultPosition(0.5, 0.25)
  
  -- Window parts definition
  
  self.fullscreen_button =
    self:addBevelPanel(20, 20, 20, 20, col_button):makeToggleButton(0, 0, 20, 20, nil, self.buttonFullscreen):setTooltip(_S.tooltip.options_window.fullscreen_button)
  if app.fullscreen then
    self.fullscreen_button:toggle()
  end
  
  self:addBevelPanel(50, 20, 250, 20, col_bg):setLabel(_S.options_window.fullscreen).lowered = true
  
  self:addBevelPanel(20, 180, 280, 40, col_bg):setLabel(_S.options_window.back)
    :makeButton(0, 0, 280, 40, nil, self.buttonBack):setTooltip(_S.tooltip.options_window.back)
end

function UIOptions:buttonFullscreen(checked)
  self.ui:toggleFullscreen()
end

function UIOptions:buttonBack()
  self:close()
end

function UIOptions:close()
  UIResizable.close(self)
  self.ui:addWindow(UIMainMenu(self.ui))
end