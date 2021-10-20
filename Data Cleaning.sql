Select *
From PortfolioProject.dbo.NashvilleHousing




Select saleDateConverted, CONVERT(Date,SaleDate)
From PortfolioProject.dbo.NashvilleHousing


Update NashvilleHousing
SET SaleDate = CONVERT(Date,SaleDate)



ALTER TABLE NashvilleHousing
Add SaleDateConverted Date;

Update NashvilleHousing
SET SaleDateConverted = CONVERT(Date,SaleDate)


Select *
From PortfolioProject.dbo.NashvilleHousing
--where propertyAddress is null
order by parcelID

Select a.ParcelID, a.PropertyAddress, b.ParcelID, b.PropertyAddress, ISNULL(a.PropertyAddress, b.PropertyAddress)
From PortfolioProject.dbo.NashvilleHousing a
JOIN PortfolioProject.dbo.NashvilleHousing b
	on a.ParcelID = b.ParcelID
		AND a.[UniqueID] <> b.[UniqueID]
			where a.propertyAddress is null



update a
set PropertyAddress = ISNULL(a.PropertyAddress, b.PropertyAddress)
From PortfolioProject.dbo.NashvilleHousing a
JOIN PortfolioProject.dbo.NashvilleHousing b
	on a.ParcelID = b.ParcelID
		AND a.[UniqueID] <> b.[UniqueID]



select PropertyAddress
	from PortfolioProject.dbo.NashvilleHousing
		--order by ParcelID 

		select
		SUBSTRING(PropertyAddress, 1, CHARINDEX(',', PropertyAddress)-1) as ADDRESS
		,SUBSTRING(PropertyAddress,  CHARINDEX(',', PropertyAddress)+1, len(PropertyAddress)) as ADDRESS
			from PortfolioProject.dbo.NashvilleHousing


ALTER TABLE NashvilleHousing
Add PropertySplitAddress NVARCHAR(255);

Update NashvilleHousing
SET PropertySplitAddress= SUBSTRING(PropertyAddress, 1, CHARINDEX(',', PropertyAddress)-1) 

ALTER TABLE NashvilleHousing
Add PropertySplitCity NVARCHAR (255);

Update NashvilleHousing
SET PropertySplitCity= SUBSTRING(PropertyAddress,  CHARINDEX(',', PropertyAddress)+1, len(PropertyAddress))


select OwnerAddress
from PortfolioProject.dbo.NashvilleHousing

select 
parsename(replace(OwnerAddress, ',', '.'),3),
parsename(replace(OwnerAddress, ',', '.'),2),
parsename(replace(OwnerAddress, ',', '.'),1)
from PortfolioProject.dbo.NashvilleHousing

ALTER TABLE NashvilleHousing
Add OwnerSplitAddress NVARCHAR (255);

Update NashvilleHousing
SET OwnerSplitAddress= parsename(replace(OwnerAddress, ',', '.'),3)
--------------------------
ALTER TABLE NashvilleHousing
Add OwnerSplitCity VARCHAR (255);

Update NashvilleHousing
SET OwnerSplitCity= parsename(replace(OwnerAddress, ',', '.'),2)
---------------
ALTER TABLE NashvilleHousing
Add OwnerSplitState NVARCHAR (255);

Update NashvilleHousing
SET OwnerSplitState = parsename(replace(OwnerAddress, ',', '.'),1)



select distinct(SoldAsVacant), count(SoldAsVacant)
from PortfolioProject.dbo.NashvilleHousing
Group by SoldAsVacant
order by 2


select SoldAsVacant
, CASE when SoldAsVacant = 'Y' then 'Yes'
		when SoldAsVacant = 'N' Then 'No'
		Else SoldAsVacant
		End
from PortfolioProject.dbo.NashvilleHousing

update NashvilleHousing
set SoldAsVacant = CASE when SoldAsVacant = 'Y' then 'Yes'
		when SoldAsVacant = 'N' Then 'No'
		Else SoldAsVacant
		End
from PortfolioProject.dbo.NashvilleHousing

WITH RowNumCTE AS(
select *, 
ROW_NUMBER() over(
partition by ParcelID,
	         PropertyAddress,
			 SalePrice,
			 SaleDate,
			 LegalReference
			 Order BY
				uniqueID
				)row_numb
				from PortfolioProject.dbo.NashvilleHousing
				--order by ParcelID
				)
Select *
From RowNumCTE
Where row_num > 1
Order by PropertyAddress


Select *
From PortfolioProject.dbo.NashvilleHousing


ALTER TABLE PortfolioProject.dbo.NashvilleHousing
DROP COLUMN OwnerAddress, TaxDistrict, PropertyAddress, SaleDate



	




select *
from PortfolioProject.dbo.NashvilleHousing
	




			



