class Horse < Animal

  before_create :call_me_before_create
  before_save :call_me_before_save


  def call_me_before_save
    puts "call_me_before_save"
  end

  def call_me_before_create
    puts "call_me_before_create"
  end
end