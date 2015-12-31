require 'data_masker/version'
require 'data_masker/masked_name'

#
module DataMasker
  class << self
    attr_accessor :salt # Can be set to seed randomization
  end
end
