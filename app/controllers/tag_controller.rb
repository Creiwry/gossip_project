
class TagsController

  def index
  end

  def self.show(gossip_id)
    tag_ids = []
    TagOfGossip.where(gossip_id:,).all.each do |relation|
      tag_ids << relation.tag_id
    end
    tags = []
    tag_ids.each do |id|
      tags << Tag.find(id).title
    end
    return tags
  end

  def new
  end

  def self.create(gossip_id, tag_id)
    @tag_of_gossip = TagOfGossip.new(gossip_id: gossip_id, tag_id: tag_id)

    if @tag_of_gossip.save
      puts '$' * 10
      puts "saved tag"
      puts '$' * 10
      return true
    else
      puts '$' * 10
      puts "didn't save tag"
      puts '$' * 10
      return false
    end

  end

  def edit
  end

  def self.update(gossip_id, tag_id)
    # if TagOfGossip.where(gossip_id: gossip_id && tag_id: tag_id).exists?
    #   @tag_of_gossip = TagOfGossip.where(gossip_id: gossip_id)
    #   puts '$' * 10
    #   puts @tag_of_gossip.to_s
    #   puts '$' * 10
    #   if @tag_of_gossip.update(gossip_id: gossip_id, tag_id: tag_id)
    #     puts '$' * 10
    #     puts "saved tag"
    #     puts '$' * 10
    #     return true
    #   else
    #     return false
    #   end
    # else
    #   self.create(gossip_id, tag_id)
    # end

  end

  def self.destroy(gossip_id, tag_id)
    tag = TagOfGossip.find_by()

  end

  private
  def tags
    tags = Tag.all
  end

end
