function item_price (){
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;

    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = Math.floor(inputValue * 0.1);
    const addProfit = document.getElementById("profit");
    addProfit.innerHTML = inputValue - addTaxDom.innerHTML;

});
};
window.addEventListener('load',item_price);


//