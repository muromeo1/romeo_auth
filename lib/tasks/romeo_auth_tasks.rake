require_relative '../../spec/dummy/config/environment'

desc 'Display romeo_auth routes'
task :routes do
  puts "\n"
  puts '--------------------------------------------------'
  puts '                 RomeoAuth routes                 '
  puts '--------------------------------------------------'

  RomeoAuth::Engine.routes.routes.each do |route|
    http = route.verb.upcase
    path = route.path.spec
    controller = route.defaults[:controller].gsub('romeo_auth/', '')
    action = route.defaults[:action]

    puts "#{http} #{path} => #{controller}##{action}"
  end

  puts '--------------------------------------------------'
  puts "\n"
end
