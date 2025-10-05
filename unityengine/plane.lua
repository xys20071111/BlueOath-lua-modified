local setmetatable = setmetatable
local Mathf = Mathf
local Vector3 = Vector3
local Plane = {}

function Plane.__index(t, k)
  return rawget(Plane, k)
end

function Plane.__call(t, v)
  return Plane.New(v)
end

function Plane.New(normal, d)
  return setmetatable({
    normal = normal:Normalize(),
    distance = d
  }, Plane)
end

function Plane:Get()
  return self.normal, self.distance
end

function Plane:Raycast(ray)
  local a = Vector3.Dot(ray.direction, self.normal)
  local num2 = -Vector3.Dot(ray.origin, self.normal) - self.distance
  if Mathf.Approximately(a, 0) then
    return false, 0
  end
  local enter = num2 / a
  return 0 < enter, enter
end

function Plane:SetNormalAndPosition(inNormal, inPoint)
  self.normal = inNormal:Normalize()
  self.distance = -Vector3.Dot(inNormal, inPoint)
end

function Plane:Set3Points(a, b, c)
  self.normal = Vector3.Normalize(Vector3.Cross(b - a, c - a))
  self.distance = -Vector3.Dot(self.normal, a)
end

function Plane:GetDistanceToPoint(inPt)
  return Vector3.Dot(self.normal, inPt) + self.distance
end

function Plane:GetSide(inPt)
  return Vector3.Dot(self.normal, inPt) + self.distance > 0
end

function Plane:SameSide(inPt0, inPt1)
  local distanceToPoint = self:GetDistanceToPoint(inPt0)
  local num2 = self:GetDistanceToPoint(inPt1)
  return 0 < distanceToPoint and 0 < num2 or distanceToPoint <= 0 and num2 <= 0
end

UnityEngine.Plane = Plane
setmetatable(Plane, Plane)
return Plane
