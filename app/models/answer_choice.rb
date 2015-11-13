# == Schema Information
#
# Table name: answer_choices
#
#  id          :integer          not null, primary key
#  question_id :integer
#  body        :text
#  created_at  :datetime
#  updated_at  :datetime
#


class AnswerChoice < ActiveRecord::Base

  has_many :responses,
    class_name: "Response",
    primary_key: :id,
    foreign_key: :answer_choice_id

  belongs_to :question,
    class_name: "Question",
    primary_key: :id,
    foreign_key: :question_id

    validates :question_id, :body, presence: true

  end
