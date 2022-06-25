# LaGUI
GUI utils for touchscreen (LÖVE for Android)
_obs: I'm not using metatables for now._
[Progress](#Progress) - [Instructions](#Instructions)
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

