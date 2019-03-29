function start(){
  var app = Elm.Arabi.init({
    node: document.getElementById('main')
  });
  app.ports.copyToClip.subscribe(function(data) {
    copyTextToClipboard(data);
  });
  app.ports.resetFocus.subscribe(function(data) {
    document.getElementById("entree").focus();
  });
}
