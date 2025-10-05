local setmetatable = setmetatable
local table = table
local rawset = rawset
local error = error
local containers = {}
_ENV = containers
local _RCFC_meta = {
  add = function(self)
    local message_descriptor = self._message_descriptor
    local value = message_descriptor._concrete_class and message_descriptor._concrete_class() or message_descriptor()
    local listener = self._listener
    rawset(self, #self + 1, value)
    value:_SetListener(listener)
    if listener.dirty == false then
      listener:Modified()
    end
    return value
  end,
  remove = function(self, key)
    local listener = self._listener
    table.remove(self, key)
    listener:Modified()
  end
}
_RCFC_meta.__index = _RCFC_meta

function RepeatedCompositeFieldContainer(listener, message_descriptor)
  local o = {_listener = listener, _message_descriptor = message_descriptor}
  return setmetatable(o, _RCFC_meta)
end

local _RSFC_meta = {
  append = function(self, value)
    self._type_checker(value)
    rawset(self, #self + 1, value)
    self._listener:Modified()
  end,
  remove = function(self, key)
    table.remove(self, key)
    self._listener:Modified()
  end
}
_RSFC_meta.__index = _RSFC_meta

function RepeatedScalarFieldContainer(listener, type_checker)
  local o = {}
  o._listener = listener
  o._type_checker = type_checker
  return setmetatable(o, _RSFC_meta)
end

return _ENV
