window.addEventListener('load', () => {
//価格情報の取得
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    // 販売手数料情報の取得
    const addTaxDom = document.getElementById('add-tax-price');
    addTaxDom.innerHTML = Math.floor(inputValue * 0.1);
    // 販売利益情報の取得
    const profitDom = document.getElementById('profit');
    profitDom.innerHTML = Math.floor(inputValue - addTaxDom.innerHTML);
  });
});