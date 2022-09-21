select * from dbo.CovidDeaths
order by 3,4

--select * from dbo.CovidVaccinations
--order by 3,4

-- 1. Select Data that we are going to be using

Select Location, date, total_cases, new_cases, total_deaths, population
from PortfolioProject..CovidDeaths
order by 1,2

-- 2. Looking at total Cases vs Total Deaths

Select Location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 as DeathPercentage
from PortfolioProject..CovidDeaths
where location like '%Poland'
order by 1,2

-- Shows likelihood of dying if you contract covid in your country

Select Location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 as DeathPercentage
from PortfolioProject..CovidDeaths
where location like '%Poland'
order by 1,2

-- Shows what percentage of population got Covid

Select Location, date, Population, total_cases, (total_cases/population)*100 as DeathPercentage
from PortfolioProject..CovidDeaths
where location like '%Poland'
order by 1,2

-- Looking at Countries with Lowest Infection Rate compared to Population

Select Location, Population,  MIN(total_cases) as LowestInfectionCount, MIN((total_cases/population))*100 as PercentPopulationInfected
from PortfolioProject..CovidDeaths
group by Location, population
order by PercentPopulationInfected desc

-- Looking at start of covid in Poland
Select Location, sum(total_cases) as Total_Cases, date
from PortfolioProject..CovidDeaths
where location = 'Poland'
group by location, date
order by Total_Cases;

-- Showing which continent has HighestDeathCount 
-- cast function to change data type

Select continent, MAX(cast(Total_deaths as int)) as TotalDeathCount
from PortfolioProject..CovidDeaths
where continent is not null 
Group by continent
Order by TotalDeathCount desc

-- Showing which of these countries: Poland, Germany, France, Italy has bigger Death Count per Population

Select location, MAX(cast(Total_deaths as int)) as TotalDeathCount
from PortfolioProject..CovidDeaths
where location IN ('Poland', 'Germany', 'France', 'Italy')
Group by location
Order by TotalDeathCount desc
 
-- Looking at Global Numbers across the World

Select SUM(new_cases) as total_cases, SUM(cast(new_deaths as int)) as total_deaths, SUM(cast(new_deaths as int))/SUM(New_cases)*100 as DeathPercentage
From PortfolioProject..CovidDeaths
where continent is not null
order by 1,2

-- database CovidVaccinations
select * 
from PortfolioProject..CovidVaccinations

--Total Population vs Vaccinations (join 2 tables)

select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
from PortfolioProject..CovidVaccinations vac
join PortfolioProject..CovidDeaths dea
on dea.location = vac.location
and dea.date = vac.date
where dea.continent is not null
order by 2,3

--Total Population vs Vaccinations (join 2 tables)

select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations, 
SUM(CONVERT(bigint, vac.new_vaccinations)) over (partition by dea.location order by dea.location, dea.date) as RollingPeopleVaccinated
from PortfolioProject..CovidVaccinations vac
join PortfolioProject..CovidDeaths dea
on dea.location = vac.location
and dea.date = vac.date
where dea.continent is not null
order by 2,3

-- USE CTE

With PopvsVac (Continent, Location, Date, Population, New_Vaccinations, RollingPeopleVaccinated)
as 
(
select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations, 
SUM(CONVERT(int, vac.new_vaccinations)) over (partition by dea.location order by dea.location, dea.date) as RollingPeopleVaccinated
from PortfolioProject..CovidVaccinations vac
join PortfolioProject..CovidDeaths dea
on dea.location = vac.location
and dea.date = vac.date
where dea.continent is not null
)
Select * , (RollingPeopleVaccinated/Population)*100
from PopvsVac

--TEMP Table
Create Table #PercentPopulationVaccinated
(
Continent nvarchar (255),
Location nvarchar (255),
Date datetime,
Population numeric,
New_vaccinations numeric,
RollingPeopleVaccinated numeric
)

Insert into #PercentPopulationVaccinated
select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations, 
SUM(CONVERT(int, vac.new_vaccinations)) over (partition by dea.location order by dea.location, dea.date) as RollingPeopleVaccinated
from PortfolioProject..CovidVaccinations vac
join PortfolioProject..CovidDeaths dea
on dea.location = vac.location
and dea.date = vac.date
where dea.continent is not null

select * from #PercentPopulationVaccinated
