document.addEventListener('DOMContentLoaded', function () {
    // Get parameters from query string
    const params = new URLSearchParams(window.location.search);
    const itemNo = params.get('itemNo');
    const nombre = params.get('nombre');
    const precio = parseFloat(params.get('precio'));
    const cantidad = parseInt(params.get('cantidad'));
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
    const tbody = document.querySelector('tbody');
    tbody.appendChild(newRow);

    // Update the total amount
    const totalElement = document.getElementById('totalAmount');
    totalElement.textContent = `$${total.toFixed(2)}`;
});
