# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  fname      :string
#  lname      :string
#  created_at :datetime
#  updated_at :datetime
#

class User < ActiveRecord::Base

  has_many :authored_polls,
    class_name: "Poll",
    foreign_key: :poll_id,
    primary_key: :id

  has_many :responses,
    class_name: "Response",
    foreign_key: :response_id,
    primary_key: :id

  validates :fname, :lname, presence: true
end
