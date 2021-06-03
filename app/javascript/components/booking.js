
const dynamicPrice = () => {
  const form = document.querySelector("#new_booking");
  if (form) {
    form.addEventListener( "change", (event) => {
      // let startYear = document.querySelector("#booking_start_date_1i").value;
      const startDate = new Date ( document.querySelector("#booking_start_date_1i").value, document.querySelector("#booking_start_date_2i").value, document.querySelector("#booking_start_date_3i").value);
      const endDate = new Date ( document.querySelector("#booking_end_date_1i").value, document.querySelector("#booking_end_date_2i").value, document.querySelector("#booking_end_date_3i").value);
      const numberOfDays = (endDate - startDate) / (1000*60*60*24)
      const price = document.querySelector('#watch_price').innerText;
      const total_price = price * numberOfDays;
      const button = document.querySelector('#js-button');
      button.value = `Book Watch for £${total_price}`;
    });
  }
};


export { dynamicPrice };
