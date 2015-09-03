navigator.accelerometer = {
  getCurrentAcceleration: function(onSuccess, onError) {
    Queue.push(Task.init(Queue.length, onSuccess, onError));
    window.webkit.messageHandlers.OOXX.postMessage({className: 'Accelerometer', functionName: 'getCurrentAcceleration', taskId: Queue.length - 1});
  }
}