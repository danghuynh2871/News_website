(function() {
    'use strict';

    var tinyslider = function() {
        var el = document.querySelectorAll('.testimonial-slider');

        if (el.length > 0) {
            var slider = tns({
                container: '.testimonial-slider',
                items: 1,
                axis: "horizontal",
                controlsContainer: "#testimonial-nav",
                swipeAngle: false,
                speed: 700,
                nav: true,
                controls: true,
                autoplay: true,
                autoplayHoverPause: true,
                autoplayTimeout: 3500,
                autoplayButtonOutput: false
            });
        }
    };
    tinyslider();

    // Enhanced header effects
    var headerEffects = function() {
        const header = document.querySelector('.header');
        const navLinks = document.querySelectorAll('.nav-menu a');
        const blogName = document.querySelector('.blog-name');
        
        // Scroll effect for header
        window.addEventListener('scroll', () => {
            if (window.scrollY > 50) {
                header.classList.add('scrolled');
            } else {
                header.classList.remove('scrolled');
            }
        });

        // Blog name hover effect with glow
        blogName.addEventListener('mouseenter', function() {
            this.style.transform = 'scale(1.05) rotate(-2deg)';
            this.style.textShadow = '0 0 15px rgba(0, 123, 255, 0.5)';
        });
        
        blogName.addEventListener('mouseleave', function() {
            this.style.transform = 'scale(1) rotate(0)';
            this.style.textShadow = 'none';
        });

        if(navLinks.length > 0) {
            navLinks.forEach(link => {
                // Enhanced hover effect with multiple transitions
                link.addEventListener('mouseenter', function() {
                    this.style.transform = 'translateY(-3px) scale(1.1)';
                    this.style.color = '#007bff';
                    this.style.opacity = '1';
                    this.style.textShadow = '0 2px 8px rgba(0, 123, 255, 0.3)';
                    this.style.transition = 'all 0.3s cubic-bezier(0.175, 0.885, 0.32, 1.275)';
                    
                    // Add floating animation
                    this.style.animation = 'float 1s ease-in-out infinite';
                });
                
                link.addEventListener('mouseleave', function() {
                    this.style.transform = 'translateY(0) scale(1)';
                    this.style.color = '';
                    this.style.textShadow = 'none';
                    this.style.animation = 'none';
                    if(!this.classList.contains('active')) {
                        this.style.opacity = '0.7';
                    }
                });
                
                // Enhanced click effect with ripple and flash
                link.addEventListener('click', function(e) {
                    e.preventDefault();
                    
                    // Flash effect
                    this.style.backgroundColor = 'rgba(0, 123, 255, 0.1)';
                    this.style.borderRadius = '4px';
                    
                    // Enhanced ripple effect
                    const ripple = document.createElement('span');
                    ripple.className = 'ripple';
                    ripple.style.background = 'radial-gradient(circle, rgba(255,255,255,0.7) 0%, rgba(0,123,255,0.3) 100%)';
                    this.appendChild(ripple);
                    
                    const rect = this.getBoundingClientRect();
                    const size = Math.max(rect.width, rect.height) * 2;
                    ripple.style.width = ripple.style.height = `${size}px`;
                    ripple.style.left = `${e.clientX - rect.left - size/2}px`;
                    ripple.style.top = `${e.clientY - rect.top - size/2}px`;
                    
                    // Remove ripple and reset background
                    ripple.addEventListener('animationend', () => {
                        ripple.remove();
                        this.style.backgroundColor = '';
                    });
                    
                    // Update active state with transition
                    navLinks.forEach(item => {
                        item.classList.remove('active');
                        item.style.opacity = '0.7';
                        item.style.transform = 'translateY(0) scale(1)';
                    });
                    
                    this.classList.add('active');
                    this.style.opacity = '1';
                    this.style.transform = 'translateY(-3px) scale(1.1)';
                    
                    // Navigate after animation
                    setTimeout(() => {
                        window.location.href = this.getAttribute('href');
                    }, 300);
                });
            });
        }

        // Add floating animation keyframes
        if (!document.querySelector('#linkAnimations')) {
            const style = document.createElement('style');
            style.id = 'linkAnimations';
            style.textContent = `
                @keyframes float {
                    0%, 100% { transform: translateY(-3px) scale(1.1); }
                    50% { transform: translateY(-5px) scale(1.1); }
                }
                @keyframes ripple {
                    from {
                        transform: scale(0);
                        opacity: 1;
                    }
                    to {
                        transform: scale(1);
                        opacity: 0;
                    }
                }
            `;
            document.head.appendChild(style);
        }
    };
    headerEffects();

    var sitePlusMinus = function() {

        var value,
            quantity = document.getElementsByClassName('quantity-container');

        function createBindings(quantityContainer) {
          var quantityAmount = quantityContainer.getElementsByClassName('quantity-amount')[0];
          var increase = quantityContainer.getElementsByClassName('increase')[0];
          var decrease = quantityContainer.getElementsByClassName('decrease')[0];
          increase.addEventListener('click', function (e) { increaseValue(e, quantityAmount); });
          decrease.addEventListener('click', function (e) { decreaseValue(e, quantityAmount); });
        }

        function init() {
            for (var i = 0; i < quantity.length; i++ ) {
                    createBindings(quantity[i]);
            }
        };

        function increaseValue(event, quantityAmount) {
            value = parseInt(quantityAmount.value, 10);

            console.log(quantityAmount, quantityAmount.value);

            value = isNaN(value) ? 0 : value;
            value++;
            quantityAmount.value = value;
        }

        function decreaseValue(event, quantityAmount) {
            value = parseInt(quantityAmount.value, 10);

            value = isNaN(value) ? 0 : value;
            if (value > 0) value--;

            quantityAmount.value = value;
        }
        
        init();
		
    };
    sitePlusMinus();


})()

