# = Execution of docker start
#
# Execute a docker start command based on the supplied name
class Docker::Topo::StartCommand

  attr_accessor :action, :name

  # Build a new StartCommand
  # Only needs the name
  def initialize(name, config, options)
    @action = "start"
    @name = name
  end

  def to_s
    "#{action} #{name}"
  end

end
