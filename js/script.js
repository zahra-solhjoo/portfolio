
const topBtn=document.getElementById('topBtn');
window.addEventListener('scroll',()=>{
 if(topBtn) topBtn.style.display=window.pageYOffset>300?'block':'none';
});
if(topBtn){
 topBtn.addEventListener('click',()=>window.scrollTo({top:0,behavior:'smooth'}));
}
