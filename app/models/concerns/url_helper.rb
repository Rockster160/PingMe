module UrlHelper
  def host
    url_opts = ActionMailer::Base.default_url_options
    port_str = url_opts[:host] == "localhost" ? ":#{url_opts[:port]}" : ""
    "#{url_opts[:protocol] || 'http'}://#{url_opts[:host]}#{port_str}"
  end

  def route_for(route_sym, params=nil, **opts)
    puts "obj: #{route_sym}"
    puts "params: #{params}"
    puts "opts: #{opts}"

    Rails.application.routes.url_helpers.send(route_sym, params, opts)
  end

  def url_for(obj, *params)
    route_for("#{obj}_url", params, host: host)
  end

  def path_for(obj, *params)
    route_for("#{obj}_path", params)
  end
end
