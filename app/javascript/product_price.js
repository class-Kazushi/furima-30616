window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price")
    const numberWithComma = new Intl.NumberFormat();
    addTaxDom.innerHTML = numberWithComma.format(Math.floor(inputValue * 0.1))
    const productProfit = document.getElementById("profit")
    productProfit.innerHTML = numberWithComma.format(inputValue - Math.floor(inputValue * 0.1))
  })
});
