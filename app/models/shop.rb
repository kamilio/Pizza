class Shop
  def self.open?
    true
  end
  
  def self.closed?
    !open?
  end
end