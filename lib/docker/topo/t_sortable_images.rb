require "tsort"

class Docker::Topo::TSortableImages < Hash
  include TSort
  
  def tsort_each_node(&block)
    each_key(&block)
  end
  
  def tsort_each_child(node,&block)
    puts node
    if self[node].has_key? "links"
      self[node]["links"].keys.each(&block)
    else
      []
    end
  end
end

