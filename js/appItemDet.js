// Get the Item No parameter from the URL
const urlParams = new URLSearchParams(window.location.search);
const itemNo = urlParams.get('item');

// Create a new XMLHttpRequest object
const xhr = new XMLHttpRequest();

// Define the request URL
const url = "../db/JSON/Item.json";

// Open a new GET request
xhr.open('GET', url, true);

// Set up event listener for when the request is complete
xhr.onload = function () {
    // Check if the request was successful (status code 200)
    if (xhr.status === 200) {
        // Parse JSON response
        const data = JSON.parse(xhr.responseText);

        // Find the item with the matching Item No
        const selectedItem = data.find(item => item['Item No'] === parseInt(itemNo));

        // Populate the HTML with item details
        displayItemDetails(selectedItem);
    } else {
        console.error('Error fetching data. Status:', xhr.status);
    }
};

// Set up event listener for error handling
xhr.onerror = function () {
    console.error('Error fetching data.');
};

// Send the request
xhr.send();

function displayItemDetails(item) {
    const itemDetailsContainer = document.getElementById('itemDetailsContainer');

    if (!item) {
        itemDetailsContainer.innerHTML = '<p>Item not found.</p>';
        return;
    }

    // Create a table to display item details
    const table = document.createElement('table');
    table.setAttribute('class', 'tabla-centrada'); // Add class attribute

    // Add rows for each item detail
    table.innerHTML = `
        <tr>
            <th>Item No</th>
            <td>${item['Item No']}</td>
        </tr>
        <tr>
            <th>Nombre</th>
            <td>${item['Nombre']}</td>
        </tr>
        <tr>
            <th>Descripcion</th>
            <td>${item['Descripcion Catalogo']}</td>
        </tr>
        <tr>
            <th>Imagen</th>
            <td><img src="../images/${item['Imagen']}" alt="${item['Nombre']}"></td>
        </tr>
        <tr>
        <td colspan="2">
            <button class="btn" onclick="goBackToItems('${item['Categoria']}')">Volver al Item</button>
         </td>
        </tr>
    `;

    // Set HTML content in itemDetailsContainer
    itemDetailsContainer.appendChild(table);
}
function goBackToItems(categoria) {
    window.location.href = `../internet/catitems.html?categoria=${categoria}`;
}