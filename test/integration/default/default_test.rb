# InSpec test for recipe factorio::default

# The InSpec reference, with examples and extensive documentation, can be
# found at https://www.inspec.io/docs/reference/resources/

describe user('factorio') do
  it { should exist }
  its('groups') { should eq ['factorio'] }
  its('groups') { should_not eq %w(sudo admin) }
end

describe group('factorio') do
  it { should exist }
end

describe directory('/opt/factorio') do
  it { should exist }
  its('owner') { should eq 'factorio' }
  its('group') { should eq 'factorio' }
  its('mode') { should cmp '0775' }
end
