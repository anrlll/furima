function item(){
  const ItemPrice = document.getElementById("item-price");
  ItemPrice.addEventListener("keyup" ,() =>{
    const tax = ItemPrice.value;
    const texid = document.getElementById("add-tax-price");
    const valueid = document.getElementById("profit");
    const cul = tax * 0.1;
    texid.innerHTML = cul;
    valueid.innerHTML = tax - cul;
  });
};

window.addEventListener("turbo:load", item)