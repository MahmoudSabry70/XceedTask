var totalItems = 0;
var totalPages = 0;
var pageType = "";
var DataViewModelId = 0;
var SearchData = "";

function initializeShowProducts(initialTotalItems, initialpageType, initialDataViewModelId, initialSearchData) {
    // Use the initialTotalItems parameter here
    totalItems = initialTotalItems;
    PageType = initialpageType;
    DataViewModelId = initialDataViewModelId;
    SearchData = initialSearchData;
}

//---------------------------------------------- sort data name price stars ----------------------------------------------
$(document).ready(function () {
    function sortByAttribute(criteria) {
        var $productContainers = $('[data-product-container]');
        $productContainers.sort(function (a, b) {
            var aValue, bValue;

            switch (criteria) {
                case 'name_asc':
                    aValue = $(a).find('[data-name]').data('name');
                    bValue = $(b).find('[data-name]').data('name');
                    break;
                case 'name_desc':
                    aValue = $(b).find('[data-name]').data('name');
                    bValue = $(a).find('[data-name]').data('name');
                    break;
                case 'price_asc':
                    aValue = $(a).find('[data-price]').data('price');
                    bValue = $(b).find('[data-price]').data('price');
                    break;
                case 'price_desc':
                    aValue = $(b).find('[data-price]').data('price');
                    bValue = $(a).find('[data-price]').data('price');
                    break;
                case 'stars_asc':
                    aValue = $(a).find('[data-stars]').data('stars');
                    bValue = $(b).find('[data-stars]').data('stars');
                    break;
                case 'stars_desc':
                    aValue = $(b).find('[data-stars]').data('stars');
                    bValue = $(a).find('[data-stars]').data('stars');
                    break;
                default:
                    // Default to sorting by name in ascending order
                    aValue = $(a).find('[data-name]').data('name');
                    bValue = $(b).find('[data-name]').data('name');
            }
            if (criteria.includes('name')) {
                return aValue.localeCompare(bValue);
            }
            return aValue - bValue;
        });
        $('#PartialProductBox').empty().append($productContainers);
    }

    $('#sortingCriteria').on('change', function () {
        var selectedCriteria = $(this).val();
        sortByAttribute(selectedCriteria);
    });
});

//---------------------------------------------- pagination data ----------------------------------------------
function showPage(page, itemsPerPage) {
    var $productContainers = $('[data-product-container]');
    var startIndex = (page - 1) * itemsPerPage;
    var endIndex = parseInt(startIndex) + parseInt(itemsPerPage);

    // Hide all products
    $productContainers.hide();

    // Show products for the current page
    $productContainers.slice(startIndex, endIndex).show();
}

function updatePagination(totalProducts, itemsPerPage) {
    totalPages = Math.ceil(parseInt(totalProducts) / parseInt(itemsPerPage));
    var paginationList = $('#pagination');

    // Clear existing pagination links
    paginationList.empty();

    // Add previous button
    var previousButton = $('<li class="page-item" id="previousPage"><a class="page-link" href="javascript:void(0)" aria-label="Previous"><span aria-hidden="true"><i class="fa fa-chevron-left" aria-hidden="true"></i></span> <span class="sr-only">Previous</span></a></li>');
    paginationList.append(previousButton);

    for (var i = 1; i <= totalPages; i++) {
        var listItem = $('<li class="page-item page-number" data-page="' + i + '"><a class="page-link" href="javascript:void(0)">' + i + '</a></li>');
        paginationList.append(listItem);
    }

    // Add next button
    var nextButton = $('<li class="page-item" id="nextPage"><a class="page-link" href="javascript:void(0)" aria-label="Next"><span aria-hidden="true"><i class="fa fa-chevron-right" aria-hidden="true"></i></span> <span class="sr-only">Next</span></a></li>');
    paginationList.append(nextButton);
}

$('#itemsPerPage').on('change', function () {
    var selectedPage = 1; // Reset to the first page when items per page changes
    var itemsPerPage = $(this).val();

    // Show the first page with the new items per page
    showPage(selectedPage, itemsPerPage);

    // Update pagination based on the new items per page
    updatePagination(totalItems, itemsPerPage); // Make sure to replace totalProducts with the actual number of products

    // Highlight the first page
    $('#pagination li.page-item').removeClass('active');
    $('#pagination li.page-item[data-page="1"]').addClass('active');
});

