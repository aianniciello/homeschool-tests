// Mobile nav — injects hamburger button + backdrop, handles toggle
// Loaded on all pages that have a .sidebar

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
})
