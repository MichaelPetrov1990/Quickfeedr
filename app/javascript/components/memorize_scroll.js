  const memorizeScroll = () => {
 document.addEventListener("turbolinks:before-visit", function(event) {
  if (document.querySelector(".job-all")) {
    Turbolinks.savedScrolls = {
      [window.location.href]: {
        document: document.documentElement.scrollTop,
        body: document.body.scrollTop
      }
    }
  }
});
document.addEventListener("turbolinks:render", function(event) {
  const savedScroll = Turbolinks.savedScrolls[window.location.href]
  if (!savedScroll) { return; }
  delete(Turbolinks.savedScrolls[window.location.href])
  if (savedScroll.document != null) {
    if (savedScroll.document < document.documentElement.scrollHeight) {
      document.documentElement.scrollTop = savedScroll.document
    }
  }
  if (savedScroll.document != null) {
    if (savedScroll.body < document.body.scrollHeight) {
      document.body.scrollTop = savedScroll.body
    }
  }
});
};

export {memorizeScroll}
