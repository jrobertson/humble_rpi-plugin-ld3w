Gem::Specification.new do |s|
  s.name = 'humble_rpi-plugin-ld3w'
  s.version = '0.2.1'
  s.summary = 'Intended for using a Nokia LD-3W with a Raspberry Pi ' + 
      'from the Humble_RPi gem'
  s.authors = ['James Robertson']
  s.files = Dir['lib/humble_rpi-plugin-ld3w.rb']
  s.add_runtime_dependency('ld3w', '~> 0.1', '>=0.2.1')
  s.signing_key = '../privatekeys/humble_rpi-plugin-ld3w.pem'
  s.cert_chain  = ['gem-public_cert.pem']
  s.license = 'MIT'
  s.email = 'james@jamesrobertson.eu'
  s.homepage = 'https://github.com/jrobertson/humble_rpi-plugin-ld3w'
end
