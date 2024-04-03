document.addEventListener('DOMContentLoaded', function () {
    // Get parameters from query string
    const params = new URLSearchParams(window.location.search);

    // Get arrays of values for each parameter
    const itemNos = params.getAll('itemNo');
    const nombres = params.getAll('nombre');
    const precios = params.getAll('precio').map(parseFloat);
    const cantidades = params.getAll('cantidad').map(parseFloat);

    // Create a table body to hold the rows
    const tbody = document.getElementById('itemDetails');

    // Iterate over each item and create a row for it
    for (let i = 0; i < itemNos.length; i++) {
        const itemNo = itemNos[i];
        const nombre = nombres[i];
        const precio = precios[i];
        const cantidad = cantidades[i];
        const total = precio * cantidad;

        // Create a new table row
        const newRow = document.createElement('tr');
        newRow.innerHTML = `
            <td>${nombre}</td>
            <td>${itemNo}</td>
            <td>$${precio.toFixed(2)}</td>
            <td>${cantidad}</td>
            <td>$${total.toFixed(2)}</td>
        `;

        // Append the new row to the table body
        tbody.appendChild(newRow);
    }

    // Calculate the total amount
    const totalAmount = precios.reduce((acc, curr, index) => acc + curr * cantidades[index], 0);

    // Update the total amount display
    const totalElement = document.getElementById('totalAmount');
    totalElement.textContent = `$${totalAmount.toFixed(2)}`;
});
