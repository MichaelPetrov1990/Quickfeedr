export const displayShow = () => {
const link = document.querySelector(".job-link");
  link.addEventListener('click', (event) => {
    const locationLink = document.querySelector(".job-location");
    locationLink.innerHTML = "";
    event.preventDefault();
    locationLink.insertAdjacentHTML("beforeend", `<div class="container col-4" >
  <h1><%= @job.title %></h1>
  <h2><%= @job.location %></h2>
  <h3><%= @job.salary %></h3>
  <p><%= @job.description %></p>
</div>`)
  })
}
