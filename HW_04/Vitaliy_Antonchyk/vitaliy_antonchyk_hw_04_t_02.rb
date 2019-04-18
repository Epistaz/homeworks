require 'yaml'

def task_4_2(yaml)
  text = YAML.safe_load(yaml)
  arr = []
  return arr if text.nil?

  text.each do |env_k, env_v|
    arr << { env_k.to_sym => parse_values(env_v) }
  end
  arr
end

def parse_values(values)
  h = {}
  database = values['database']
  user = values['username']
  password = values['password']
  magic_number = values.fetch('pool', 1) * values.fetch('timeout', 1000)
  h[:db] = database if database
  h[:user] = user if user
  h[:password] = password if password
  h[:magic_number] = magic_number
  h
end
