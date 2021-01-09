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
        card.style.backgroundImage = "url('/assets/workstation-4caf2d2ca3745cae381bfb19d2b0b0b6faf118aa5b2256edd4c2e46b6f7d7f39.png')";
      } else if (card.classList.contains('card-av-2')){
        card.style.backgroundImage = "url('/assets/internet-7169c063e29c2fee4826fd3cfb9432f333d6fdcb9f6d60e2faf98bfb56d2595e.png')";
      } else if (card.classList.contains('card-av-3')){
        card.style.backgroundImage = "url('./assets/worktogether-e30b9baffb85f6ec32786e371658d1da61186109bdb6458b87959f0b3d55ef4b.png')";
        // ref de l'img recuperee dans la dev tools console
      };
    }));
  texts.forEach(text =>
    text.addEventListener('mouseout', function(){
    text.classList.remove('text-visible');
    }));
};

export { changeCard };
