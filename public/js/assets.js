document.addEventListener("DOMContentLoaded", function() {
    //Get form info
    const aNameInput = document.getElementById('asset_name');
    const aDescriptionInput = document.getElementById('asset_description');
    const acqDateInput = document.getElementById('acquisition_date');
    const forRentInput = document.getElementById('forrent');
    const aValueInput = document.getElementById('asset_value');
    const aTypeInput = document.getElementById('type_asset');
    const statusInput = document.getElementById('status');
    const lattitudeInput = document.getElementById('loc_lattitude');
    const longitudeInput = document.getElementById('loc_longiture');
    const hoaNameInput = document.getElementById('hoa_name');
    const aEnclosingInput = document.getElementById('enclosing_asset');
    const assetIdInput = document.getElementById('asset_id');

    //change date format to YYYY-MM-DD
    function changeDateFormat(date){
        let d = new Date(date);
        let year = d.getFullYear();
        let month = String(d.getMonth() + 1).padStart(2, '0');
        let day = String(d.getDate()).padStart(2, '0');
        return `${year}-${month}-${day}`;
    }

    
});

