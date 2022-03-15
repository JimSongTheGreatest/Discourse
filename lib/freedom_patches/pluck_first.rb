# frozen_string_literal: true

module FreedomPatches
  module PluckFirst
    def pluck_first(*attributes)
      limit(1).pluck(*attributes).first
    end

    def pluck_first!(*attributes)
      pluck_first.presence || raise_record_not_found_exception!
    end

    ActiveRecord::Relation.prepend(self)
    ActiveRecord::Querying.delegate(:pluck_first, :pluck_first!, to: :all)
  end
end
