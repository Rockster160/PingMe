# PingMe App

## Premise

- Create QrCodes that can be printed and placed in various places.
- Anybody that finds the Qr can scan it to send you a message.
- These messages are private - no identifiable information is shared between users unless they choose to do so.
- You can make as many codes as you want and manage them- recommended to use a different code per location, but you're free to use the same for all of them as well.
- You can add a username for yourself, but by default usernames are not shown to users you talk to. On a per-conversation basis, you can unlock your username. OR! Simply have an alias per conversation.

## Monetization

The entire platform is reasonably free- for basic cases, you don't ever NEED to pay.

- Unobtrusive ads can be placed on the conversation pages. An owner can pay to remove ads from all of their conversations (for both the owner and guest) - a guest who has a paid account will also not see ads on other conversations they view.
- Slack/Notion like- only X number of messages are saved/searchable. After reaching that point, messages are deleted in a FIFO basis.
- MMS- Only premium users can receive MMS messages. (Alternative- just count an image as 100 regular messages or something similar, or have a short expiry time, etc, etc.) (Alternative - Non-paid accounts have to have a click-to-show image)

## Authentication

Use OTP when registering/signing in rather than storing a password. Multiple auth strategies can be added to your account. Whichever strategy is used while signing in, send the notification through that channel. (Sign in with phone number sends and sms, sign in with email address sends an email)

Eventually allow for other messaging/notification platforms, but require at least sms or phone number as a base. (Slack, Discord, Line Chat, WhatsApp, anything with a notifiable API)

Always track IP/location/timestamp on log in.

## Notifications

By default, whatever communication method provided (email / sms) is used as the notification.

Notify immediately on first incoming message.

After initial response is sent, have a set delay to avoid sending unnecessary SMS.

Notifications can be customized to only send at certain times of the day.

Can set up fallback notifications - if I don't open the SMS within [X minutes] send a notification to my email instead.

These should be easy to change- if I lose my phone I should easily be able to change from an SMS notification to an email one.

## Examples

- In your car: if somebody damages your car they can scan to send you insurance info. If you're parked blocking somebody in, they can scan to ask you to move your car without it being towed.
- On your phone/keys/wallet: Fast and easy way to contact you to return your property.
- On your front door: Solicitors can send you a message with their offer. You can choose to simply ignore it. 😉 Could also be used by neighbors to alert you of an upcoming issue, let you know about a concern or otherwise.
- A bathroom stall for hookups.

## Objects

### Owner

A registered user, referenced by this term as the person who created the QR Code.

### Guest

A guest user/account is created automatically (stores as a session cookie) when somebody scans a code. No sign up necessary, however, they can opt to leave their email address or sms-able phone number to receive notifications when/if an owner responds to their message. The owner will NOT be able to view this information.

They can choose to register (email+password) at any time to be able to revisit conversations on other devices and create their own codes.

### QrCode

`private_name` - Name visible only to owner

`private_description` - Description visible only to owner (Suggested to be the location of the code)

`public_name` - Title of the page shown when a guest scans the code

`public_description` - Description shown to the guest when they scan the code

Can be exported to multiple formats (PNG, SVG, surface, etc...)

Tracks view count and where the views came from (ip, user agent, timestamps, etc) (Unique by IP/user)

Can be disabled so users scanning the code will no longer be able to start a conversation (Existing conversations can still continue)

[2-4]-[2-5] alphanum chars

Show human readable code on QR image for manual typing- if needed

### Conversation

Attached to a QR code (Which one was scanned to start the conversation)

Stores messages sent between owner and guest.

### Message

Text from an author (owner or guest) sent to a conversation.

Likely going to add media support, but probably not MVP.

Also tracks when/if the message was read.

## Pages

### Landing Page

Title, some descriptions about the app, CTA to create an account and get started

### Account

- Login
- Sign up / Register
- Forgot Password / Password reset
- Error (404, 500, disabled code, etc...)

### Dashboard

Main summary of everything, ability to manage all of the things.

- Create new Codes
- View all current codes, probably in table format.
    - View count (Unique per IP)
    - Private Title / Custom Name
    - Private Description
- View all current conversations (split inbound and outbound? - Have some sort of separation of these for clarity)

### Conversation

Shows the conversation and public title/description (if applicable)

Allows for sending messages (duh)

Either side should be able to remove themselves from the conversation- no longer receiving notifications of updates.

Owner can "ban" a guest- preventing them from sending any more messages to ANY code that belongs to the owner.

## Design

![https://cdn.discordapp.com/attachments/353629941176467457/793018893542752266/unknown.png](https://cdn.discordapp.com/attachments/353629941176467457/793018893542752266/unknown.png)

![https://cdn.discordapp.com/attachments/353629941176467457/793270174756503582/unknown.png](https://cdn.discordapp.com/attachments/353629941176467457/793270174756503582/unknown.png)

![https://cdn.discordapp.com/attachments/353629941176467457/793036837353947156/unknown.png](https://cdn.discordapp.com/attachments/353629941176467457/793036837353947156/unknown.png)
