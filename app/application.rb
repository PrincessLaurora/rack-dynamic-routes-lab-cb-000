class Application

  @@items = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/item/)
      item_name = req.path.split("/item/").last
      if item = @@items.find{|item| item.name == item_name}
      resp.write item.price
    else
      resp.write "Route not found"
      resp.status = 404
      end
    end

    resp.finish
  end
end
