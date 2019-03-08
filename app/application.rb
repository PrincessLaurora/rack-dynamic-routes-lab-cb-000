class Application

  @@items = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/item/)
      item_name = req.path.split("/item/").last
      item = @@items.find{|item| item.name == item_name}
    end
    if @@items.include?(item.name)
      resp.write item.price
    else
      resp.write "Route not found"
      resp.status = 404
      end

    resp.finish
  end
end
