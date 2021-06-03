
const dynamicPrice = () => {
  const form = document.querySelector("#new_booking");
  if (form) {
    form.addEventListener( "change", (event) => {
      // let startYear = document.querySelector("#booking_start_date_1i").value;
      const startDate = new Date ( document.querySelector("#booking_start_date").value);
      const endDate = new Date ( document.querySelector("#booking_end_date").value);
      const numberOfDays = (endDate - startDate) / (1000*60*60*24)
      const price = document.querySelector('#watch_price').innerText;
      const total_price = price * numberOfDays;
      const button = document.querySelector('#js-button');
      if(numberOfDays > 0) {
        button.value = `Book Watch for £${total_price}`;
        button.disabled = false;
      } else {
        button.value = `Select dates for price`;
        button.disabled = true;
      }
    });
  }
};


export { dynamicPrice };
