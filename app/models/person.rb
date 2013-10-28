class Person
  attr_accessor :name, :email

  def initialize(attributes={}, options={})
    assign_attributes(attributes)
  end

  private
  def assign_attributes(new_attributes, options={})
    return if new_attributes.nil? or new_attributes.empty?

    new_attributes.each do |attribute,value|
      if respond_to?("#{attribute}=")
        send("#{attribute}=", value)
      else
        raise UnknownAttributeError, "Unknown attribute: #{attribute}"
      end
    end
  end

  class UnknownAttributeError < NoMethodError; end
end
