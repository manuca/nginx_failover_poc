App = Proc.new do |env|
  name = ENV['name'] || 'default'
  ['200', {'Content-Type' => 'text/html'}, ["I'm container: #{name}"]]
end

run App
