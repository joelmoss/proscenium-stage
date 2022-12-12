import init from "@proscenium/component-manager?bundle-all"
import RAILS_ENV from "env:RAILS_ENV"

init({
  debug: RAILS_ENV === "development",
  buildComponentPath(comp) {
    return `${comp}/preview.jsx`
  }
})
