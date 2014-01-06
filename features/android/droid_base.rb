require 'calabash-android/abase'

class DroidPress < Calabash::ABase

  def method_missing sym, *args, &block
    send sym, *args, &block
  end

  def self.element element_name
    define_method element_name.to_s
  end

  class << self
    alias :value    :element
    alias :action   :element
    alias :trait    :element
  end

end
