# == Schema Information
#
# Table name: questions
#
#  id         :integer          not null, primary key
#  poll_id    :integer          not null
#  text       :text             not null
#  created_at :datetime
#  updated_at :datetime
#

class Question < ActiveRecord::Base
  validates :poll_id, :text, presence: true

  belongs_to(
    :poll,
    foreign_key: :poll_id,
    primary_key: :id,
    class_name: 'Poll'
  )


  has_many(
    :answer_choices,
    foreign_key: :question_id,
    primary_key: :id,
    class_name: 'AnswerChoice'
  )

  has_many :responses, through: :answer_choices, source: :responses

  def title
    text
  end

  def results
    hash = {}
    raw_data = answer_choices
    .select('answer_choices.*, COUNT(responses.id) AS response_count')
    .joins('LEFT OUTER JOIN responses ON answer_choices.id = responses.answer_id')
    .group('answer_choices.id')
    .having('answer_choices.question_id = ?', id)

    raw_data.each { |i| hash[i.text] = i.response_count }
    hash
  end
end
