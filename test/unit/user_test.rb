require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "a user should enter a first name" do
		user = User.new
		assert !user.save
		assert !user.errors[:first_name].empty?
	end

  test "a user should enter a last name" do
		user = User.new
		assert !user.save
		assert !user.errors[:last_name].empty?
	end
  
  test "a user should enter a profile_name " do
		user = User.new
		assert !user.save
		assert !user.errors[:profile_name].empty?
	end
  test "a user should have a unique profile_name" do
		user = User.new
		user.profile_name = users(:jason).profile_name

		assert !user.save
		assert !user.errors[:profile_name].empty?
	end

	test "a user should have a profile name witout spaces" do
		user = User.new(first_name: 'Jason', last_name: 'Seifer', email: 'jason@teamtreehouse.com')
		user.profile_name = "My Profile Name With Spaces"

		assert !user.save
		assert !user.errors[:profile_name].empty?
		assert user.errors[:profile_name].include?("Must be formatted correctly.")
	end

	
end
