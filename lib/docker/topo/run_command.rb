class Docker::Topo::RunCommand
  attr_accessor :action
  attr_accessor :links
  attr_accessor :volumes
  attr_accessor :image
  attr_accessor :name

  def initialize(name, config)
    @action = "run -d"
    @links = config["links"]
    @volumes = config["volumes"]
    @image = config["image"]
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

  def exploded_volumes
    if volumes
      volumes.map {|source,target| "--volume #{source}:#{target}" }.join " "
    else
      ""
    end
  end
end
