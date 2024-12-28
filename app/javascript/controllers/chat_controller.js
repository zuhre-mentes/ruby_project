import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["input"]

  submit(event) {
    event.preventDefault()
    const message = this.inputTarget.value
    
    fetch('/api/chat', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').content
      },
      body: JSON.stringify({ message: message })
    })
    .then(response => response.json())
    .then(data => {
      this.addMessage(message, 'user')
      this.addMessage(data.message, 'ai')
      this.inputTarget.value = ''
    })
  }

  addMessage(content, type) {
    const messagesContainer = document.getElementById('chat-messages')
    const messageDiv = document.createElement('div')
    messageDiv.className = `p-4 rounded-lg ${type === 'user' ? 'bg-indigo-100 ml-12' : 'bg-gray-100 mr-12'}`
    messageDiv.textContent = content
    messagesContainer.appendChild(messageDiv)
    messagesContainer.scrollTop = messagesContainer.scrollHeight
  }
} 