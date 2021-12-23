use [PortfolioProject]

select * from [PortfolioProject]..[CovidDeaths]
where continent is not null
order by 3,4


select location, date, total_cases, new_cases, total_deaths, population
from [PortfolioProject].dbo.[CovidDeaths]

order by 1,2

-- Deaths because of Covid.!

select location, date, total_cases, new_cases, total_deaths, population,(total_deaths/ total_cases)*100 as DeathPercentage
from [PortfolioProject].dbo.[CovidDeaths]
where location= 'India'
order by 1,2

-- Total Cases per Population.!

select location, date, population, total_cases,total_deaths, (total_cases/population)*100 as DeathPercentage
from [PortfolioProject].dbo.[CovidDeaths]
where location= 'India'
order by 1,2

-- Highest Infection Count

select location, population, MAX(total_cases) as HighestInfectionCount, Max((total_cases/population))*100 
as PercentPopulationEffected
from [PortfolioProject].dbo.[CovidDeaths]
Group by location, population
order by HighestInfectionCount desc

-- Percent Population Effected

select location, population, MAX(total_cases) as HighestInfectionCount, Max((total_cases/population))*100 
as PercentPopulationEffected
from [PortfolioProject].dbo.[CovidDeaths]
Group by location, population
order by PercentPopulationEffected desc


-- Highest deaths according to the Population.

select location,population, Max(cast(total_deaths as int))
as TotalDeaths
from PortfolioProject.dbo.CovidDeaths
where continent is not null
Group by location, population
order by TotalDeaths DESC


-- Highest deaths according to Continent.

select continent, Max(cast(total_deaths as int))
as TotalDeaths
from PortfolioProject.dbo.CovidDeaths
where continent is not null
Group by continent
order by TotalDeaths DESC

--	Highest Deaths according to Location

select location, Max(cast(total_deaths as int))
as TotalDeaths
from PortfolioProject.dbo.CovidDeaths
where continent is not null
Group by location
order by TotalDeaths DESC

--	Datewise Deaths

select date, Sum(new_cases) as NewCases, Sum (cast(new_deaths as int)) as NewDeaths, sum(cast(new_deaths as int))/sum(new_cases)*100 as DeathPercentage
from PortfolioProject.dbo.CovidDeaths
where continent is not null
Group by date
order by 1,2

--	Worldwide Total Deaths

select Sum(new_cases) as NewCases, Sum (cast(new_deaths as int)) as NewDeaths, sum(cast(new_deaths as int))/sum(new_cases)*100 as DeathPercentage
from PortfolioProject.dbo.CovidDeaths
where continent is not null
order by 1,2





--We'll use these information for our TABLEAU PROJECT:


Select SUM(new_cases) as total_cases, SUM(cast(new_deaths as int)) as total_deaths, SUM(cast(new_deaths as int))/SUM(New_Cases)*100 as DeathPercentage
From PortfolioProject..CovidDeaths
--Where location like '%states%'
where continent is not null 
--Group By date
order by 1,2


Select location, SUM(cast(new_deaths as int)) as TotalDeathCount
From PortfolioProject..CovidDeaths
--Where location like '%states%'
Where continent is null 
and location not in ('World', 'European Union', 'International')
Group by location
order by TotalDeathCount desc


Select Location, Population, MAX(total_cases) as HighestInfectionCount,  Max((total_cases/population))*100 as PercentPopulationInfected
From PortfolioProject..CovidDeaths
--Where location like '%states%'
Group by Location, Population
order by PercentPopulationInfected desc


Select Location, Population,date, MAX(total_cases) as HighestInfectionCount,  Max((total_cases/population))*100 as PercentPopulationInfected
From PortfolioProject..CovidDeaths
--Where location like '%states%'
Group by Location, Population, date
order by PercentPopulationInfected desc

