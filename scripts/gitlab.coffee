module.exports = (robot) ->
  robot.router.post '/gitlab/ekQpEZPPC0dB85iTEmEtiEwwbV1ikAkIh1oh00LUbdhmsBvpZK', (req, res) ->
    channel = "dsp_dev_php"
    json = req.body
    if not json
      res.end ""
      return

    gitlab_event = "#{json.object_kind}" || 'push'

    if gitlab_event is "merge_request" and json.object_attributes.state is "opened"
      merge_request robot, json, channel

    if gitlab_event is "note" and json.object_attributes.noteable_type is "MergeRequest"
      comment robot, json, channel

    res.end()

merge_request = (robot, json, channel) ->
  title = "#{json.object_attributes.title}"
  description = "#{json.object_attributes.description}"
  update_time = "#{json.object_attributes.updated_at}"
  url = "#{json.object_attributes.url}"
  message = "Merge Request was created at #{update_time}.\n#{title}\n#{description}\n#{url}\nhttp://www.billoblog.com/wp-content/uploads/2009/09/cake1.jpg"
  envelope = {room: "#{channel}"}
  robot.send envelope, message

comment = (robot, json, channel) ->
  note = "#{json.object_attributes.note}"
  update_time = "#{json.object_attributes.updated_at}"
  url = "#{json.object_attributes.url}"
  message = "Merge Request add comment at #{update_time}.\n#{note}\n#{url}"
  envelope = {room: "#{channel}"}
  robot.send envelope, message
