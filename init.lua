--- === Tiler ===
--- Side-by-side window tiling
--- Allows choosing a second window to tile next to the focused window.
--- Taken from @megalthic who apparently got if from @evantravers, who got it
--- from @tmiller. Converted to a spoon by @von.


local Tiler = {}

-- Metadata
Tiler.name="Tiler"
Tiler.version="0.2"
Tiler.author="Von Welch (von@vwelch.com)"
-- https://opensource.org/licenses/Apache-2.0
Tiler.license="Apache-2.0"
Tiler.homepage="https://github.com/von/Tiled.spoon"

--- Tiler:debug(enable)
--- Method
--- Enable or disable debugging
---
--- Parameters:
---  * enable - Boolean indicating whether debugging should be on
---
--- Returns:
---  * Nothing
function Tiler:debug(enable)
  if enable then
    self.log.setLogLevel('debug')
    self.log.d("Debugging enabled")
  else
    self.log.d("Disabling debugging")
    self.log.setLogLevel('info')
  end
end

-- Methods
-- Spoon methods/variables/constants/etc. should use camelCase

--- Tiler:init()
--- Method
--- Initializes a Tiler
--- When a user calls hs.loadSpoon(), Hammerspoon will load and execute init.lua
--- from the relevant s.
--- Do generally not perform any work, map any hotkeys, start any timers/watchers/etc.
--- in the main scope of your init.lua. Instead, it should simply prepare an object
--- with methods to be used later, then return the object.
---
--- Parameters:
---  * None
---
--- Returns:
---  * Tiler object

function Tiler:init()
  -- Set up logger for spoon
  self.log = hs.logger.new("Tiler")

  -- Path to this file itself
  -- See also http://www.hammerspoon.org/docs/hs.spoons.html#resourcePath
  self.path = hs.spoons.scriptPath()

  -- Other initialization code here

  return self
end

--start() and stop()
--If your Spoon provides some kind of background activity, e.g. timers, watchers,
--spotlight searches, etc. you should generally activate them in a :start()
--method, and de-activate them in a :stop() method

--- Tiler:start()
--- Method
--- Start background activity.
---
--- Parameters:
---  * param - Some parameter
---
--- Returns:
---  * Tiler object
function Tiler:start()
  -- Code here
  return self
end

--- Tiler:stop()
--- Method
--- Stop background activity.
---
--- Parameters:
---  * param - Some parameter
---
--- Returns:
---  * Tiler object
function Tiler:stop()
  -- Code here
  return self
end

--- Tiler:bindHotKeys(table)
--- Method
--- The method accepts a single parameter, which is a table. The keys of the table
--- are strings that describe the action performed, and the values of the table are
--- tables containing modifiers and keynames/keycodes. E.g.
---   {
---     chooser = {{"cmd", "alt"}, "f"}
--    }
---
---
--- Parameters:
---  * table - Table of action to key mappings
---
--- Returns:
---  * Tiler object

function Tiler:bindHotKeys(table)
  local spec = {
    chooser = hs.fnutils.partial(self.chooser, self)
  }
  hs.spoons.bindHotkeysToSpec(spec, mapping)
end

--- chooser
--- Method
--- Bring up a hs.chooser with a list of windows. Tile the chosen window to the right
--- of the currently focused window.
---
--- Parameters:
--- * None
---
--- Returns:
--- * Nothing
function Tiler:chooser()
  local windows = hs.fnutils.map(hs.window.filter.new():getWindows(), function(win)
    if win ~= hs.window.focusedWindow() then
      return {
        text = win:title(),
        subText = win:application():title(),
        image = hs.image.imageFromAppBundle(win:application():bundleID()),
        id = win:id()
      }
    end
  end)

  local function chooserCallback(choice)
    if choice ~= nil then
      local layout = {}
      local focused = hs.window.focusedWindow()
      local toRead  = hs.window.find(choice.id)
      if hs.eventtap.checkKeyboardModifiers()['alt'] then
        hs.layout.apply({
            {nil, focused, focused:screen(), hs.layout.left70, 0, 0},
            {nil, toRead, focused:screen(), hs.layout.right30, 0, 0}
          })
      else
        hs.layout.apply({
            {nil, focused, focused:screen(), hs.layout.left50, 0, 0},
            {nil, toRead, focused:screen(), hs.layout.right50, 0, 0}
          })
      end
      toRead:raise()
    end
  end

  local chooser = hs.chooser.new(chooserCallback)

  chooser
  :placeholderText("Choose window for 50/50 split. Hold ⎇ for 70/30.")
  :searchSubText(true)
  :choices(windows)
  :show()
end

return Tiler
