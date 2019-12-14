class Project < ApplicationRecord
  validates :name, presence: true,
                   length: { maximum: 40 }

  validates :long_desc, presence: true,
                        length: { maximum: 1024 }

  validates :short_desc, presence: true,
                         length: { maximum: 512 }

  validates :year, presence: true,
                   numericality: { only_integer: true,
                                   greater_than: 2009
                                 }

  FUNCTION_OPTIONS = %w(public_building residential_building administrative_building urbanismus)
  validates :function, presence: true,
                       inclusion: { in: FUNCTION_OPTIONS,
                                    message: "%{value} must be one of #{FUNCTION_OPTIONS}"
                                  }

  STATUS_OPTIONS = %w(in_construction planned built)
  validates :status, presence: true,
                     inclusion: { in: STATUS_OPTIONS,
                                  message: "%{value} must be one of #{STATUS_OPTIONS}"
                                }

end
