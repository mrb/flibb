require 'spec_helper'

describe 'derp::default' do
  let(:chef_run) { ChefSpec::SoloRunner.new.converge(described_recipe) }

  it 'creates file[/derp]' do
    expect(chef_run).to create_file('/derp')
  end
end
