describe port(34197) do
  it { should be_listening }
  its('addresses') { should include '0.0.0.0' }
  its('protocols') { should include 'udp' }
end

describe file '/opt/factorio/factorio_package.tar.xz' do
  it { should exist }
  its('owner') { should eq 'factorio' }
  its('group') { should eq 'factorio' }
  its('mode') { should cmp '0440' }
end

describe directory('/opt/factorio/factorio') do
  it { should exist }
  its('owner') { should eq 'factorio' }
  its('group') { should eq 'factorio' }
end

describe directory('/opt/factorio/.saves') do
  it { should exist }
  its('owner') { should eq 'factorio' }
  its('group') { should eq 'factorio' }
end

describe file '/opt/factorio/.saves/uaf-cs.zip' do
  it { should exist }
  its('owner') { should eq 'factorio' }
  its('group') { should eq 'factorio' }
  its('mode') { should cmp '0644' }
end

describe command('tar -xJf /opt/factorio/factorio_package.tar.xz') do
  its('exit_status') { should eq 0 }
end

# describe crontab(path: '/etc/cron.d/start factorio server') do
#  its('commands') { should include ' @reboot factorio /opt/factorio/factorio/bin/x64/factorio --start-server '}
# end
