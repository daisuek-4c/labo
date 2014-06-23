class DbInstance
  include ActiveModel::Model

  attr_accessor :process, :identifier, :dbName, :autoUpdate

  validates :identifier, presence: true, :if => Proc.new {self.process != "index"}

  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value) rescue nil
    end
  end

end
