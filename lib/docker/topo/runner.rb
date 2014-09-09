require "yaml"

class Docker::Topo::Runner
  attr_accessor :images, :repositories
  
  def initialize(path)
    config = ::YAML.load_file(path)
    puts config["images"]
    @images = Docker::Topo::TSortableImages.new.merge! config["images"]
    puts @images
    @images.tsort
    puts @images
    repositories = config["repositories"]
  end
  
  def run
    docker_wrapper = Docker::Topo::Wrapper.new
    puts @images.inspect
    @images.each do |name,config|		 
      command = Docker::Topo::RunCommand.new name, config
      break unless docker_wrapper.x(command)
    end
  end
end
