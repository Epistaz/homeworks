eval_lam = lambda do |arg|
  $SAFE = 1 # disallows use eval or File.open with a tainted object
  send(:eval, arg) # No harm! only 4Fun
end

def find_solution(number, eval_lam)
  nums = %w[1.0 3.0 4.0 6.0]
  signs = %w[+ * /]
  rez = 0
  until rez == number
    exp = ''
    rand(2..10).times { exp += nums.sample + signs.sample }
    exp += nums.sample
    rez = eval_lam.call(exp)
  end
  "#{exp} = #{rez}"
end

p find_solution(24, eval_lam)
