<script>
	// @ts-nocheck
	import { getErrorMessage, useApi } from '$lib/api';
	import { useToast } from '$lib/toast';

	const api = useApi();
	const toast = useToast();

	export let data = { email: '', token: '' };

	let fields = { password: '', password_confirmation: '' };

	let loading = false;

	const onSubmit = () => {
		if (loading) return;
		api.post('/auth/reset', {
			email: data.email,
			token: data.token,
			password: fields.password,
			password_confirmation: fields.password_confirmation
		})
			.then(() => {
				toast.trigger({
					message: 'You have successfully reset your password. Redirecting...',
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
    <h3 class="h3">إعادة تعيين كلمة المرور</h3>
    <p>استخدم النموذج أدناه لإعادة تعيين كلمة المرور الخاصة بك</p>
</div>

<form action="" on:submit|preventDefault={onSubmit} dir="rtl">
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
    <div class="mb-6">
        <label class="label">
            <span>تأكيد كلمة المرور</span>
            <input
                class="input"
                bind:value={fields.password_confirmation}
                name="password_confirmation"
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
        class="btn variant-filled-primary w-full font-bold text-white">إعادة تعيين كلمة المرور</button
    >
    <a href="/login" class="block pt-2 text-center">العودة إلى تسجيل الدخول</a>
</form>
