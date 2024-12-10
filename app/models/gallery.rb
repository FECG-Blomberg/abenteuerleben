class Gallery
  def self.list_files
    whitelist = ['.png', '.jpg', '.jpeg']
    images = []

    connect do |sftp|
      images = sftp.dir.entries('/').filter { |file| whitelist.include?(File.extname(file.name)) }
    end

    images
  end

  def self.get_file path
    content = ''

    connect do |sftp|
      file = sftp.file.open path
      Rails.logger.info file.size
      content = file.read
      file.close
    end

    content
  end

  private
    def self.connect(&block)
      host = ENV['SFTP_HOST'] || 'localhost'
      user = ENV['SFTP_USER'] || 'local'
      pass = ENV['SFTP_PASS'] || 'gallery'
      port = ENV['SFTP_PORT'] || 2022

      Net::SFTP.start(host, user, { password: pass, port: port }) do |sftp|
        yield sftp
      end
    end
end