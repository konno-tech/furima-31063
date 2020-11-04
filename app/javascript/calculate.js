window.addEventListener('load', function(){

    const itemPrice = document.getElementById("item-price");
    itemPrice.addEventListener('input', () => {
      const price = itemPrice.value;
      const taxRate = 0.1;
      const taxPrice = Math.floor(price * taxRate);
      const profitPrice = Math.floor(price - taxPrice);

      // 販売手数料の表示機能
      const addTaxPrice = document.getElementById("add-tax-price");
      if (taxPrice >= 1){
        addTaxPrice.innerHTML = `${ taxPrice }`;
      }else{
        addTaxPrice.innerHTML = `${ 0 }`;
      }

      // 販売利益の表示機能
      const profit = document.getElementById("profit");
      if (profitPrice >= 1){
        profit.innerHTML = `${ profitPrice }`;
      }else{
        profit.innerHTML = `${ 0 }`;
      }

    });
    setInterval(check, 1000);
})
