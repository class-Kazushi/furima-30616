import consumer from "./consumer"

consumer.subscriptions.create("CommentChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    const html = `<p>${data.user.nickname}: ${data.content.text}</p>`;
    const comments = document.getElementById('comment-show');
    const newComment = document.getElementById('comment_text');
    const inputSubmit = document.querySelector('input[name="commit"]');
    inputSubmit.disabled = false;
    comments.insertAdjacentHTML('afterbegin', html);
    newComment.value='';
  }
});
