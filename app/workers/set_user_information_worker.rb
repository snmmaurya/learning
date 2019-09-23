class SetUserInformationWorker
  include Sidekiq::Worker

  after_perform :finally_finish

  def perform
    
  end

  private
    def finally_finish
      binding.pry
    end
end