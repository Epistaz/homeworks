def task_2(text)
  ret_arr = []
  text.each_line do |line|
    next unless line.downcase.include?('post')

    reg = %r{((?:\d{1,3}\.){3}\d{1,3}).*?\[(.*?)\].*?(/.*?) HTTP}
    mch_d = line.match(reg)
    ret_arr << "#{mch_d[2]} FROM: #{mch_d[1]} TO: #{mch_d[3].upcase}" if mch_d
  end
  ret_arr
end
