import consumer from "./consumer"

const channel = consumer.subscriptions.create("UserChannel", {
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
      body: msg,
      code: location.pathname.substring(3)
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

const resizeTextarea = function(evt) {
  if (!evt.target.classList.contains("expanding-textarea")) { return }

  const form = q(".message-form")
  form.style.height = "0px"
  form.style.height = (evt.target.scrollHeight + 20) + "px"

  const messages = q(".messages")
  const should_scroll = isScrolledToBottom()
  messages.style.paddingBottom = form.style.height
  if (should_scroll) { scrollToBottom() }
}

const isScrolledToBottom = function() {
  const conversation = q(".conversation")

  return conversation.scrollTop + conversation.clientHeight >= conversation.scrollHeight
}

const scrollToBottom = function() {
  q(".conversation").scrollTo(0, q(".conversation").scrollHeight)
}

document.addEventListener("keydown", resizeTextarea)
document.addEventListener("keyup", resizeTextarea)
document.addEventListener("keypress", resizeTextarea)

document.addEventListener("DOMContentLoaded", function(event) {
  scrollToBottom()
})
