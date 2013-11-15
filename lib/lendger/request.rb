require "ostruct"
require "active_support/core_ext/hash/conversions"
require "active_support/core_ext/hash/indifferent_access"
require "active_support/hash_with_indifferent_access"

class Request < OpenStruct
  def object_attributes
    _obj_attrs = self[:object_attributes]
    return _obj_attrs && _obj_attrs.to_hash.with_indifferent_access
  end
end

class Response < OpenStruct
  def persisted?
    return !id.nil?
  end
end
