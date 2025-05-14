document.addEventListener('DOMContentLoaded', () => {
  const btn = document.getElementById('copy-invite-link');
  const input = document.getElementById('invite-link');
  if (btn && input) {
    btn.addEventListener('click', (e) => {
      e.preventDefault();
      input.style.opacity = 1;
      input.select();
      document.execCommand('copy');
      input.style.opacity = 0;
      alert('招待リンクをコピーしました！');
    });
  }
});
