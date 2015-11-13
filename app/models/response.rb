# == Schema Information
#
# Table name: responses
#
#  id               :integer          not null, primary key
#  respondent_id    :integer
#  answer_choice_id :integer
#  created_at       :datetime
#  updated_at       :datetime
#


class Response < ActiveRecord::Base

  belongs_to :respondent,
    class_name: "User",
    foreign_key: :respondent_id,
    primary_key: :id

  belongs_to :answer_choices,
    class_name: "AnswerChoice",
    primary_key: :id,
    foreign_key: :answer_choice_id

  has_one :question,
    through: :answer_choices,
    source: :question

  validates :respondent_id, :answer_choice_id, presence: true

  def sibling_responses
    self.question.responses.where(["responses.id != ?", self.id])
  end
end
