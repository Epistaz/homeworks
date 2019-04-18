def task_4(str)
  str.gsub(/\D/, '').split('').map(&:to_i).sum
end
