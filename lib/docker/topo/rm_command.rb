# = Execution of docker rm
#
# Execute a docker rm command based on the supplied name
class Docker::Topo::RmCommand
  attr_accessor :action, :name, :force

  # Build a new RmCommand
  def initialize(name, config, options)
    @action = "rm"
    @name = name
    @force =  options[:force] ? "-f" : ""
  end
  
  def to_s
    "#{action} #{force} #{name}"
  end
end
