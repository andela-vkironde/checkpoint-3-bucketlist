module Paginable
  extend ActiveSupport::Concern
  def paginate(limit_res, page)
    pager = Pagination.new(limit_res, page).paginate
    limit(pager[:limit]).order("id ASC").offset(pager[:offset])
  end
end
