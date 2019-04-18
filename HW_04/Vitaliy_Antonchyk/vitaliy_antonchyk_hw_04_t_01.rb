def task_4_1(num)
  return [0] if num.zero?
  return [1] if num == 1
  return [] if num < 0 || num > 1000

  default_v = [1, 1]
  fib(num, default_v)
end

def fib(num, arr)
  if arr.length < num
    arr << arr[-1] + arr[-2]
    fib(num, arr)
  end
  arr
end
