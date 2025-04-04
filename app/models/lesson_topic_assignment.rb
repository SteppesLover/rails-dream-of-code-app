class LessonTopicAssignment < ApplicationRecord
    belongs_to :lesson
    belongs_to :topic
  end