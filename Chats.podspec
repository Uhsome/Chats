Pod::Spec.new do |s|
	s.name	       = 'Chats'
	s.version      = '1.4.4'
	s.summary      = 'Chat UI library for iOS.'
	s.source       = { :git => 'https://github.com/acani/Chats.git', :tag => s.version.to_s }
	s.platform     = :ios, '7.0'
	s.source_files = 'Chats/Chats/*.swift'
	s.resources    = 'Chats/Chats/Resources/*.aiff'
	s.frameworks   = 'UIKit', 'AudioToolbox', 'Foundation'
	s.requires_arc = true
end
