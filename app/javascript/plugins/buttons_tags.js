const activeBtn = () => {
  const buttons = document.querySelectorAll(".tag-btn");
  buttons.forEach((button) => {
    button.classList.remove('active-btn');
    if (button.href === window.location.href) {
      button.classList.add('active-btn')
    }
  });
};

export { activeBtn };
