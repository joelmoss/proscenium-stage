import init from "bundle:@proscenium/component-manager"
import RAILS_ENV from "env:RAILS_ENV"

init({
  debug: RAILS_ENV === "development",
  buildComponentPath(comp) {
    return `${comp}/preview.jsx`
  }
})
