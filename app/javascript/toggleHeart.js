document.addEventListener("DOMContentLoaded", function() {
  const heartIcons = document.querySelectorAll('.heart-icon');

  heartIcons.forEach(heart => {
    heart.addEventListener('click', function() {
      this.classList.toggle('fa-regular');
      this.classList.toggle('fa-solid');
    });
  });
});
