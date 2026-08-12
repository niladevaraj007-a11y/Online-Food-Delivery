function changeQty(inputId, delta) {
    const input = document.getElementById(inputId);
    if (!input) return;
    const next = Math.max(1, Number(input.value || 1) + delta);
    input.value = next;
}

function addToCart(form, event) {
    if (!window.fetch || !window.FormData || !window.URLSearchParams) {
        return true;
    }

    event.preventDefault();

    fetch(form.action, {
        method: 'POST',
        headers: { 'Accept': 'application/json' },
        body: new URLSearchParams(new FormData(form))
    })
    .then(res => res.json())
    .then(data => {
        if (data.success) {
            document.querySelectorAll('.cart-count').forEach(el => {
                el.textContent = data.count;
            });

            const toast = document.getElementById('toast');
            if (toast) {
                toast.textContent = 'Item Added To Cart';
                toast.className = 'alert success';
                setTimeout(() => toast.className = '', 1800);
            }
        } else {
            form.submit();
        }
    })
    .catch(() => {
        form.submit();
    });

    return false;
}

function validateRegister() {
    const email = document.forms['registerForm']['email'].value;
    const password = document.forms['registerForm']['password'].value;
    if (!email.includes('@') || password.length < 6) {
        alert('Enter a valid email and a password with at least 6 characters.');
        return false;
    }
    return true;
}

