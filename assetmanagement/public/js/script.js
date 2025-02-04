document.addEventListener("DOMContentLoaded", function() {
    //Get form info
    const displayPhotoInput = document.getElementById('dp_img');
    const emailInput = document.getElementById('email');
    const passwordInput = document.getElementById('password');
    const phoneInput = document.getElementById('phone');
    const form = document.getElementById('registration-form');

    function allFieldsValid() {
        return isEmailValid(emailInput.value) && 
        isPasswordValid(passwordInput.value) && 
        isPhoneValid(phoneInput.value) && 
        isFileTypeValid(displayPhotoInput);
    }

    form.addEventListener('submit', function(e) {
        if (!allFieldsValid()) {
            e.preventDefault();
            alert('Please fill out all required fields and ensure data is valid.');
        }
    });

    passwordInput.addEventListener('input', function() {
        const isValid = isPasswordValid(passwordInput.value);

        if(!isValid){
            alert('Password must be at least 12 characters long and include at least 1 lowercase letter, 1 upper case letter, 1 special characters, and 1 numbers.');
        }
    })

    emailInput.addEventListener('input', function() {
        const isValid = isEmailValid(emailInput.value);

        if(!isValid){
            alert('Please enter a valid email.');
        }
    })

    phoneInput.addEventListener('input', function() {
        const isValid = isPhoneValid(phoneInput.value);

        if(!isValid){
            alert('Phone number must have the format 09XXXXXXXXX or 639XXXXXXXXX.');
        }
    })

    displayPhotoInput.addEventListener('input', function() {
        const isValid = isFileTypeValid(displayPhotoInput.value);

        if(!isValid){
            alert('Only JPEG and PNG files are allowed.');
        }
    })
});

function isEmailValid(email) {
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/; //replace this with your own regex
    return emailRegex.test(email);
}

function isPasswordValid(password) {
    const passwordRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{12,}$/; //replace this with your own regex
    return passwordRegex.test(password);
}

function isPhoneValid(phone) {
    const phoneRegex = /^\d{10}$/; //replace this with your own regex
    return phoneRegex.test(phone);
}

function isFileTypeValid(fileInput) {
    const validImageTypes = ['image/jpeg', 'image/png'];
    return validImageTypes.includes(fileInput.files[0].type);
}