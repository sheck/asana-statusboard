require 'rubygems'

require 'json'
require 'net/https'
require 'open-uri'
require 'openssl'

require 'sinatra'
require 'haml'
require 'sass'


def asana(url)
  uri = URI.parse("https://app.asana.com/api/1.0/" + url)
  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = true
  http.verify_mode = OpenSSL::SSL::VERIFY_PEER
  header = {
    "Content-Type" => "application/json"
  }
  req = Net::HTTP::Get.new(uri.path, header)
  req.basic_auth(@@api_key, '')
  return http.start { |http| http.request(req) }
end

def asanaprojects(workspace_id)
  all_projects = []
  all_res = []

  res = asana("workspaces/" + workspace_id + "/projects")
  body = JSON.parse(res.body)

  if body['errors'] then
    puts "Server returned an error: #{body['errors'][0]['message']}"
  else
    # put all project IDs in an array
    body.fetch("data").each do |projects|
      all_projects.push(projects.fetch("id"))
    end

    all_projects.each do |project|
      r = asana("projects/" + project.to_s)
      rr = JSON.parse(r.body)
      rrr = rr.fetch("data")
      # if rrr.fetch("archived") == false
        all_res.push(rrr)
      # end
    end
    return all_res
  end
end

get '/:api_key/:workspace_id' do
  @@api_key = params[:api_key]
  workspace_id = params[:workspace_id]
  @projects = asanaprojects(workspace_id)
  haml :index, :format => :html5
end