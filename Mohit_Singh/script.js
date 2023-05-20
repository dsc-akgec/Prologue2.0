const wrapper = document.querySelector('.wrapper');
const loginLink = document.querySelector('.login-link');
const registerLink = document.querySelector('.register-link');
const btnPopup = document.querySelector('.btnLogin-popup');
const closeButton = document.querySelector('.icon-close');
const textBox = document.querySelector('.text-box');
const loginForm = document.querySelector('.form-box.login');
const registerForm = document.querySelector('.form-box.register');

document.addEventListener('DOMContentLoaded', function()
{
  triggerElement.addEventListener('click', function() {
    textBox.style.display = 'none';
    loginForm.style.display = 'block';
  });
});

document.addEventListener('DOMContentLoaded', function() {
  btnPopup.addEventListener('click', function() {
    textBox.style.display = 'none';
    loginForm.style.display = 'block';
  });

  closeButton.addEventListener('click', function() {
    textBox.style.display = 'block';
    loginForm.style.display = 'none';
  });
});

registerLink.addEventListener('click', () => {
  wrapper.classList.add('active');
});

btnPopup.addEventListener('click', () => {
  wrapper.classList.add('active-popup');
});

closeButton.addEventListener('click', () => {
  wrapper.classList.remove('active-popup');
});

loginLink.addEventListener('click', () => {
  loginForm.style.transform = 'translateX(0)';
  registerForm.style.transform = 'translateX(400px)';
});

registerLink.addEventListener('click', () => {
  loginForm.style.transform = 'translateX(-400px)';
  registerForm.style.transform = 'translateX(0)';
});

setTimeout(function() {
  document.getElementById('div1').style.visibility = 'visible';
}, 1000);
