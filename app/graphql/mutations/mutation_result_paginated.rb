module Mutations
  class MutationResultPaginated
    def self.call(obj: {}, success: false, errors: [], current_page: nil, total_pages: nil)
      obj.merge(success: success, errors: errors, current_page: current_page, total_pages: total_pages)
    end
  end
end
