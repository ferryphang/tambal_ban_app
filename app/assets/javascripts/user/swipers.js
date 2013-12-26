var sliderSwiper = new Swiper('#slider-swiper',{
	loop: true,
	grabCursor: true,
	calculateHeight: true,
	autoResize: true,
	autoplay: 5000
});

// Height fix for responsive swipers when orieantation changes
$(window).resize(function(){
	sliderSwiper.reInit();
});

var gallerySwiper = new Swiper('#gallery-swiper',{
	grabCursor: true,
	calculateHeight: true,
	freeMode: true,
	freeModeFluid: true,
	slidesPerView: 'auto',
	scrollbar: {
		container :'#gallery-swiper-scrollbar',
		hide: false,
		draggable: true  
	}
});