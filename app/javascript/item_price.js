function price() {
  const priceInput = document.getElementById("item-price");

   priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const Tax = 0.1;
    const itemTax = Math.floor(inputValue * Tax);
    const itemTaxRem = Math.ceil((inputValue) - (inputValue  * Tax));

    function comma(num) {
      return String(num).replace( /(\d)(?=(\d\d\d)+(?!\d))/g, '$1,');
  }

    const taxPrice = document.getElementById("add-tax-price");
    taxPrice.innerHTML = `
     <span id="add-tax-price">${comma(itemTax)}</span>
     `;

     const profitPrice = document.getElementById("profit");
     profitPrice.innerHTML = `
     <span id="profit">${comma(itemTaxRem)}</span>
     `;
   })
}
window.addEventListener("load", price);