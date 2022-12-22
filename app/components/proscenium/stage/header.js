const rootPath = document.getElementsByName("root-path")[0].content
const select = document.querySelector("#componentSelect")
if (select) {
  select.addEventListener("change", (event) => {
    if (event.target.value) {
      window.location = `${rootPath}components/${event.target.value}`
    } else {
      window.location = "/"
    }
  })
}
