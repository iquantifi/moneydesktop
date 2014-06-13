module Moneydesktop
  class Category

    def self.value(id=0)
      @@map[id] || :unkown
    end

      @@map = {
          0 => :unknown,        #  0 Uncategorized
          1 => :unknown,        #  1 Uncategorized
          2 => :committed,      #  2 Automotive Expenses
          3 => :discretionary,  #  3 Charitable Giving
          4 => :committed,      #  4 Child/Dependent Expenses
          5 => :committed,      #  5 Clothing/Shoes
          6 => :committed,      #  6 Education
          7 => :discretionary,  #  7 Entertainment
          8 => :committed,      #  8 Gasoline
          9 => :discretionary,  #  9 Gift
         10 => :committed,      # 10 Groceries
         11 => :committed,      # 11 Healthcare/Medical
         12 => :committed,      # 12 Home Maintenance
         13 => :committed,      # 13 Home Improvement
         14 => :committed,      # 14 Insurance
         15 => :discretionary,  # 15 Cable/Satellite Services
         16 => :discretionary,  # 16 Online Services
         17 => :committed,      # 17 Loans
         18 => :committed,      # 18 Mortgages
         19 => :discretionary,  # 19 Other Expenses
         20 => :committed,      # 20 Personal Care
         21 => :committed,      # 21 Rent
         22 => :discretionary,  # 22 Restaurants/Dining
         23 => :discretionary,  # 23 Travel
         24 => :committed,      # 24 Service Charges/Fees
         25 => :discretionary,  # 25 ATM/Cash Withdrawals
         26 => :committed,      # 26 Credit Card Payments
         27 => :income,         # 27 Deposits
         28 => :savings,        # 28 Transfers
         29 => :income,         # 29 Paychecks/Salary
         30 => :income,         # 30 Investment Income
         31 => :income,         # 31 Retirement Income
         32 => :income,         # 32 Other Income
         33 => :discretionary,  # 33 Checks
         34 => :discretionary,  # 34 Hobbies
         35 => :discretionary,  # 35 Other Bills
         36 => :unknown,        # 36 Securities Trades
         37 => :taxes,          # 37 Taxes
         38 => :committed,      # 38 Telephone Services
         39 => :committed,      # 39 Utilities
         40 => :savings,        # 40 Savings
         41 => :savings,        # 41 Retirement Contributions
         42 => :discretionary,  # 42 Pets/Pet Care
         43 => :discretionary,  # 43 Electronics
         44 => :discretionary,  # 44 General Merchandise
         45 => :business,       # 45 Office Supplies
         92 => :discretionary,  # 92 Consulting
         94 => :unknown,        # 94 Sales
         96 => :income,         # 96 Interest
         98 => :unknown,        # 98 Services
        100 => :business,       #100 Advertising
        102 => :business,       #102 Business Miscellaneous
        104 => :discretionary,  #104 Postage and Shipping
        106 => :discretionary,  #106 Printing
        108 => :discretionary,  #108 Dues and Subscriptions
        110 => :business,       #110 Office Maintenance
        112 => :business,       #112 Wages Paid
      }

  end
end