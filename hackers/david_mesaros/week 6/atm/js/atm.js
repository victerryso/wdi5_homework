


// var accounts = {
//     checking: {
    
//     balance: 0,
//     deposit: function (amount) {
//           accounts.checking.balance += parseInt(document.getElementById("checkingAmount").value);
//           document.getElementById('balance1').innerHTML = '$' + accounts.checking.balance ;
//           },
    

//     withdraw: function (amount) {
//         if (accounts.checking.balance >= parseInt(document.getElementById("checkingAmount").value))
//           {
//           accounts.checking.balance -= parseInt(document.getElementById('checkingAmount').value);
//           document.getElementById('balance1').innerHTML = '$' + accounts.checking.balance ;
//           }else if(accounts.checking.balance + accounts.savings.balance >= parseInt(document.getElementById("checkingAmount").value ))
//           {
//           accounts.savings.balance += accounts.checking.balance - parseInt(document.getElementById("checkingAmount").value)
//           accounts.checking.balance = 0
//           document.getElementById('balance1').innerHTML = '$' + accounts.checking.balance ;
//           document.getElementById('balance2').innerHTML = '$' + accounts.savings.balance ;

//           }
//        } 
//     },



//     savings: {
//     balance: 0,
//     deposit: function (amount) {

//       accounts.savings.balance += parseInt(document.getElementById('savingsAmount').value);
//       document.getElementById('balance2').innerHTML = '$' + accounts.savings.balance ;
//       },
    
//     withdraw: function (amount) {
//       if (accounts.savings.balance >= parseInt(document.getElementById('savingsAmount').value))
//       {
//       accounts.savings.balance -= parseInt(document.getElementById('savingsAmount').value);
//       document.getElementById('balance2').innerHTML = '$' + accounts.savings.balance ;
//       }
//          }
//       } 
//   };




// var chqDeposit = document.getElementById('checkingDeposit');
// chqDeposit.addEventListener('click', accounts.checking.deposit);

// var chqWithdraw = document.getElementById('checkingWithdraw');
// chqWithdraw.addEventListener('click', accounts.checking.withdraw);

// var savDeposit = document.getElementById('savingsDeposit');
// savingsDeposit.addEventListener('click', accounts.savings.deposit);

// var savWithdraw = document.getElementById('savingsWithdraw');
// savWithdraw.addEventListener('click', accounts.savings.withdraw);



var accounts = {
  checking: {
    balance: 0,
    deposit: function (amount) {
      accounts.checking.balance += amount;
    },
    withdraw: function (amount) {
      if (amount <= accounts.checking.balance) {
        accounts.checking.balance -= amount;
      } else if (amount <= accounts.available()) {
        // Withdraw the overdraft from the other account.
        accounts.savings.balance -= (amount - accounts.checking.balance);
        accounts.checking.balance = 0;
      }
    }
  },

  savings: {
    balance: 0,
    deposit: function (amount) {
      accounts.savings.balance += amount;
    },
    withdraw: function (amount) {
      if (amount <= accounts.savings.balance) {
        accounts.savings.balance -= amount;
      } else if (amount <= accounts.available()) {
        // Withdraw the overdraft from the other account.
        accounts.checking.balance -= (amount - accounts.savings.balance);
        accounts.savings.balance = 0;
      }
    }
  },

  available: function () {
    return accounts.checking.balance + accounts.savings.balance;
  }
};

var ATM = {
  init: function () {
    // Set up our events.
    ATM.savings.depositButton.click('click', ATM.savings.deposit);
    ATM.savings.withdrawButton.on('click', ATM.savings.withdraw);
    ATM.checking.depositButton.on('click', ATM.checking.deposit);
    ATM.checking.withdrawButton.on('click', ATM.checking.withdraw);

    // Initialize the UI.
    ATM.update();
  },



  update: function () {
    // Display the current balances.
    ATM.savings.balance.text('$' + accounts.savings.balance);
    ATM.checking.balance.text('$' + accounts.checking.balance);
 // debugger;
    // Use sorcery to add or remove the "zero" class for empty accounts.
    if (accounts.savings.balance <= 0){
      ATM.savings.frame.addClass('zero');
    } else{
      ATM.savings.frame.removeClass('zero')
    }

    if (accounts.checking.balance <=0){
      ATM.checking.frame.addClass('zero')
    } else{
      ATM.checking.frame.removeClass('zero')
    }
    },




  // Returns the current input for the selected field and clears the input.
  amount: function (account) {
    if (account !== 'savings' && account != 'checking') return null; // Invalid account!

    var n = ATM[account].amountField.val();

    ATM[account].amountField.val('');

    n = parseFloat(n);
    if (isNaN(n)) return 0;
    else return n;
  },

  savings: {
    // DOM nodes.
    frame: $('#savingsAccount'),
    depositButton: $('#savingsDeposit'),
    withdrawButton: $('#savingsWithdraw'),
    amountField: $('#savingsAmount'),
    balance: $('#balance2'),

    deposit: function () {
      var amount = ATM.amount('savings');
      if (amount) {
        accounts.savings.deposit(amount);
      }
      ATM.update();
    },
    withdraw: function () {
      var amount = ATM.amount('savings');
      if (amount) {
        accounts.savings.withdraw(amount);
      }
      ATM.update();
    }
  },
  checking: {
    // DOM nodes.
    frame: $('#checkingAccount'),
    depositButton: $('#checkingDeposit'),
    withdrawButton: $('#checkingWithdraw'),
    amountField: $('#checkingAmount'),
    balance: $('#balance1'),

    deposit: function () {
      var amount = ATM.amount('checking');
      if (amount) {
        accounts.checking.deposit(amount);
      }
      ATM.update();
    },
    withdraw: function () {
      var amount = ATM.amount('checking');
      if (amount) {
        accounts.checking.withdraw(amount);
      }
      ATM.update();
    }
  }
}

