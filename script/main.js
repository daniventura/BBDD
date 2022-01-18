const sliders = document.querySelectorAll(".fade");

const triggerCabecera = document.querySelector(".lower_cabecera_img");
const tituloCabecera = document.querySelector(".titulo_box");

const appearOptions = {
  threshold: 0,
  rootMargin: "0px 0px -100px 0px"
};

const cabeceraOptions = {
  threshold: 0,
  rootMargin: "0px 0px -100px 0px"
};

const appearOnScroll = new IntersectionObserver(function(
  entries,
  appearOnScroll
) {
  entries.forEach(entry => {
    if (!entry.isIntersecting) {
      return;
    } else {
      entry.target.classList.add("appear");
      appearOnScroll.unobserve(entry.target);
    }
  });
},
appearOptions);

const efectoCabecera = new IntersectionObserver(function(
  entries,
  efectoCabecera
) {
  entries.forEach(entry => {
    if (!entry.isIntersecting) {
      return;
    } else {
      tituloCabecera.classList.add("liquidado");
    }
  });
},
cabeceraOptions);


sliders.forEach(slider => {
  appearOnScroll.observe(slider);
});

efectoCabecera.observe(triggerCabecera);



