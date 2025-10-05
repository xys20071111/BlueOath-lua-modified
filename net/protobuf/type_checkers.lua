local type = type
local error = error
local string = string
local type_checkers = {}
_ENV = type_checkers

function TypeChecker(acceptable_types)
  local acceptable_types = acceptable_types
  return function(proposed_value)
    local t = type(proposed_value)
    if acceptable_types[type(proposed_value)] == nil then
      error(string.format("%s has type %s, but expected one of: %s", proposed_value, type(proposed_value), acceptable_types))
    end
  end
end

function Int32ValueChecker()
  local _MIN = -2147483648
  local _MAX = 2147483647
  return function(proposed_value)
    if type(proposed_value) ~= "number" then
      error(string.format("%s has type %s, but expected one of: number", proposed_value, type(proposed_value)))
    end
    if proposed_value < _MIN or proposed_value > _MAX then
      error("Value out of range: " .. proposed_value)
    end
  end
end

function Int64ValueChecker()
  local _MIN = -4503599627370496
  local _MAX = 4503599627370495
  return function(proposed_value)
    if type(proposed_value) ~= "number" then
      error(string.format("%s has type %s, but expected one of: number", proposed_value, type(proposed_value)))
    end
    if proposed_value < _MIN or proposed_value > _MAX then
      error("Value out of range: " .. proposed_value)
    end
  end
end

function Uint32ValueChecker(IntValueChecker)
  local _MIN = 0
  local _MAX = 4294967295
  return function(proposed_value)
    if type(proposed_value) ~= "number" then
      error(string.format("%s has type %s, but expected one of: number", proposed_value, type(proposed_value)))
    end
    if proposed_value < _MIN or proposed_value > _MAX then
      error("Value out of range: " .. proposed_value)
    end
  end
end

function Uint64ValueChecker(IntValueChecker)
  local _MIN = 0
  local _MAX = 9007199254740991
  return function(proposed_value)
    if type(proposed_value) ~= "number" then
      error(string.format("%s has type %s, but expected one of: number", proposed_value, type(proposed_value)))
    end
    if proposed_value < _MIN or proposed_value > _MAX then
      error("Value out of range: " .. proposed_value)
    end
  end
end

function UnicodeValueChecker()
  return function(proposed_value)
    if type(proposed_value) ~= "string" then
      error(string.format("%s has type %s, but expected one of: string", proposed_value, type(proposed_value)))
    end
  end
end

return _ENV
