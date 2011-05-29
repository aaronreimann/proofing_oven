class User < ActiveRecord::Base
  devise :database_authenticatable, :confirmable, :recoverable, :rememberable, :trackable, :validatable

  def full_name
    [first_name, last_name].join(" ")
  end
end
