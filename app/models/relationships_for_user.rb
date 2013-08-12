module RelationshipsForUsers
  def self.included(base)
    base.after_initialize :set_relationship_for_users
  end

  def relationship_for_user(user)
    @relationship_for_user[user.id] ||= if relationships.loaded?
      relationships.detect{|r| r.user_id == user.id}
    else
      relationships.where(:relationships => {:user_id => user.id})
    end
  end

  private
    def set_relationship_for_users
      @relationship_for_user ||= {}
    end
end