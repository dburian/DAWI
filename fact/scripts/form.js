const form = document.getElementById('contact-form');

const firstName = document.getElementById('form-first-name');
const lastName = document.getElementById('form-last-name');

const email = document.getElementById('form-email');
const emailAgain = document.getElementById('form-email-again');

const phone = document.getElementById('form-phone');

const contactText = document.getElementById('form-textarea');

form.addEventListener('submit', (e) => {

    if (firstName.value === '' || firstName.value == null) {
        showErrorMessage(e, firstName, 'Enter your name!');
        firstName.focus();
        return;
    } else {
        removeErrorMessage(firstName);
    }

    if (lastName.value === '' || lastName.value == null) {
        showErrorMessage(e, lastName, 'Enter your name!');
        lastName.focus();
        return;
    } else {
        removeErrorMessage(lastName);
    }

    if (email.value === '' || email.value == null) {
        showErrorMessage(e, email, 'Enter your email!');
        removeErrorMessage(emailAgain);
        email.focus();
        return;
    } else if (!email.value.match('(?:[a-z0-9!#$%&\'*+/=?^_`{|}~-]+(?:\\.[a-z0-9!#$%&\'*+/=?^_`{|}~-]+)*|&quot;(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-\x7f]|\\\\[\x01-\x09\x0b\x0c\x0e-\x7f])*&quot;)@(?:(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:(2(5[0-5]|[0-4][0-9])|1[0-9][0-9]|[1-9]?[0-9]))\\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9][0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21-\x5a\x53-\x7f]|\\\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\\])')) {
        showErrorMessage(e, email, 'This is not valid email address!');
        removeErrorMessage(emailAgain);
        email.focus();
        return;
    } else {
        removeErrorMessage(email);
    }

    if (emailAgain.value === '' || emailAgain.value == null) {
        showErrorMessage(e, emailAgain, 'Repeat your email!');
        emailAgain.focus();
        return;
    } else if (!emailAgain.value.match('(?:[a-z0-9!#$%&\'*+/=?^_`{|}~-]+(?:\\.[a-z0-9!#$%&\'*+/=?^_`{|}~-]+)*|&quot;(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-\x7f]|\\\\[\x01-\x09\x0b\x0c\x0e-\x7f])*&quot;)@(?:(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:(2(5[0-5]|[0-4][0-9])|1[0-9][0-9]|[1-9]?[0-9]))\\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9][0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21-\x5a\x53-\x7f]|\\\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\\])')) {
        showErrorMessage(e, emailAgain, 'This is not valid email address!');
        emailAgain.focus();
        return;
    } else {
        removeErrorMessage(emailAgain);
    }

    if (email.value !== emailAgain.value) {
        showErrorMessage(e, emailAgain, 'The email address is different.');
        email.focus();
        return;
    } else {
        removeErrorMessage(emailAgain);
    }

    if (phone.value !== '' && !phone.value.match('^\\+?[0-9]{8,12}$')) {
        showErrorMessage(e, phone, 'Phone number format is not valid.');
        phone.focus();
        return;
    } else {
        removeErrorMessage(phone);
    }

    if (contactText.value === '' || contactText.value == null) {
        showErrorMessage(e, contactText, 'Write something to the message body.');
        contactText.focus();
    } else {
        removeErrorMessage(contactText);
    }

});

firstName.addEventListener('input', (e) => {
    removeErrorMessage(firstName);
});

lastName.addEventListener('input', (e) => {
    removeErrorMessage(lastName);
});

email.addEventListener('change', (e) => {
    console.log('email changes');
    if (email.value === '' || email.value == null) {
        showErrorMessage(e, emailAgain, 'Enter your email!');
        removeErrorMessage(emailAgain);
        email.focus();
    } else if (!email.value.match('(?:[a-z0-9!#$%&\'*+/=?^_`{|}~-]+(?:\\.[a-z0-9!#$%&\'*+/=?^_`{|}~-]+)*|&quot;(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-\x7f]|\\\\[\x01-\x09\x0b\x0c\x0e-\x7f])*&quot;)@(?:(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:(2(5[0-5]|[0-4][0-9])|1[0-9][0-9]|[1-9]?[0-9]))\\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9][0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21-\x5a\x53-\x7f]|\\\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\\])')) {
        showErrorMessage(e, email, 'This is not valid email address!');
        removeErrorMessage(emailAgain);
        email.focus();
    } else {
        removeErrorMessage(email);
    }
});

emailAgain.addEventListener('input', (e) => {
    if (email.value === emailAgain.value) {
        removeErrorMessage(emailAgain);
    }
});

emailAgain.addEventListener('change', (e) => {
    if (!emailAgain.value.match('(?:[a-z0-9!#$%&\'*+/=?^_`{|}~-]+(?:\\.[a-z0-9!#$%&\'*+/=?^_`{|}~-]+)*|&quot;(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-\x7f]|\\\\[\x01-\x09\x0b\x0c\x0e-\x7f])*&quot;)@(?:(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:(2(5[0-5]|[0-4][0-9])|1[0-9][0-9]|[1-9]?[0-9]))\\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9][0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21-\x5a\x53-\x7f]|\\\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\\])')) {
        showErrorMessage(e, emailAgain, 'This is not valid email address!');
        emailAgain.focus();
    } else if (email.value !== emailAgain.value) {
        showErrorMessage(e, emailAgain, 'The email address is different.');
        emailAgain.focus();
    }
});

phone.addEventListener('change', (e) => {
    if (phone.value !== '' && !phone.value.match('^\\+?[0-9]{8,12}$')) {
        showErrorMessage(e, phone, 'Phone number format is not valid.');
        phone.focus();
    }
});

phone.addEventListener('input', (e) => {
    if (phone.value.match('^\\+?[0-9]{8,12}$') || phone.value === '') {
        removeErrorMessage(phone);
    }
});

contactText.addEventListener('input', (e) => {
    if (contactText.value !== '') {
        removeErrorMessage(contactText);
    }
});


function showErrorMessage(event, input, errorMessage) {
    event.preventDefault();
    input.parentElement.parentElement.getElementsByClassName('error-message')[0].innerText = errorMessage;
    // this.errorMessage.innerText = errorMessage;
}

function removeErrorMessage(input) {
    input.parentElement.parentElement.getElementsByClassName('error-message')[0].innerText = '';
    // errorMessage.innerText = '';
}