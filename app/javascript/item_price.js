window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price")
    addTaxDom.innerHTML =  Math.floor(0.1 * inputValue)
    const profit = document.getElementById("profit")
    profit.innerHTML = Math.floor(0.9 * inputValue)
  
  })
})

