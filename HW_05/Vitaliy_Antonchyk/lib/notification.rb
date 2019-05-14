# describes Notification
class Notification
  attr_reader :attached, :read_status, :from,
              :to, :body

  def initialize(from:, to:, body:, attached: nil)
    @from = from
    @to = to
    @body = body
    @attached = attached
    @read_status = false
  end

  def read!
    @read_status = true
    self
  end

  def to_s
    "From: #{@from}
      To: #{@to}
      Body: #{@body}
      Attached: #{@attached.class}#{@attached}
      Read? #{@read_status}"
  end
end
