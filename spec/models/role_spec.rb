require 'rails_helper'

RSpec.describe Role, type: :model do
  it 'saves a valid role' do
    # role can save even with blank fields...
    role = Role.new
    expect(role.validate).to eq(true)
    expect(role.save).to eq(true)
  end
end
