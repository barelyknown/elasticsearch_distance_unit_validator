require "active_model"

class TestModel
  include ActiveModel::Validations

  attr_accessor :distance

  validates :distance, elasticsearch_distance_unit: true
end
