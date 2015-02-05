RSpec.describe TestModel do
  let :valid_units do
    ElasticsearchDistanceUnitValidator::VALID_UNITS
  end

  let :invalid_units do
    %w(hands smidges paces)
  end

  let :valid_numbers do
    (1..10).to_a
  end

  let :invalid_numbers do
    (-1..0).to_a
  end

  let :invalid_values do
    [
      valid_numbers[0].to_s + " " + valid_units[0].to_s, # space in the middle
      "a" + valid_numbers[0].to_s + valid_units[0].to_s, # starts with a non digit
      valid_numbers[0].to_s + valid_units[0].to_s + " ", # ends with a space
      valid_numbers[0].to_s + valid_units[0].to_s + 1.to_s, #ends with a number
    ]
  end

  def validate_error_for(subject, number, unit, *messages)
    subject.distance = number.to_s + unit.to_s
    subject.valid?
    messages.each do |message|
      expect(subject.errors[:distance]).to include Regexp.new(message)
    end
  end

  context "when the general format is invalid" do
    it "distance is invalid and has the correct error message" do
      invalid_values.each do |value|
        subject.distance = value
        subject.valid?
        expect(subject.errors[:distance]).to include Regexp.new(ElasticsearchDistanceUnitValidator::INVALID_GENERAL_FORMAT_MESSAGE)
      end
    end
  end

  context "when the number is valid" do
    context "when the units is valid" do
      it "distance is valid" do
        valid_numbers.product(valid_units).each do |number, unit|
          subject.distance = number.to_s + unit.to_s
          expect(subject).to be_valid
        end
      end
    end
    context "when the units are invalid" do
      it "distance is invalid and has the correct error message" do
        valid_numbers.product(invalid_units).each do |number, unit|
          validate_error_for(subject, number, unit, ElasticsearchDistanceUnitValidator::INVALID_UNIT_MESSAGE)
        end
      end
    end
  end
  context "when the number is invalid" do
    context "when the units is valid" do
      it "distance is invalid and has the correct error message" do
        invalid_numbers.product(valid_units).each do |number, unit|
          validate_error_for(subject, number, unit, ElasticsearchDistanceUnitValidator::INVALID_NUMBER_MESSAGE)
        end
      end
    end
    context "when the units is invalid" do
      it "distance is invalid and has the correct error message" do
        invalid_numbers.product(invalid_units).each do |number, unit|
          validate_error_for(subject, number, unit, ElasticsearchDistanceUnitValidator::INVALID_UNIT_MESSAGE, ElasticsearchDistanceUnitValidator::INVALID_NUMBER_MESSAGE)
        end
      end
    end
  end
end
