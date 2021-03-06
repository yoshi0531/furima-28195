window.addEventListener('load', function(){

  const priceInput = document.getElementById("item-price")

  priceInput.addEventListener('input', () => {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
    let rate = 0.1;
    const fee = inputValue * rate;
    addTaxDom.innerHTML = Math.floor(fee);
    const salesCommission = Math.floor(fee);
    const salesProfit = document.getElementById("profit");
    salesProfit.innerHTML = Math.floor(inputValue - salesCommission);
  })
})