const loginBtn = document.getElementById("loginWalletBtn");
const themeToggle = document.getElementById("themeToggle");
const root = document.documentElement;
const statusEl = document.getElementById("status");

async function loginWithMetaMask() {
  if (typeof window.ethereum === "undefined") {
    alert("MetaMask is not installed. Get it from https://metamask.io/");
    return;
  }
  try {
    const accounts = await window.ethereum.request({ method: "eth_requestAccounts" });
    if (accounts.length > 0) {
      localStorage.setItem("userWallet", accounts[0]);
      window.location.href = "index.html";
    }
  } catch (err) {
    statusEl.textContent = "Login failed: " + err.message;
  }
}

loginBtn.addEventListener("click", loginWithMetaMask);

function toggleTheme() {
  if (root.getAttribute("data-theme") === "dark") {
    root.removeAttribute("data-theme");
    localStorage.setItem("theme", "light");
    themeToggle.textContent = "🌙";
  } else {
    root.setAttribute("data-theme", "dark");
    localStorage.setItem("theme", "dark");
    themeToggle.textContent = "☀️";
  }
}

// Load theme from storage
if (localStorage.getItem("theme") === "dark") {
  root.setAttribute("data-theme", "dark");
  themeToggle.textContent = "☀️";
}

themeToggle.addEventListener("click", toggleTheme);