$(document).ready(function () {
    var defaultItemsPerPage = 24;
    var defaultPage = 1;

    // Set default items per page
    $('#itemsPerPage').val(defaultItemsPerPage);

    // Example: Replace this with the actual total number of products you have
    var totalProducts = totalItems; // Replace with your actual total number of products

    // Trigger initial display
    showPage(defaultPage, defaultItemsPerPage);
    updatePagination(totalProducts, defaultItemsPerPage);

    // Ensure correct initialization of pagination links
    updatePaginationLinks(defaultPage);

    // Handle pagination link clicks

    // Handle previous button click
    $('#pagination').on('click', '#previousPage', function () {
        var currentPage = parseInt($('#pagination li.page-item.active').data('page'));
        if (currentPage > 1) {
            showPage(currentPage - 1, $('#itemsPerPage').val());
            updatePaginationLinks(currentPage - 1);
        }
    });

    // Handle next button click
    $('#pagination').on('click', '#nextPage', function () {
        var currentPage = parseInt($('#pagination li.page-item.active').data('page'));
        if (currentPage < totalPages) {
            showPage(currentPage + 1, $('#itemsPerPage').val());
            updatePaginationLinks(currentPage + 1);
        }
    });

    $('#pagination').on('click', 'li.page-number', function () {
        var selectedPage = parseInt($(this).data('page'));
        showPage(selectedPage, $('#itemsPerPage').val());
        updatePaginationLinks(selectedPage);
    });
});

function updatePaginationLinks(currentPage) {
    $('#pagination li.page-item').removeClass('active');
    $('#pagination li.page-item[data-page="' + currentPage + '"]').addClass('active');

    // Enable/disable previous and next buttons based on current page
    $('#previousPage').toggleClass('disabled', currentPage === 1);
    $('#nextPage').toggleClass('disabled', currentPage === totalPages);
}

//---------------------------------------------- filter data ----------------------------------------------

$(document).ready(function () {
    // Event listener for Apply button
    $("#apply-filters").on("click", function () {
        applyFilters();
    });
    function applyFilters() {
        // Extract selected filter values
        var selectedBrands = $(".brand-filter:checked").map(function () {
            return parseInt(this.id); // Convert to number
        }).get();

        var selectedSizes = $(".size-filter:checked").map(function () {
            return parseInt(this.id); // Convert to number
        }).get();

        var selectedColors = $(".color-item.active").map(function () {
            return $(this).data("color");
        }).get();

        // Extract min and max values from the price range
        var priceRange = $("#price-range").val().split(";");
        var minPrice = parseInt(priceRange[0]);
        var maxPrice = parseInt(priceRange[1]);

        // Create an object to store filter data
        var filterData = {
            brands: selectedBrands,
            sizes: selectedSizes,
            colors: selectedColors,
            minPrice: minPrice,
            maxPrice: maxPrice,
            pageType: PageType,
            Id: DataViewModelId,
            SearchData: SearchData
        };
        console.log(filterData);

        // Implement your filtering logic here
        $.ajax({
            url: "/HomeProducts/FilterProducts", // Replace with your actual API endpoint
            type: "POST", // Adjust the HTTP method as needed
            contentType: "application/json",
            data: JSON.stringify(filterData),
            success: function (data) {
                $("#PartialProductBox").empty();
                $("#PartialProductBox").html(data);
                var productContainerCount = $('[data-product-container]').length;

                console.log(productContainerCount);
                totalItems = productContainerCount;
                updateResultCount(totalItems);
                updatePagination(totalItems, 24);
                showPage(1, 24);
                updatePaginationLinks(1);
            },
            error: function (error) {
                console.error("Error:", error);
            }
        });
    }
});

// ----------------------------------------------  Change Result count ----------------------------------------------

function updateResultCount(count) {
    var resultCountElement = document.getElementById('resultCount');

    if (resultCountElement) {
        resultCountElement.textContent = count + ' Results'
    }
}