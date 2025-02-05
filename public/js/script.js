document.addEventListener("DOMContentLoaded", function() {
    // Get form elements
    const fullNameInput = document.getElementById('fname');
    const phoneInput = document.getElementById('phone');
    const emailInput = document.getElementById('email');
    const profilePictureInput = document.getElementById('profile_picture');
    const passwordInput = document.getElementById('password');
    const form = document.getElementById('registration_form');

    // Error message display
    const errorMessage = document.createElement("p");
    errorMessage.id = "error-message";
    errorMessage.style.color = "red";
    errorMessage.style.textAlign = "center";
    errorMessage.style.fontWeight = "bold";
    errorMessage.style.marginTop = "10px";
    document.getElementById("reg-btn").before(errorMessage);

    function allFieldsValid() {
        return isFullNameValid(fullNameInput.value) &&
               isPhoneValid(phoneInput.value) &&
               isEmailValid(emailInput.value) &&
               isFileTypeValid(profilePictureInput) &&
               isPasswordValid(passwordInput.value);
    }

    form.addEventListener('submit', function(e) {
        errorMessage.textContent = ""; // Clear previous errors
        let errors = [];

        if (!isFullNameValid(fullNameInput.value)) {
            errors.push("Full Name must have at least two capital letters and a space.");
        }
        if (!isPhoneValid(phoneInput.value)) {
            errors.push("Phone number must follow 09XXXXXXXXX or 639XXXXXXXXX format.");
        }
        if (!isEmailValid(emailInput.value)) {
            errors.push("Invalid email format.");
        }
        if (!isFileTypeValid(profilePictureInput)) {
            errors.push("Only JPEG and PNG files are allowed.");
        }
        if (!isPasswordValid(passwordInput.value)) {
            errors.push("Password must be at least 8 characters long and include an uppercase letter, a lowercase letter, a number, and a special character.");
        }

        if (errors.length > 0) {
            e.preventDefault();
            errorMessage.textContent = errors.join(" ");
        }
    });

    function isFullNameValid(name) {
        const fullNameRegex = /^(?=.*[A-Z].*[A-Z])(?=.*\s)[A-Za-z\s]+$/;
        return fullNameRegex.test(name);
    }

    function isPhoneValid(phone) {
        const phoneRegex = /^(09\d{9}|639\d{9})$/; 
        return phoneRegex.test(phone);
    }

    function isEmailValid(email) {
        const emailRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
        return emailRegex.test(email);
    }

    function isPasswordValid(password) {
        const passwordRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;
        return passwordRegex.test(password);
    }

    function isFileTypeValid(fileInput) {
        if (fileInput.files.length === 0) {
            return false;
        }
        const validImageTypes = ['image/jpeg', 'image/png'];
        return validImageTypes.includes(fileInput.files[0].type);
    }
});
