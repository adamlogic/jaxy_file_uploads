module JaxyFileUploads

  def self.included(base) 
    base.after_filter :format_response_for_ajax_file_uploads
  end 
  
  private 

    def format_response_for_ajax_file_uploads
      # made to work with jquery-form and jquery-jaxy
      if request.content_type == :multipart_form && request.format == :js
        # formatting the response as js may wrap the response in <pre>
        response.content_type = nil

        # jquery-form expects the js response to be in a textarea
        response.body = "<textarea>#{response.body}</textarea>"
      end
    end

end
