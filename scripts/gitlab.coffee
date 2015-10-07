module.exports = (robot) ->
	robot.router.post '/gitlab', (req, res) ->
		channel = "dsp_dev_php"
		json = req.body
		if not json
			res.end ""
			return

		gitlab_event = "#{json.object_kind}" || 'push'

		if gitlab_event is "merge_request" and json.object_attributes.state is "opened"
			merge_request json, channel

		res.end()

	merge_request = (json, channel) ->
		title = "#{json.object_attributes.title}"
		description = "#{json.object_attributes.description}"
		iid = "#{json.object_attributes.iid}"
		update_time = "#{json.object_attributes.updated_at}"
		namespace = "#{json.object_attributes.source.namespace}".toLowerCase()
		name = "#{json.object_attributes.source.name}".toLowerCase()
		url = "https://git.fs-site.net/#{namespace}/#{name}/merge_requests/#{iid}"  # replace your GitLab URL!
		message = """
		          Merge Request was created at #{update_time}.
		          #{title}
		          #{description}
		          #{url}
		          @eiji_kuwata: http://www.billoblog.com/wp-content/uploads/2009/09/cake1.jpg
		          """
    envelope = room: "#{channel}"
    robot.send envelope, message
		return
