class Shift < ApplicationRecord
  belongs_to :user
  attr_accessor :shift_date, :start_time, :finish_time

  before_validation(on: :create) do
    self.start = DateTime.parse("#{shift_date} #{start_time}")
    self.finish = DateTime.parse("#{shift_date} #{finish_time}")
  end

  before_validation(on: :update) do
    self.start = DateTime.parse("#{shift_date} #{start_time}")
    self.finish = DateTime.parse("#{shift_date} #{finish_time}")
  end
end