ATM.init();



//Javascript without JQ


// var accounts = {
//   checking: {
//     balance: 0,
//     deposit: function (amount) {
//       accounts.checking.balance += amount;
//     },
//     withdraw: function (amount) {
//       if (amount <= accounts.checking.balance) {
//         accounts.checking.balance -= amount;
//       } else if (amount <= accounts.available()) {
//         // Withdraw the overdraft from the other account.
//         accounts.savings.balance -= (amount - accounts.checking.balance);
//         accounts.checking.balance = 0;
//       }
//     }
//   },

//   savings: {
//     balance: 0,
//     deposit: function (amount) {
//       accounts.savings.balance += amount;
//     },
//     withdraw: function (amount) {
//       if (amount <= accounts.savings.balance) {
//         accounts.savings.balance -= amount;
//       } else if (amount <= accounts.available()) {
//         // Withdraw the overdraft from the other account.
//         accounts.checking.balance -= (amount - accounts.savings.balance);
//         accounts.savings.balance = 0;
//       }
//     }
//   },

//   available: function () {
//     return accounts.checking.balance + accounts.savings.balance;
//   }
// };

// var ATM = {
//   init: function () {
//     // Set up our events.
//     ATM.savings.depositButton.addEventListener('click', ATM.savings.deposit);
//     ATM.savings.withdrawButton.addEventListener('click', ATM.savings.withdraw);
//     ATM.checking.depositButton.addEventListener('click', ATM.checking.deposit);
//     ATM.checking.withdrawButton.addEventListener('click', ATM.checking.withdraw);

//     // Initialize the UI.
//     ATM.update();
//   },

//   update: function () {
//     // Display the current balances.
//     ATM.savings.balance.innerHTML = '$' + accounts.savings.balance;
//     ATM.checking.balance.innerHTML = '$' + accounts.checking.balance;

//     // Use sorcery to add or remove the "zero" class for empty accounts.
//     ATM.savings.frame.className = accounts.savings.balance <= 0 ? ' zero' : '';
//     ATM.savings.frame.className += ' account';
//     ATM.checking.frame.className = accounts.checking.balance <= 0 ? ' zero' : '';
//     ATM.checking.frame.className += ' account';
//   },

//   // Returns the current input for the selected field and clears the input.
//   amount: function (account) {
//     if (account !== 'savings' && account != 'checking') return null; // Invalid account!

//     var n = ATM[account].amountField.value;

//     ATM[account].amountField.value = '';

//     n = parseFloat(n);
//     if (isNaN(n)) return 0;
//     else return n;
//   },

//   savings: {
//     // DOM nodes.
//     frame: document.getElementById('savingsAccount'),
//     depositButton: document.getElementById('savingsDeposit'),
//     withdrawButton: document.getElementById('savingsWithdraw'),
//     amountField: document.getElementById('savingsAmount'),
//     balance: document.getElementById('balance2'),

//     deposit: function () {
//       var amount = ATM.amount('savings');
//       if (amount) {
//         accounts.savings.deposit(amount);
//       }
//       ATM.update();
//     },
//     withdraw: function () {
//       var amount = ATM.amount('savings');
//       if (amount) {
//         accounts.savings.withdraw(amount);
//       }
//       ATM.update();
//     }
//   },
//   checking: {
//     // DOM nodes.
//     frame: document.getElementById('checkingAccount'),
//     depositButton: document.getElementById('checkingDeposit'),
//     withdrawButton: document.getElementById('checkingWithdraw'),
//     amountField: document.getElementById('checkingAmount'),
//     balance: document.getElementById('balance1'),

//     deposit: function () {
//       var amount = ATM.amount('checking');
//       if (amount) {
//         accounts.checking.deposit(amount);
//       }
//       ATM.update();
//     },
//     withdraw: function () {
//       var amount = ATM.amount('checking');
//       if (amount) {
//         accounts.checking.withdraw(amount);
//       }
//       ATM.update();
//     }
//   }
// }

// ATM.init();

