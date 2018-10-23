module RequestsHelper
  def status_request status
    done =  "<i class='text-success'>#{(t".done")}</i>"
    in_progess = "<i class='text-danger'>#{(t ".in_progess")}</i>"
    text_status  = status ? done : in_progess
  end
end
