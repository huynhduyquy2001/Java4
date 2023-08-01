const cards = document.querySelectorAll('.card')
const images = document.querySelectorAll('img[data-src]')

const observer = new IntersectionObserver(entries => {
    entries.forEach(entry => {
        const { target } = entry;
        target.classList.toggle('active', entry.isIntersecting)
    })
}, {})

cards.forEach(card => {
    observer.observe(card)
})

const imageObserver = new IntersectionObserver(entries => {
    entries.forEach(entry => {
        const { target } = entry; // ES6
        const src = target.getAttribute('data-src')
        if (src && entry.isIntersecting) {
            target.setAttribute('src', src)
            target.style.minHeight = 'auto'
            target.style.opacity = 1
            imageObserver.unobserve(target)
        }
    })
}, {
    rootMargin: "-150px"
})

images.forEach(image => {
    imageObserver.observe(image)
})