require 'rails_helper'
  
RSpec.describe Event, type: :model do
  before(:each) do
    @user = User.create(email: "test@example.com", password: "password")
  end

  after(:each) do
    @user.destroy
  end

  it "is valid with valid attributes" do
    event = Event.new(
      title: "Daniels Birthday",
      description: "Sample Description",
      location: "Dublin",
      user: @user,
      start_date: Time.now,
      end_date: Time.now + 24.hour
    )
    expect(event).to be_valid

  end

  it "is not valid without a title" do
    event = Event.new(
      description: "Sample Description",
      location: "Dublin",
      user: @user,
      start_date: Time.now,
      end_date: Time.now + 24.hour
    )
    expect(event).to_not be_valid
  end

  it "is not valid without a description" do
    event = Event.new(
      title: "Daniels Birthday",
      location: "Dublin",
      user: @user,
      start_date: Time.now,
      end_date: Time.now + 24.hour
    )
    expect(event).to_not be_valid
  end

  it "is not valid without a location" do
    event = Event.new(
      title: "Daniels Birthday",
      description: "Sample Description",
      user: @user,
      start_date: Time.now,
      end_date: Time.now + 24.hour
    )
    expect(event).to_not be_valid
  end

  it "is not valid without a start_date" do
    event = Event.new(
      title: "Daniels Birthday",
      description: "Sample Description",
      location: "Dublin",
      user: @user,
      end_date: Time.now + 24.hour
    )
    expect(event).to_not be_valid
  end

  it "is not valid without a end_date" do
    event = Event.new(
      title: "Daniels Birthday",
      description: "Sample Description",
      location: "Dublin",
      user: @user,
      start_date: Time.now,
    )
    expect(event).to_not be_valid
  end

  it "is not valid without a user" do
    event = Event.new(
      title: "Daniels Birthday",
      description: "Sample Description",
      location: "Dublin",
      start_date: Time.now,
      end_date: Time.now + 24.hour
    )
    expect(event).to_not be_valid
  end

end