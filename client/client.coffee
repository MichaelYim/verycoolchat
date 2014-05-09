Template.messagebox.messages= ->
  Template.input.events =
    'keydown input#message': (event) ->
      if event.which is 13  # 13 is the enter key event ok fine tyson
        if Meteor.user()
          name = Meteor.user().profile.name
        else
          name = 'Anonymous'
        message = document.getElementById 'message'

        if message.value != ''
          Messages.insert
            name: name
            message: message.value
            time: Date.now()


        document.getElementById 'message'.value = ''
        message.value = ''

  Messages.find {}, { sort: { time: -1 }}


