
if platform?("ubuntu", "debian")
  include_recipe "apt"
  apt_repository "varnish-cache.org" do
    uri "http://repo.varnish-cache.org/#{:platform}/"
    distribution node['lsb']['codename']
    components ["main"]
    key "http://repo.varnish-cache.org/debian/GPG-key.txt"
    deb_src true
    notifies :run, resources(:execute => "apt-get update"), :immediately
  end
end