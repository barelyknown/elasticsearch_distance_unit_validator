require "active_model"

class ElasticsearchDistanceUnitValidator < ActiveModel::EachValidator
  VERSION = "0.1"
  VALID_UNITS = %w(
    mi miles
    yd yards
    ft feet
    in inches
    km kilometers
    m  meters
    cm centimeters
    mm millimeters
    NM nmi nauticalmiles
  )
  INVALID_GENERAL_FORMAT_MESSAGE = "did not match the general format"
  INVALID_NUMBER_MESSAGE = "is not greater than zero"
  INVALID_UNIT_MESSAGE = "is not a valid distance unit"

  def validate_each(record, attribute, value)
    validate_format(record, attribute, value)
    if record.errors[attribute].empty?
      validate_number(record, attribute, value)
      validate_units(record, attribute, value)
    end
  end

  private

  def validate_format(record, attribute, value)
    unless value =~ /\A-?\d+[a-zA-Z]+\z/
      record.errors.add(attribute, "#{value} #{INVALID_GENERAL_FORMAT_MESSAGE}")
    end
  end

  def validate_number(record, attribute, value)
    number = value[/\A[-,\d,.]+/]
    unless number && BigDecimal(number) > 0
      record.errors.add(attribute, "#{number} #{INVALID_NUMBER_MESSAGE}")
    end
  end

  def validate_units(record, attribute, value)
    units = value[/[a-zA-Z]+\z/]
    unless VALID_UNITS.include?(units)
      record.errors.add(attribute, "#{units} #{INVALID_UNIT_MESSAGE}")
    end
  end
end
