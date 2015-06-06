$(document).ready( function() {
  window.setTimeout(function() {
    try {
        window.webkit.messageHandlers.callbackHandler.postMessage("Console://fuck");
    } catch(err) {
        console.log('The native context does not exist yet');
    }
  }, 500);
});