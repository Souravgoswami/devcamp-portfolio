import { Controller } from "stimulus"
import Sortable from 'sortablejs'
import Rails from '@rails/ujs'

export default class extends Controller {
  static targets = [ "output" ]

  connect() {
    // this.outputTarget.textContent = 'Hello, Stimulus!'

    this.sortable = Sortable.create(this.element, {
      onEnd: this.end.bind(this)
    })
  }

  end(event) {
    console.log(event)
    let data = new FormData()
    let id = event.item.dataset.id

    data.append('position', event.newIndex + 1)

    Rails.ajax({
      // url: this.data.get('url').replace(':id', id),
      url: `${id}/move`,
      type: 'PATCH',
      data: data
    })

  }
}
