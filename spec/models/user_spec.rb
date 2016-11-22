require 'rails_helper'

RSpec.describe User, type: :model do
  before :all do
    cook = Role.find_by_name 'cook'

    if cook == nil
      Role.create! name: 'cook'
    end
  end

  before :each do
    @user = User.new first_name: 'test',
                     last_name: 'test',
                     email: 'test@user.com',
                     password: 'testuser',
                     username: 'testuser'
  end

  it 'saves a valid user' do
    expect(@user.validate).to eq(true)
    expect(@user.save).to eq(true)
  end

  it 'wont save a user with invalid email' do
    @user.email = 'invalid.email'

    expect(@user.validate).to eq(false)
    expect(@user.errors.messages[:email]).to eq(['is invalid'])
    expect(@user.save).to eq(false)

    @user.email = 'valid@email.com'
    expect(@user.validate).to eq(true)
    expect(@user.errors.messages[:email]).to eq(nil)
    expect(@user.save).to eq(true)
  end

  it 'it wont save a user whose password has less than 6 characters' do
    @user.password = 'test'
    expect(@user.validate).to eq(false)
    expect(@user.errors.messages[:password]).to eq(['is too short (minimum is 6 characters)'])
    expect(@user.save).to eq(false)

    @user.password = 'testuser'
    expect(@user.validate).to eq(true)
    expect(@user.errors.messages[:password]).to eq(nil)
    expect(@user.save).to eq(true)
  end

  it 'wont save a user without first_name, last_name and username' do
    @user.first_name = ''
    @user.last_name = ''
    @user.username = ''

    expect(@user.validate).to eq(false)
    expect(@user.errors.messages[:first_name]).to eq(["can't be blank"])
    expect(@user.errors.messages[:last_name]).to eq(["can't be blank"])
    expect(@user.errors.messages[:username]).to eq(["can't be blank"])
    expect(@user.save).to eq(false)

    @user.first_name = 'test'
    @user.last_name = 'test'
    @user.username = 'test'

    expect(@user.validate).to eq(true)
    expect(@user.save).to eq(true)
  end

  it 'sets the default user role as cook' do
    expect(@user.save).to eq(true)
    expect(@user.role.name).to eq('cook')
  end
end
