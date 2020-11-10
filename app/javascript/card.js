const pay = () => {
  Payjp.setPublicKey("pk_test_e10e4c24f08bb53ed1a5dff6")
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    e.preventDefault();

    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("transaction[number]"),
      exp_month: formData.get("transaction[exp_month]"),
      exp_year: `20${formData.get("transaction[exp_year]")}`,
      cvc: formData.get("transaction[cvc]")
    };

    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        console.log(token)
      }
    });
  });
};

window.addEventListener("load", pay);