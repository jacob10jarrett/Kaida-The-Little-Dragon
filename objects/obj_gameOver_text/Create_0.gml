randomize();

messages = [
    "The kami disapprove.",
    "That's not how the story goes."
];

message_index = irandom(array_length_1d(messages) - 1);
current_message = messages[message_index];
