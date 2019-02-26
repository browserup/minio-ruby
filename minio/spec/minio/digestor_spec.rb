require_relative '../spec_helper'

RSpec.describe MinioRuby::Digestor do
  it 'computes hexdigest' do
    expect(described_class.hexdigest('chunky bacon')).to eq("0e25f720c60ea891749de548272c33135ff9b3a100f72096182a9b6dc8ebb9f5")
  end

  it 'computes hmac' do
    expect(described_class.hmac('chunky', 'bacon')).to eql("9ac71087c6f736ffafbd98b20d40b604a35599c6b43a794d788259b485777e7c")
  end

  it 'computes hexhmac' do
    expect(described_class.hexhmac('chunky', 'bacon')).to eq("9ac71087c6f736ffafbd98b20d40b604a35599c6b43a794d788259b485777e7c")
  end

  it 'computes base64' do
    expect(described_class.base64('chunky bacon')).to eq("eS7e9xz127ZFkjEZhdPa7g==")
  end
end
