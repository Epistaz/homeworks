require 'time'

def task_3(text)
  arr = text.split("\n")
  first_line = arr.index { |v| v[/Calling core with action:/] }
  if first_line
    arr.map { |line| line[/[\d-]+ [\d:.]+/] }
       .map { |el| Time.parse(el) }
       .slice(first_line..-1)
       .then { |me| me.last - me.first }
  else
    '0'
  end
end