(function() {
    'use strict';

    // Slider functionality
    const sliderInit = function() {
        const slides = document.querySelectorAll('.slide');
        const prevBtn = document.querySelector('.prev');
        const nextBtn = document.querySelector('.next');
        let currentSlide = 0;

        // Hide all slides except first
        slides.forEach((slide, index) => {
            if(index !== 0) {
                slide.style.opacity = '0';
                slide.style.display = 'none';
            }
        });

        // Next slide function
        const nextSlide = () => {
            slides[currentSlide].style.opacity = '0';
            setTimeout(() => {
                slides[currentSlide].style.display = 'none';
                currentSlide = (currentSlide + 1) % slides.length;
                slides[currentSlide].style.display = 'block';
                setTimeout(() => {
                    slides[currentSlide].style.opacity = '1';
                }, 50);
            }, 400);
        };

        // Previous slide function
        const prevSlide = () => {
            slides[currentSlide].style.opacity = '0';
            setTimeout(() => {
                slides[currentSlide].style.display = 'none';
                currentSlide = (currentSlide - 1 + slides.length) % slides.length;
                slides[currentSlide].style.display = 'block';
                setTimeout(() => {
                    slides[currentSlide].style.opacity = '1';
                }, 50);
            }, 400);
        };

        // Event listeners
        nextBtn.addEventListener('click', nextSlide);
        prevBtn.addEventListener('click', prevSlide);

        // Auto slide
        setInterval(nextSlide, 5000);
    };

    // Animate posts on scroll
    const animateOnScroll = function() {
        const posts = document.querySelectorAll('.post');
        
        const observer = new IntersectionObserver((entries) => {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    entry.target.classList.add('fade-in-up');
                }
            });
        }, {
            threshold: 0.1
        });

        posts.forEach(post => {
            observer.observe(post);
        });
    };

    // Initialize all functions
    sliderInit();
    animateOnScroll();
    
})();