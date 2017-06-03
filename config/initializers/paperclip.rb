Paperclip::Attachment.default_options[:use_timestamp] = false
Paperclip::Storage::S3.module_eval do
  def temp_url time, style_name = default_style
    if path style_name
      base_options = {expires_in: time}
      s3_object(style_name).presigned_url(:get,
        base_options.merge(s3_url_options)).to_s
    else
      url style_name
    end
  end
end
