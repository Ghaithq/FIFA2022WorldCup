const container = document.querySelector(".container");
const seats = document.querySelectorAll(".row .seat:not(.sold)");
const count = document.getElementById("count");
const total = document.getElementById("total");
const movieSelect = document.getElementById("movie");

const firstrow = document.getElementById("row1");
const secondrow = document.getElementById("row2");
const thirdrow = document.getElementById("row3");
const fourthrow = document.getElementById("row4");
const fifthrow = document.getElementById("row5");
const sixthrow = document.getElementById("row6");

let flag = 0;
//const selectedindex=document.getElementById("movie");

populateUI();

let ticketPrice = +movieSelect.value;

// Save selected movie index and price
function setMovieData(movieIndex, moviePrice) {
    localStorage.setItem("selectedMovieIndex", movieIndex);
    localStorage.setItem("selectedMoviePrice", moviePrice);
}

// Update total and count
function updateSelectedCount() {
    flag = 0;
    const selectedSeats = document.querySelectorAll(".row .seat.selected");

    const seatsIndex = [...selectedSeats].map((seat) => [...seats].indexOf(seat));

    localStorage.setItem("selectedSeats", JSON.stringify(seatsIndex));

    const selectedSeatsCount = selectedSeats.length;

    count.innerText = selectedSeatsCount;
    //total.innerText = selectedSeatsCount * ticketPrice;

    //selectedindex.

    setMovieData(movieSelect.selectedIndex, movieSelect.value);
}


// Get data from localstorage and populate UI
function populateUI() {
    const selectedSeats = JSON.parse(localStorage.getItem("selectedSeats"));

    if (selectedSeats !== null && selectedSeats.length > 0) {
        seats.forEach((seat, index) => {
            if (selectedSeats.indexOf(index) > -1) {
                console.log(seat.classList.add("selected"));
            }
        });
    }

    const selectedMovieIndex = localStorage.getItem("selectedMovieIndex");

    if (selectedMovieIndex !== null) {
        movieSelect.selectedIndex = selectedMovieIndex;
        console.log(selectedMovieIndex)
    }
}
console.log(populateUI())
// Movie select event
movieSelect.addEventListener("change", (e) => {
    ticketPrice = +e.target.value;
    setMovieData(e.target.selectedIndex, e.target.value);
    updateSelectedCount();
});


$(window).click(function (e) {
    //var index = document.getElementById("movie").selectedIndex;
    //var index2=document.movieform.movie.selectedIndex;
    if (movieSelect.selectedIndex != null) {
        if (($(e.target).hasClass('row1') || $(e.target).hasClass('row2')) && movieSelect.selectedIndex == 0) {
            flag = 1;
        }
        else if (($(e.target).hasClass('row3') || $(e.target).hasClass('row4')) && movieSelect.selectedIndex == 1) {
            flag = 1;
        }
        else if (($(e.target).hasClass('row5') || $(e.target).hasClass('row6')) && movieSelect.selectedIndex == 2) {
            flag = 1;
        }
        else {
            flag = 0;
        }
    }
    if (flag && e.target.classList.contains("seat") && !e.target.classList.contains("sold")) {

        if (e.target.classList.toggle("selected")) {
            let newtotal = ticketPrice + parseInt(total.innerText);
            total.innerText = newtotal;
        }
        else {
            let newtotal = -1 * ticketPrice + parseInt(total.innerText);
            total.innerText = newtotal;
        }
        flag = 0;

        updateSelectedCount();
    }
    else if ($(e.target).hasClass('row1') || $(e.target).hasClass('row2') || $(e.target).hasClass('row3') || $(e.target).hasClass('row4') || $(e.target).hasClass('row5') || $(e.target).hasClass('row6')) {
        flag = 0;
        window.alert("Choose a seat from the selected type seats");
    }


});

// Seat click event
// container.addEventListener("click", (e) => {
//   if (flag&&e.target.classList.contains("seat") && !e.target.classList.contains("sold")) 
//   {
//     e.target.classList.toggle("selected");
//     flag=0;
//     updateSelectedCount();
//   }
//   else
//   {
//     flag=0;
//     window.alert("Choose a seat from the selected type seats");
//   }
// });

$('#TicketType').on('change', function () {
    var selectedType = $("#TicketType").val();
    var RowSelect = $('#rows');
    RowSelect.empty();
    if (selectedType != null && selectedType != '') {
        $.getJSON('GetEmployees', { departmentName: selectedType }, function (employees) { ///
            if (employees != null && !jQuery.isEmptyObject(employees)) { ///
                RowSelect.append($('<option/>', {
                    value: null,
                    text: ""
                }));
                $.each(employees, function (index, employee) { ///
                    RowSelect.append($('<option/>', {
                        value: employee.value, ////
                        text: employee.text  ///
                    }));
                });
            };
        });
    }
});



// Initial count and total set
updateSelectedCount();