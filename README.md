# LaGUI

GUI utils for touchscreen (LÖVE for Android)

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
Make a `lagui.lua` file that go to lagui file in lagui folder directly
```lua
-- ./lagui folder
-- ./lagui.lua <- this new file
```
```lua
-- lagui.lua
local path = (...):match("(.-)[^%.]+$")

return require(path .. "lagui.lagui")
```

