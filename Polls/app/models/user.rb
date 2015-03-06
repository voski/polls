# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  user_name  :string           not null
#  created_at :datetime
#  updated_at :datetime
#

class User < ActiveRecord::Base
  validates :user_name, presence: true, uniqueness: true

  has_many(
    :authored_polls,
    class_name: 'Poll',
    foreign_key: :author_id,
    primary_key: :id
  )

  has_many(
    :responses,
    foreign_key: :user_id,
    primary_key: :id,
    class_name: 'Response'
  )

  def completed_polls

  end

  def uncompleted_polls

  end

  ## query returns completed polls for user 
  # SELECT
  #   polls.*, count(distinct questions.id) AS questions_per_poll, COUNT(user_responses.user_id) AS completed_questions
  # FROM
  #   polls
  # JOIN
  #   questions ON polls.id = questions.poll_id
  # JOIN
  #   answer_choices ON questions.id = answer_choices.question_id
  # LEFT OUTER JOIN (
  #   SELECT
  #     *
  #   FROM
  #     responses
  #   WHERE
  #     responses.user_id = 3
  #   ) AS user_responses ON answer_choices.id = user_responses.answer_id
  # WHERE
  #   polls.id = 1
  # GROUP BY
  #   polls.id
  # HAVING
  #   count(distinct questions.id) = COUNT(user_responses.user_id);


end
