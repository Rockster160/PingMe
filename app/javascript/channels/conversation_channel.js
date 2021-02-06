import consumer from "./consumer"

const channel = consumer.subscriptions.create({
  channel: "ConversationChannel",
  code: location.pathname.substring(3)
}, {
  connected() {
    console.log("connected");
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    console.log("disconnected");
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    console.log("received data", data);
    q(".conversation .messages").innerHTML = q(".conversation .messages").innerHTML + data.html
  },

  speak(msg) {
    return this.perform("speak", {
      body: msg
    })
  }
});

document.addEventListener("keydown", function(evt) {
  if (evt.keyCode == 13 && (evt.metaKey || evt.ctrlKey)) { // CMD+Enter || ctrl+Enter
    const form = evt.target.closest("form.message-form")
    if (!form) { return }

    evt.preventDefault()
    const input = form.querySelector("textarea[name=body]")

    if (input.value.trim().length > 0) {
      // TODO: Add a pending message
      channel.speak(input.value)
    }

    input.value = ""
  }
})
