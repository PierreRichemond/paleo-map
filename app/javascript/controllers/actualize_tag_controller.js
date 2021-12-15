import { Controller } from "stimulus";
import { initMapbox } from "../plugins/init_mapbox";

export default class extends Controller {
  static targets = [];


  send(event) {
    // console.log(imageTarget);
    event.preventDefault();
    const url = event.target.href

    fetch(url, {
      method: 'GET',
      headers: { 'Accept': "application/json", 'Content-Type': 'application/json' }
    })
    .then(response => response.json())
    .then((data) => {
      console.log(data)
      const activeTags = document.querySelectorAll('.active-btn')
      activeTags.forEach(otherTag => {
        otherTag.classList.remove("active-btn")
      })
      const tag = document.getElementById(`tag-${data.tag}`)
      tag.classList.add("active-btn")
      // debugger
      document.getElementById('image').setAttribute('src', data.image)
      console.log(document.getElementById('image'))

      document.getElementById('map').setAttribute('data-markers', JSON.stringify(data.json_markers))
      initMapbox();
    });
  }
}
