meta :rvm do
  def rvm args
    shell "~/.rvm/bin/rvm #{args}", :log => args['install']
  end
end

dep 'rubies' do
  requires '1.9.2.rvm'
  requires '1.9.3.rvm'
end

dep '1.9.2.rvm' do
  requires 'rvm'
  met? { rvm('list')['ruby-1.9.2'] }
  meet { log("rvm install 1.9.2") { rvm 'install 1.9.2'} }
end

dep '1.9.3.rvm' do
  requires 'rvm'
  met? { rvm('list')['ruby-1.9.3'] }
  meet { log("rvm install 1.9.3") { rvm 'install 1.9.3'} }
end

dep 'rvm' do
  met? { "~/.rvm/bin/rvm".p.exists? }
  meet {
    log_shell "Installing rvm", 'curl -L https://get.rvm.io | bash -s'
  }
end