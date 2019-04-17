eval_lam = lambda do |arg|
  $SAFE = 1 # disallows use eval or File.open with a tainted object
  send(:eval, arg) # No harm! only 4Fun
end

def create_expression
  exp = ''
  signs = %w[+ * / -]
  nums = ('2' * 11).split('')
  until nums.empty?
    exp += nums.pop(rand(1..nums.length)).join
    exp += signs.sample unless nums.empty?
  end
  exp
end

def find_solution(eval_lam)
  rez = 0
  until rez == 2009
    exp = create_expression
    rez = eval_lam.call(exp)
  end
  "#{exp} = #{rez}"
end

p find_solution(eval_lam)
