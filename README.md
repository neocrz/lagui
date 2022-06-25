# LaGUI

GUI for touchscreen (LÖVE for Android)

[Progress](#Progress) - [Instructions](#Instructions)


_obs: I'm not using metatables for now._

## Progress
### Button
- [x] Rectangle
- [x] Circle
- [x] D-pad

### Joystick
- [ ] Joystick

### Windows
- [ ] window system

## Instructions


### Making a easy acess
Make a `lagui.lua` file that goes to the lagui file in the lagui folder directly
```lua
-- ./lagui <- lagui folder
-- ./lagui.lua <- new file
```
```lua
-- lagui.lua
local path = (...):match("(.-)[^%.]+$")

return require(path .. "lagui.lagui")
```

