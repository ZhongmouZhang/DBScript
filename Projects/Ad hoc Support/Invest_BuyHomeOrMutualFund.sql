declare @interest decimal(10,2), @balance decimal(10,2)
declare @MonthAmount int, @loop int, @monthlyPay int, @InitDeposite int, @RentalCost int
declare @houseCost int
Declare @MortgageBalance int  -- after 5 year



--  Buy Property of 350,000 DownPay 25%
/* 
select @interest = 0.06, @monthAmount=60, @monthlyPay=1940, @initdeposite=97500, @RentalCost=1000, @loop=1
set @houseCost = 350000
set @MortgageBalance = 232394
*/
--  Buy Property of 450,000; DownPay 20%

select @interest = 0.06, @monthAmount=60, @monthlyPay=2529, @initdeposite=90000+10000, @RentalCost=1000, @loop=1
set @houseCost = 450000
set @MortgageBalance = 321899


--Mutual Fund,  Compounding Monthly
set @interest = 0.07
set @balance = @initdeposite
while (@loop <= @monthamount)
begin
	set @balance = @balance * (1+@interest/12) + (@monthlyPay-@RentalCost)
	set @loop = @loop + 1
end

select 'Mutual Fund', @balance TotalValueAfter5Year , 
	@initdeposite + (@monthlyPay-@RentalCost)*@monthAmount CashPaid,
	@RentalCost*@monthAmount RentalCost,
	@balance-@initdeposite - (@monthlyPay-@RentalCost)*@monthAmount NetGain

set @interest = 0.05
select 'BuyHouse', @houseCost HouseInitialValue, 
	@houseCost*power((1+@interest),@monthAmount/12) TotalValueAfter5Year, 
	@initdeposite + @monthlyPay*@monthAmount CashPaid,
	@MortgageBalance MortgageBalance,
	@houseCost*power((1+@interest),@monthAmount/12)*0.02 SellCommission,
	@houseCost*power((1+@interest),@monthAmount/12) - @MortgageBalance - @houseCost*power((1+@interest),@monthAmount/12)*0.02 NetTotalValueAfter5Year,
	@houseCost*power((1+@interest),@monthAmount/12) - (@initdeposite + @monthlyPay*@monthAmount) - @MortgageBalance 
	- @houseCost*power((1+@interest),@monthAmount/12)*0.02 NetGain

--select 350000 * (power(1.06,5)-1)

	