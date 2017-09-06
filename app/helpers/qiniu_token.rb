class QiniuToken
  def self.generate
    put_policy = Qiniu::Auth::PutPolicy.new('jiayongfu', nil, 3600)
    Qiniu::Auth.generate_uptoken(put_policy)
  end

  def self.token_for_medium_insert
    put_policy = Qiniu::Auth::PutPolicy.new('jiayongfu', nil, 3600)
    put_policy.return_body = {files: [{url: "#{APP_CONFIG['qiniu']['base_url']}/${key}"}]}.to_json
    Qiniu::Auth.generate_uptoken(put_policy)
  end

  def self.token_for_simditor
    put_policy = Qiniu::Auth::PutPolicy.new('jiayongfu', nil, 3600)
    put_policy.return_body = {success: true, file_path: "#{APP_CONFIG['qiniu']['base_url']}/${key}"}.to_json
    Qiniu::Auth.generate_uptoken(put_policy)
  end

  def self.token_for_video(notify_url)
    put_policy = Qiniu::Auth::PutPolicy.new('jiayongfu', nil, 3600)
    put_policy.persistent_ops = 'avthumb/mp4/s/640x360/vb/1.25m'
    put_policy.persistent_pipeline = 'moke_pl'
    put_policy.persistent_notify_url = notify_url if notify_url.present?
    Qiniu::Auth.generate_uptoken(put_policy)
  end


end