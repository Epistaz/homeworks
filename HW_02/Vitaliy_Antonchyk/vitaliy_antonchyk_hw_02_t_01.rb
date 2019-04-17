def eval_angle(hours, minutes)
  angle_ph = 360 / 12.0
  angle_pm = 360 / 60.0
  (angle_ph * hours - (angle_pm + angle_ph / 60) * minutes).abs
end

p eval_angle(3, 15)
