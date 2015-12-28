#
# Be sure to run `pod lib lint APContactEasyMapping.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "APContactEasyMapping"
  s.version          = "0.0.3"
  s.summary          = "Category to easily map APContact model with EasyMapping."

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!  
  s.description      = "This package is a category that permits to easily map APContact model with EasyMapping."

  s.homepage         = "https://github.com/JeanLebrument/APContact-EasyMapping"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "JeanLebrument" => "jean.lebrument@gmail.com" }
  s.source           = { :git => "https://github.com/JeanLebrument/APContact-EasyMapping.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Sources/*'

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  s.dependency 'APAddressBook'
  s.dependency 'EasyMapping'
end
