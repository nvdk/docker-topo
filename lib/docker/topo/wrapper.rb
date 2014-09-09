class Docker::Topo::Wrapper
  @docker_path = '/usr/bin/docker'

  def initialize( options )
    @options = options
    @docker_path = find_docker
  end

  def self.exec(command)
    self.new.x command
  end

  def x(command)
    if @options.has_key? :sudo
      `sudo #{@docker_path} #{command}`
    else
      `#{@docker_path} #{command}`
    end
  end

  private
  def find_docker
    exts = ENV['PATHEXT'] ? ENV['PATHEXT'].split(';') : ['']
    ENV['PATH'].split(File::PATH_SEPARATOR).each do |path|
      exts.each { |ext|
        exe = File.join(path, "docker#{ext}")
        return exe if File.executable?(exe) && !File.directory?(exe)
      }
    end
    return nil
  end
end
