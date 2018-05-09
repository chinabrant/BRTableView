#
# Be sure to run `pod lib lint BRTableView.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'BRTableView'
  s.version          = '1.0.0'
  s.summary          = 'BRTableView is a subclass of UITableView that seprate viewControler and cell'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
                        BRTableView 解耦了ViewController和UITableViewCell。让VC里面的代码更多简洁，同时要修改，增加，减少cell的类型时，不用改动到VC。让代码结构更清晰。
                       DESC

  s.homepage         = 'https://github.com/chinabrant/BRTableView'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'sjwu1234@gmail.com' => 'sjwu1234@gmail.com' }
  s.source           = { :git => 'https://github.com/chinabrant/BRTableView.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'
  s.source_files = 'BRTableView/Classes/**/*'
  s.public_header_files = 'BRTableView/Classes/**/*.h'

end
