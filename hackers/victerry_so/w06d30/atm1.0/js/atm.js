var accounts = {
  checking: {
    balance: 0,
    deposit: function () {
      accounts.checking.balance += parseInt(document.getElementById('checkingAmount').value);
      document.getElementById('balance1').innerHTML = '$' + accounts.checking.balance;
      document.getElementById('checkingAccount').style.backgroundColor = '#6C9A74';
    },

    withdraw: function () {
      if (accounts.checking.balance >= parseInt(document.getElementById('checkingAmount').value)) {
        accounts.checking.balance -= parseInt(document.getElementById('checkingAmount').value);
        document.getElementById('balance1').innerHTML = '$' + accounts.checking.balance;
      }

      else if (accounts.checking.balance + accounts.savings.balance >= parseInt(document.getElementById('checkingAmount').value)) {
        accounts.savings.balance += accounts.checking.balance - parseInt(document.getElementById('checkingAmount').value);
        accounts.checking.balance = 0;
        document.getElementById('balance1').innerHTML = '$' + accounts.checking.balance;
        document.getElementById('balance2').innerHTML = '$' + accounts.savings.balance;
      }

      if (accounts.checking.balance === 0) {
        document.getElementById('checkingAccount').style.backgroundColor = '#f45050';
      };
    }
  },

  savings: {
    balance: 0,
    deposit: function () {
      accounts.savings.balance += parseInt(document.getElementById('savingsAmount').value);
      document.getElementById('balance2').innerHTML = '$' + accounts.savings.balance;
      document.getElementById('savingsAccount').style.backgroundColor = '#6C9A74';
    },

    withdraw: function () {
      if (accounts.savings.balance >= parseInt(document.getElementById('savingsAmount').value)) {
        accounts.savings.balance -= parseInt(document.getElementById('savingsAmount').value);
        document.getElementById('balance2').innerHTML = '$' + accounts.savings.balance;
      }

      else if (accounts.savings.balance + accounts.checking.balance >= parseInt(document.getElementById('savingsAmount').value)) {
        accounts.checking.balance += accounts.savings.balance - parseInt(document.getElementById('savingsAmount').value);
        accounts.savings.balance = 0;
        document.getElementById('balance1').innerHTML = '$' + accounts.checking.balance;
        document.getElementById('balance2').innerHTML = '$' + accounts.savings.balance;
      }

      if (accounts.savings.balance === 0) {
        document.getElementById('savingsAccount').style.backgroundColor = '#f45050';
      };
    }
  }
};


var chqDepositButton = document.getElementById('checkingDeposit');
chqDepositButton.addEventListener('click', accounts.checking.deposit);

var chqWithdrawButton = document.getElementById('checkingWithdraw');
chqWithdrawButton.addEventListener('click', accounts.checking.withdraw);

var savDepositButton = document.getElementById('savingsDeposit');
savDepositButton.addEventListener('click', accounts.savings.deposit);

var savWithdrawButton = document.getElementById('savingsWithdraw');
savWithdrawButton.addEventListener('click', accounts.savings.withdraw);