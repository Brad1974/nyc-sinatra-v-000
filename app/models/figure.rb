class Figure <ActiveRecord::Base
  has_many :landmarks
  has_many :figure_titles
  has_many :titles, through: :figure_titles


  def new_landmark=(name)
    newlandmark = Landmark.find_or_create_by(:name => name)
    if !name.empty?
      self.landmarks << newlandmark
    end
  end

  def new_title=(name)
    newtitle = Title.find_or_create_by(:name => name)
    if !name.empty?
      self.titles << newtitle
    end
  end
  
end