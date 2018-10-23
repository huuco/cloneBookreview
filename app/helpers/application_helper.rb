module ApplicationHelper
  def full_title page_title = ""
    base_title = t ".book_review"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end

  # def index_record index, per_page, page
  #   page >= 2 ? (page.to_i - 1)*per_page + index.to_i + 1 : index + 1
  # end

   def index_record object, counter
    # byebug
    ((object.current_page - 1) * object.limit_value) + counter + 1
  end
end
