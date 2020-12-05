window.addEventListener('load', function(){

  const priceInput = document.getElementById("item-price")

  priceInput.addEventListener('input', () => {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
    let tax = 0.1;
    const salesCommission = inputValue * tax;
    addTaxDom.innerHTML = Math.floor(salesCommission);
    const salesProfit = document.getElementById("profit");
    salesProfit.innerHTML = Math.floor(inputValue - salesCommission);
  })
})