const changeCard = () => {
  const cards = document.querySelectorAll('.card-av');
  const texts = document.querySelectorAll('.card-av-text');

  cards.forEach(card =>
    card.addEventListener('mouseover', function(){
    card.style.backgroundImage ='none';
    }));
  texts.forEach(text =>
    text.addEventListener('mouseover', function(){
    text.classList.add('text-visible');
    }));

  cards.forEach(card =>
    card.addEventListener('mouseout', function(){
      if (card.classList.contains('card-av-1')){
        card.style.backgroundImage = "url('./assets/workstation.png')";
      } else if (card.classList.contains('card-av-2')){
        card.style.backgroundImage = "url('./assets/internet.png')";
      } else if (card.classList.contains('card-av-3')){
        card.style.backgroundImage = "url('./assets/worktogether.png')";
      };
    }));
  texts.forEach(text =>
    text.addEventListener('mouseout', function(){
    text.classList.remove('text-visible');
    }));
};

export { changeCard };
