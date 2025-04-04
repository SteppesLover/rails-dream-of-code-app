class Topic < ApplicationRecord
    has_many :lesson_topic_assignment
    has_many :lesson
  end
  