const mooveImage = () => {
  const image = document.querySelector('.confirmation-content-image');
    function handleImage(){
      image.classList.add('moove');
    }
    if (image){
    window.addEventListener('load', handleImage);
  }
}
export { mooveImage };
