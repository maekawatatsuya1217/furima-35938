const pay = () => {
    Payjp.setPublicKey("pk_test_b3e2e36e14df7f0c91e06547");
    const form = document.getElementById("charge-form");
    form.addEventListener("click", (e) =>{
        e.preventDefault();
        const formResult = document.getElementById("charge-form");
        const formData = new FormData(formResult);

        const card = {
            number: formData.get("donation_address[number]"),
            cvc: formData.get("donation_address[cvc]"),
            exp_month: formData.get("donation_address[exp_month]"),
            exp_year: `20${formData.get("donation_address[exp_year]")}`,
        };

        Payjp.createToken(card, (status, response) => {
            if (status == 200) {
              const token = response.id;
              console.log(token)
            }
        });
    })
};
window.addEventListener("load", pay);