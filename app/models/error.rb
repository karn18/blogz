class Error < StandardError
  attr_accessor :code, :data, :message
end
