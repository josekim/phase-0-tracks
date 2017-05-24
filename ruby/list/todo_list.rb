class TodoList
  def initialize(list)
  @list = list
  end

  def get_items
  return @list
  end

  def add_item(item)
  @list << item
  end

  def delete_item(item)
    if @list.include?(item)
      @list.delete(item)
    end
  end

  def get_item(index)
    @list[index]
  end

end