<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PennyWise | Dashboard</title>
    <link rel="stylesheet" href="assets/style.css">
</head>
<body>
    <header>
        <div class="container">
            <nav>
                <a href="home.html" class="logo">
                    <div class="logo-icon">P</div>
                    <div class="logo-text">PennyWise</div>
                </a>
                <div class="nav-links">
                    <a href="login.html" class="button button-outline">Logout</a>
                </div>
            </nav>
        </div>
    </header>

    <!-- Dashboard/Home Page -->
    <section class="dashboard">
        <div class="container">
            <div class="dashboard-header">
                <div class="welcome-text">
                    <h1>Welcome back, User!</h1>
                    <p>Here's your financial summary</p>
                </div>
            </div>
            
            <!-- Balance Overview Card -->
            <div class="balance-card">
                <div class="balance-title">TOTAL BALANCE</div>
                <div class="balance-amount">Rs. 1,80,450.85</div>
                <div class="balance-stats">
                    <div class="stat stat-income">
                        <div class="stat-title">INCOME</div>
                        <div class="stat-amount">Rs. 2,52,150.00</div>
                    </div>
                    <div class="stat stat-expense">
                        <div class="stat-title">EXPENSES</div>
                        <div class="stat-amount">Rs. 71,699.15</div>
                    </div>
                </div>
            </div>
            
            <!-- Transactions Section -->
            <div class="transactions-container">
                <!-- Income Transactions -->
                <div class="transaction-card income">
                    <div class="card-header">
                        <h3 class="card-title">Income</h3>
                        <button class="button button-primary add-button" onclick="openModal('add-income')">+ Add Income</button>
                    </div>
                    <ul class="transaction-list">
                        <li class="transaction-item income">
                            <div class="transaction-info">
                                <div class="transaction-icon">+</div>
                                <div class="transaction-details">
                                    <h4>Salary</h4>
                                    <p>March 1, 2025</p>
                                </div>
                            </div>
                            <div class="transaction-amount">+Rs. 2,15,000.00</div>
                        </li>
                        <li class="transaction-item income">
                            <div class="transaction-info">
                                <div class="transaction-icon">+</div>
                                <div class="transaction-details">
                                    <h4>Freelance Work</h4>
                                    <p>March 3, 2025</p>
                                </div>
                            </div>
                            <div class="transaction-amount">+Rs 32,500.00</div>
                        </li>
                        <li class="transaction-item income">
                            <div class="transaction-info">
                                <div class="transaction-icon">+</div>
                                <div class="transaction-details">
                                    <h4>Interest</h4>
                                    <p>March 5, 2025</p>
                                </div>
                            </div>
                            <div class="transaction-amount">+Rs 4,650.00</div>
                        </li>
                    </ul>
                </div>
                
                <!-- Expense Transactions -->
                <div class="transaction-card expense">
                    <div class="card-header">
                        <h3 class="card-title">Expenses</h3>
                        <button class="button button-primary add-button" onclick="openModal('add-expense')">+ Add Expense</button>
                    </div>
                    <ul class="transaction-list">
                        <li class="transaction-item expense" id="expense-1">
                            <div class="transaction-info">
                                <div class="transaction-icon">-</div>
                                <div class="transaction-details">
                                    <h4>Rent</h4>
                                    <p>March 2, 2025</p>
                                </div>
                            </div>
                            <div style="display: flex; align-items: center; gap: 15px;">
                                <div class="transaction-amount">-Rs 45,000.00</div>
                                <div class="transaction-actions">
                                    <button class="action-button edit-button" onclick="openEditModal('expense-1', 'Rent', '45000', '2025-03-02')">Edit</button>
                                </div>
                            </div>
                        </li>
                        <li class="transaction-item expense" id="expense-2">
                            <div class="transaction-info">
                                <div class="transaction-icon">-</div>
                                <div class="transaction-details">
                                    <h4>Groceries</h4>
                                    <p>March 4, 2025</p>
                                </div>
                            </div>
                            <div style="display: flex; align-items: center; gap: 15px;">
                                <div class="transaction-amount">-Rs 8,699.15</div>
                                <div class="transaction-actions">
                                    <button class="action-button edit-button" onclick="openEditModal('expense-2', 'Groceries', '8699.15', '2025-03-04')">Edit</button>
                                </div>
                            </div>
                        </li>
                        <li class="transaction-item expense" id="expense-3">
                            <div class="transaction-info">
                                <div class="transaction-icon">-</div>
                                <div class="transaction-details">
                                    <h4>Utilities</h4>
                                    <p>March 5, 2025</p>
                                </div>
                            </div>
                            <div style="display: flex; align-items: center; gap: 15px;">
                                <div class="transaction-amount">-Rs 18,000.00</div>
                                <div class="transaction-actions">
                                    <button class="action-button edit-button" onclick="openEditModal('expense-3', 'Utilities', '18000', '2025-03-05')">Edit</button>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </section>

    <!-- Add/Edit Expense Modal -->
    <div class="modal-overlay" id="expense-modal">
        <div class="modal">
            <div class="modal-header">
                <h3 class="modal-title" id="modal-title">Add Expense</h3>
                <button class="close-button" onclick="closeModal()">&times;</button>
            </div>
            <form id="expense-form">
                <input type="hidden" id="expense-id" value="">
                <div class="form-group">
                    <label for="expense-name" class="form-label">Description</label>
                    <input type="text" id="expense-name" class="form-input" placeholder="What was this expense for?" required>
                </div>
                <div class="form-group">
                    <label for="expense-amount" class="form-label">Amount (₹)</label>
                    <input type="number" id="expense-amount" class="form-input" placeholder="0.00" step="0.01" required>
                </div>
                <div class="form-group">
                    <label for="expense-date" class="form-label">Date</label>
                    <input type="date" id="expense-date" class="form-input" required>
                </div>
                <div class="modal-footer">
                    <button type="button" class="button button-outline" onclick="closeModal()">Cancel</button>
                    <button type="button" class="button button-primary" onclick="saveExpense()">Save</button>
                </div>
            </form>
        </div>
    </div>

    <script>
        // Modal functions
        function openModal(type) {
            const modal = document.getElementById('expense-modal');
            const modalTitle = document.getElementById('modal-title');
            
            // Reset form
            document.getElementById('expense-form').reset();
            document.getElementById('expense-id').value = '';
            
            // Set default date to today
            const today = new Date().toISOString().split('T')[0];
            document.getElementById('expense-date').value = today;
            
            if (type === 'add-expense') {
                modalTitle.textContent = 'Add Expense';
            } else {
                modalTitle.textContent = 'Add Income';
            }
            
            modal.style.display = 'flex';
        }
        
        function openEditModal(id, name, amount, date) {
            const modal = document.getElementById('expense-modal');
            const modalTitle = document.getElementById('modal-title');
            
            // Set form values
            document.getElementById('expense-id').value = id;
            document.getElementById('expense-name').value = name;
            document.getElementById('expense-amount').value = amount;
            document.getElementById('expense-date').value = date;
            
            modalTitle.textContent = 'Edit Expense';
            
            modal.style.display = 'flex';
        }
        
        function closeModal() {
            const modal = document.getElementById('expense-modal');
            modal.style.display = 'none';
        }
        
        function saveExpense() {
            // In a real app, you would save the data to a database
            // For this demo, we'll just update the UI if it's an edit
            
            const expenseId = document.getElementById('expense-id').value;
            const expenseName = document.getElementById('expense-name').value;
            const expenseAmount = document.getElementById('expense-amount').value;
            const expenseDate = document.getElementById('expense-date').value;
            
            if (expenseId) {
                // It's an edit
                const expenseItem = document.getElementById(expenseId);
                
                if (expenseItem) {
                    // Format date for display
                    const dateObj = new Date(expenseDate);
                    const formattedDate = dateObj.toLocaleDateString('en-US', { 
                        year: 'numeric', 
                        month: 'long', 
                        day: 'numeric' 
                    });
                    
                    // Update the expense item with new values
                    const nameElement = expenseItem.querySelector('.transaction-details h4');
                    const dateElement = expenseItem.querySelector('.transaction-details p');
                    const amountElement = expenseItem.querySelector('.transaction-amount');
                    
                    nameElement.textContent = expenseName;
                    dateElement.textContent = formattedDate;
                    
                    // Format the amount with rupee symbol and commas
                    const formattedAmount = parseFloat(expenseAmount).toLocaleString('en-IN', {
                        maximumFractionDigits: 2,
                        minimumFractionDigits: 2
                    });
                    amountElement.textContent = '-₹' + formattedAmount;
                    
                    // Update the edit button onclick
                    const editButton = expenseItem.querySelector('.edit-button');
                    editButton.setAttribute('onclick', `openEditModal('${expenseId}', '${expenseName}', '${expenseAmount}', '${expenseDate}')`);
                }
            }
            
            closeModal();
        }
    </script>
</body>
</html>