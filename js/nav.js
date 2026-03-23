// Mobile nav — injects hamburger button + backdrop, handles toggle
// Loaded on all pages that have a .sidebar

// Apply saved theme immediately to avoid flash
;(function () {
  if (localStorage.getItem('theme') === 'dark') {
    document.documentElement.setAttribute('data-theme', 'dark')
  }
})()

document.addEventListener('DOMContentLoaded', () => {
  if (!document.querySelector('.sidebar')) return

  // Hamburger button
  const btn = document.createElement('button')
  btn.id = 'nav-toggle'
  btn.setAttribute('aria-label', 'Toggle navigation')
  btn.innerHTML = `
    <span></span>
    <span></span>
    <span></span>
  `
  document.body.appendChild(btn)

  // Backdrop
  const backdrop = document.createElement('div')
  backdrop.id = 'nav-backdrop'
  document.body.appendChild(backdrop)

  function openNav() {
    document.body.classList.add('nav-open')
    btn.setAttribute('aria-expanded', 'true')
  }

  function closeNav() {
    document.body.classList.remove('nav-open')
    btn.setAttribute('aria-expanded', 'false')
  }

  btn.addEventListener('click', () => {
    document.body.classList.contains('nav-open') ? closeNav() : openNav()
  })

  backdrop.addEventListener('click', closeNav)

  // Close on nav link tap (mobile UX)
  document.querySelectorAll('.sidebar-links a').forEach(a => {
    a.addEventListener('click', closeNav)
  })

  // Close on Escape
  document.addEventListener('keydown', e => {
    if (e.key === 'Escape') closeNav()
  })

  // Dark mode toggle — inject before logout button
  const logoutBtn = document.getElementById('logout-btn')
  if (logoutBtn) {
    const darkBtn = document.createElement('button')
    darkBtn.className = 'btn-sign-out'
    const isDark = () => document.documentElement.getAttribute('data-theme') === 'dark'
    darkBtn.textContent = isDark() ? '☀ Light Mode' : '☾ Dark Mode'
    logoutBtn.parentNode.insertBefore(darkBtn, logoutBtn)
    darkBtn.addEventListener('click', () => {
      if (isDark()) {
        document.documentElement.removeAttribute('data-theme')
        localStorage.removeItem('theme')
      } else {
        document.documentElement.setAttribute('data-theme', 'dark')
        localStorage.setItem('theme', 'dark')
      }
      darkBtn.textContent = isDark() ? '☀ Light Mode' : '☾ Dark Mode'
    })
  }
})
