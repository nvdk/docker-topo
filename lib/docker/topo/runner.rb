require "yaml"

class Docker::Topo::Runner
  attr_accessor :images, :repositories, :options

  def initialize(path, options)
    @options = options
    config = ::YAML.load_file(path)
    @images = Docker::Topo::TSortableImages.new.merge! config["images"]
    @images.tsort
    repositories = config["repositories"]
  end

  def rm
    docker_wrapper = Docker::Topo::Wrapper.new options
    puts @images.inspect
    @images.each do |name,config|
      command = Docker::Topo::RmCommand.new name, config, options
      break unless docker_wrapper.x(command)
    end
  end

  def run
    docker_wrapper = Docker::Topo::Wrapper.new options
    puts @images.inspect
    @images.each do |name,config|
      command = Docker::Topo::RunCommand.new name, config, options
      break unless docker_wrapper.x(command)
    end
  end

  def start
    docker_wrapper = Docker::Topo::Wrapper.new options
    @images.each do |name, config|
      command = Docker::Topo::StartCommand.new name, config, options
      break unless docker_wrapper.x( command )
    end
  end
end
