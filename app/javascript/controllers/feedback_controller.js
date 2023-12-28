
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  submitForm(event) {
   
    let feedback = document.getElementById('feed_feedback').value

    let feedbackContainer = document.getElementById("feedbackId")
    let feedDiv = document.createElement('div')
    feedDiv.classList.add("d-flex", "justify-content-between","align-items-center")
    console.log("Form submitted!");
    // fetch("/feedbacks", {
    //   methods: "POST",
    //   body: JSON.stringify({

    //   })
    // }
    // )
    feedDiv.innerHTML = `<p class='mb-0 text-start p-2'><strong class='me-3'>User:</strong>${feedback}</p>
    <a href="#" data-turbo-action="replace" data-turbo-frame="feedbacks" class="badge bg-danger">delete</a>`
    feedbackContainer.appendChild(feedDiv)
  }

}
