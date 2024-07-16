<script>
	import { useToast } from '$lib/toast';

	import axios from 'axios';

	const toast = useToast();

	let fields = { email: '', password: '' };

	let loading = false;

	const onSubmit = () => {
		if (loading) return;
		axios
			.post('/login', fields)
			.then(() => {
				toast.trigger({
					message: 'You have successfully logged in. Redirecting...',
					background: 'variant-filled-success'
				});
				setTimeout(() => (window.location.href = '/'), 1000);
			})
			.catch((error) => {
				toast.trigger({
					message: 'Unable to logged you in',
					background: 'variant-filled-error'
				});
			})
			.finally(() => {
				loading = false;
			});
	};
</script>

<div class="mb-6" dir="rtl">
    <h3 class="h3">تسجيل الدخول إلى الحساب</h3>
    <p>يرجى تسجيل الدخول للبدء</p>
</div>

<form action="" on:submit|preventDefault={onSubmit} dir="rtl">
    <div class="mb-4">
        <label class="label">
            <span>البريد الإلكتروني</span>
            <input
                class="input"
                bind:value={fields.email}
                name="email"
                type="email"
                disabled={loading}
                placeholder="john@doe.com"
                required
            />
        </label>
    </div>

    <div class="mb-6">
        <label class="label">
            <span>كلمة المرور</span>
            <input
                class="input"
                bind:value={fields.password}
                name="password"
                type="password"
                placeholder=""
                disabled={loading}
                required
            />
        </label>
    </div>
    <button
        type="submit"
        disabled={loading}
        class="btn variant-filled-primary w-full font-bold text-white">تسجيل الدخول</button
    >
    <a href="/forgot" class="block pt-2 text-center">هل نسيت كلمة المرور؟</a>
</form>

