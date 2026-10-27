Pod::Spec.new do |s|
  s.name             = 'APIVerveJobPostings'
  s.version          = '1.2.3'
  s.summary          = 'Job Postings is a jobs API that returns the open positions on a company\'s public career board.'
  s.description      = <<-'DESC'
Job Postings is a jobs API that returns the open positions on a company's public career board. Every job comes back in the same shape: title, department, team, locations, remote and workplace type, employment type, posting date and apply link. Filter by keyword, location, department, employment type, posting date or remote. Paid plans add the full job description and salary ranges where the company publishes them.

This iOS/macOS SDK provides a convenient way to access the Job Postings from APIVerve.
Supports both callback-based and async/await patterns.
                       DESC

  s.homepage         = 'https://apiverve.com/marketplace/jobpostings?utm_source=cocoapods&utm_medium=referral&utm_content=homepage'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'APIVerve' => 'hello@apiverve.com' }
  # The SDK repo holds every language; the pod lives under cocoapods/ with its own tag.
  s.source           = { :git => 'https://github.com/apiverve/jobpostings-api.git', :tag => "cocoapods/v#{s.version}" }

  s.ios.deployment_target = '15.0'
  s.osx.deployment_target = '12.0'

  s.swift_version = '5.0'

  s.source_files = 'cocoapods/Sources/APIVerveJobPostings/**/*.swift'

  s.frameworks = 'Foundation'

  # APIResponse, APIVerveError and the request plumbing, shared by every APIVerve pod.
  s.dependency 'APIVerveCore', '~> 1.2'
end
