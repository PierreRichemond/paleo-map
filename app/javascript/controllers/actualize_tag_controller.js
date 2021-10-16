import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ['tags', 'map'];


  send(event) {
    // console.log(imageTarget);
    event.preventDefault();
    const href = event.target.href
    console.log(href)
    console.log(this.mapTarget)
    console.log(this.imageTarget)
    const markers = this.mapTarget.getAttribute('data-markers');
    const image = document.querySelector(".image")
    console.log(image)


      fetch(href, {
        method: 'GET',
        headers: { 'Accept': "application/json", 'Content-Type': 'application/json' }
      })
        .then(response => response.json())
        .then((data) => {
          console.log(data)

          this.imageTarget.outerHTML = data.image;
          this.markers.outerHTML = data.json_markers;
        });

}
}
