# # Platform specific settings
# case node['platform']
# when 'redhat','centos'
#     package_name 'httpd'

# when 'ubuntu','debian'
#     package_name 'apache2'

# end

# package package_name do
#     action  :install
# end

# service 'httpd' do
#     action [:enable, :start]
# end

package "Install Apache" do
    package_name value_for_platform(
       ["redhat", "amazon"] => { "default" => "httpd" },
       ["ubuntu"] => { "default" => "apache2" }
    )
 end


service 'Start Apache' do
    service_name value_for_platform(
       ["redhat", "amazon"] => { "default" => "httpd" },
       ["ubuntu"] => { "default" => "apache2" }
    )
    action [:enable, :start]
end

file '/var/www/html/index.html' do
    content '<html>
    <head>
    <title> This is simple webpage </title>
    </head>
    <body>
    <h1> This is a special website </h1>
    </body>
</html>'
end
