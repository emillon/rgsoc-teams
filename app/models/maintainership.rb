# frozen_string_literal: true

class Maintainership < ApplicationRecord
  belongs_to :project
  belongs_to :user

  validates :project, :user, presence: true
  validates :project_id, uniqueness: { scope: :user_id }
end
