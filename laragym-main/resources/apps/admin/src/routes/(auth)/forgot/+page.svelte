<script>
	import { getErrorMessage } from '$lib/api';
	import { useToast } from '$lib/toast';

	import axios from 'axios';

	let fields = { email: '', password: '' };

	let loading = false;

	const toast = useToast();

	const onSubmit = () => {
		if (loading) return;
		axios
			.post('/forgot', fields)
			.then(() => {
				toast.trigger({
					message: 'Password reset instruction has been sent. Redirecting...',
					background: 'variant-filled-success'
				});
				setTimeout(() => (window.location.href = '/'), 1000);
			})
			.catch((error) => {
				toast.trigger({
					message: getErrorMessage(error),
					background: 'variant-filled-error'
				});
			})
			.finally(() => {
				loading = false;
			});
	};
</script>
<div class="mb-6" dir="rtl">
    <h3 class="h3">نسيت كلمة المرور</h3>
    <p>يرجى تقديم بريدك الإلكتروني لإعادة تعيين كلمة المرور.</p>
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
                placeholder="john@doe.com"
                required
                disabled={loading}
            />
        </label>
    </div>
    <button
        type="submit"
        disabled={loading}
        class="btn variant-filled-primary w-full font-bold text-white">إرسال</button
    >
    <a href="/login" class="block pt-2 text-center">العودة إلى تسجيل الدخول</a>
</form>
