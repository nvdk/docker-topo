class Docker::Topo::RunCommand
  attr_accessor :action
  attr_accessor :links
  attr_accessor :volumes
  attr_accessor :image
  attr_accessor :name
  attr_accessor :env

  def initialize(name, config, options)
    @action = "run -d"
    @links = config["links"]
    @volumes = config["volumes"]
    @image = config["image"]
    @env = config["env"]
    @ports = config["ports"]
    @name = name
  end

  def to_s
    "#{action} --name #{name} #{exploded_links} #{exploded_volumes} #{image}"
  end

  def exploded_links
    if links
      links.map {|source,target| "--link #{source}:#{target}" }.join " "
    else
      ""
    end
  end

  def exploded_env
    if env
      env.map {|source,target| "-e #{source}=#{target}" }.join " "
    else
    end
  end

  def exploded_ports
    if ports
      ports.map {|source,target| "-p #{source}:#{target}" }.join " "
    else
      ""
    end
  end

  def exploded_volumes
    if volumes
      volumes.map {|source,target| "--volume #{source}:#{target}" }.join " "
    else
      ""
    end
  end
end
