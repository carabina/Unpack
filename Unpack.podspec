Pod::Spec.new do |s|
s.name             = 'Unpack'
s.version          = '0.1.0'
s.summary          = 'A library to simplify the process of parsing Data/JSON to objects and vice versa'

s.description      = <<-DESC
Unpack allows easy conversion between raw Data and JSON objects and your own Class and Struct types. It consists of a simple API, but allows further control over the process.
DESC
s.homepage         = 'https://github.com/oreninit/Unpack'
s.license          = { :type => 'MIT', :file => 'LICENSE' }
s.author           = { 'Oreninit' => 'oreninit@gmail.com' }
s.source           = { :git => 'https://github.com/oreninit/Unpack.git', :tag => s.version.to_s }
s.social_media_url = 'https://twitter.com/oreninit'
s.ios.deployment_target = '9.3'
s.source_files = 'Reuse/Classes/**/*'
s.frameworks = 'Foundation'
end
