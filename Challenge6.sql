

		  -----------------/*1. Demographic Insights*/---------------------------------------------------------------------------
		  -----------------a. Who prefers energy drink more? (male/female/non-binary?----------------------------------------


		  select * from [PortfolioDB].[dbo].[fact_survey_responses];

		  select distinct(Consume_frequency) from [PortfolioDB].[dbo].[fact_survey_responses];

		   select b.Gender,count(a.Respondent_ID) Respondents
		   from [PortfolioDB].[dbo].[fact_survey_responses] a
		   join [PortfolioDB].[dbo].[dim_repondents] b
		   on a.Respondent_ID=b.Respondent_ID
		   where a.Consume_frequency='Daily'---------->we can chage Consume_frequency
		   group by b.Gender
		   order by 2 desc;
		   

		   --Male prefers energy drink more on daily basis


		----------------- b. Which age group prefers energy drinks more?-------------------------------------------------------

		   select b.Age,count(distinct a.Respondent_ID) Respondents
		   from [PortfolioDB].[dbo].[fact_survey_responses] a
		   join [PortfolioDB].[dbo].[dim_repondents] b
		   on a.Respondent_ID=b.Respondent_ID
		   where a.Consume_frequency='Daily'---------->we can chage Consume_frequency
		   group by b.Age
		   order by 2 desc;
		   


		   ---19-30 and 31-45 age group prefers energy drinks more
		---------------c. Which type of marketing reaches the most Youth (15-30)?------------------------------------------------

		   select distinct(b.Age) Age,a.Marketing_channels
		   from [PortfolioDB].[dbo].[fact_survey_responses] a
		   join [PortfolioDB].[dbo].[dim_repondents] b
		   on a.Respondent_ID=b.Respondent_ID
		   where b.Age in ('15-18','19-30')
		   order by 1;
		   

		   ---TV commercials,Outdoor billboards,Print media,Online ads and Other   



		-----------------------------/*2. Consumer Preferences:*/------------------------------------------------------------------


		-----------------------------a. What are the preferred ingredients of energy drinks among respondents?---------------------


		 select Ingredients_expected, count(1) as nos 
		 from [PortfolioDB].[dbo].[fact_survey_responses]
		 group by [Ingredients_expected]
		 order by 2 desc;
		 

		 -----------Caffeine,Vitamins are the preferred ingredients

		 ---------------------------b. What packaging preferences do respondents have for energy drinks?----------------------------

		 select Packaging_preference,count(1) as Respondents 
		 from [PortfolioDB].[dbo].[fact_survey_responses]
		 group by Packaging_preference
		 order by 2 desc;
		 
		 --Compact and portable cans and Innovative bottle design

		 ----------------------------/*3. Competition Analysis*/--------------------------------------------------------------------
		 ----------------------------a. Who are the current market leaders?---------------------------------------------------------

		 select Current_brands, count(1) Respondents
		 from [PortfolioDB].[dbo].[fact_survey_responses]
		 group by Current_brands
		 order by 2 desc;



		 ---Cola-Coka and Bepsi are current market leaders

		 --------------------------b. What are the primary reasons consumers prefer those brands over ours?-------------------------

		  select [Reasons_preventing_trying], count(1) Respondents
		 from [PortfolioDB].[dbo].[fact_survey_responses]
		 group by [Reasons_preventing_trying]
		 order by 2 desc;

		 --Not available locally and Health concerns are reasons consumers prefer those brands over ours
 
 
		 -----------------------/*4. Marketing Channels and Brand Awareness*/-------------------------------------------------------
		------------------------a. Which marketing channel can be used to reach more customers?-------------------------------------
		 ------------------------b. How effective are different marketing strategies and channels in reaching our customers?---------

		select Marketing_channels,count(1) Respondents
		 from [PortfolioDB].[dbo].[fact_survey_responses]
		 group by Marketing_channels
		 order by 2 desc;

		 --Online ads and TV commercials are marketing channel can be used to reach more customers




		--------------------------/*5. Brand Penetration*/------------------------------------------------------------------------------
		--------------------------a. What do people think about our brand? (overall rating)---------------------------------------------
		 select avg(Taste_experience) as Avg_TasteExperience
		 from [PortfolioDB].[dbo].[fact_survey_responses];

		 ---Average Taste experience is 3 out of 5

		select General_perception,count(1) Respondents
		from [PortfolioDB].[dbo].[fact_survey_responses]
		group by General_perception
		 order by 2 desc;

		 ----General perception is Effective and but healthy is in 3rd postion


		select Brand_perception,count(1) Respondents
		from [PortfolioDB].[dbo].[fact_survey_responses]
		group by Brand_perception
		order by 2 desc;

		-------------Neutral and Positive are in high ----Brand_perception is good


		----------------------------b. Which cities do we need to focus more on?----------------------------------------------------------

		 select City,count(Respondent_ID) Respondents
		  FROM [PortfolioDB].[dbo].[dim_repondents] a
		  join [PortfolioDB].[dbo].[dim_cities] b
		  on a.[City_ID]=b.[City_ID]
		  group by City
		  order by 2 desc;


		 ----Chennai,Pune,Kolkata,Ahmedabad,Delhi,Jaipur,Lucknow 



	---------------------------/*6. Purchase Behavior*/-----------------------------------------------------------------------------------
	----------------------------a. Where do respondents prefer to purchase energy drinks?---------------------------------------------
		select Purchase_location,count(1) Respondents 
		from [PortfolioDB].[dbo].[fact_survey_responses]
		group by Purchase_location
		order by 2 desc;

	--Respondents prefer to purchase energy drinks on Supermarkets,Online retailers  

	--4494 respondents prefer to purchase energy drinks in Supermarkets and 2550 prefer on Online retailers



		---------------------------------b. What are the typical consumption situations for energy drinks among respondents?-------------------------
 
		 select Typical_consumption_situations, count(1) Respondents 
		 from [PortfolioDB].[dbo].[fact_survey_responses]
		 group by Typical_consumption_situations
		 order by 2 desc;
		---Sports/exercise and Studying/working late are the typical consumption situations for energy drinks among respondents


		 --------------------------------c. What factors influence respondents' purchase decisions, such as price range and limited edition packaging?----

		 select Limited_edition_packaging,count(1) Respondents
		 from [PortfolioDB].[dbo].[fact_survey_responses]
		 group by Limited_edition_packaging
		 order by 2 desc;

		 select Price_range,count(1) Respondents
		 from [PortfolioDB].[dbo].[fact_survey_responses]
		 group by Price_range
		 order by 2 desc

		 ----50-99 is a good price range


		 ----------------------------/*7. Product Development*/------------------------------------------------------------
		 ----------------------------a. Which area of business should we focus more on our product development? (Branding/taste/availability)


		 --Need to change brand perception from neutral to positive more and less negitive
		 --In general perception it should be more healthy and less dangerous(check General perception query)
		 --Average Taste experience is 3 out of 5 which it should be 4 or above
		 ---it should be available at all places 
		 ----Right now it is available more on Supermarkets and Online retailers more
		 

		 --Recommendations
		 --1) Price should be 50-99 in range.
		 --2) It should be available at all places to purchase immediately.
		 --3) Showing more Health concerns as Respondents choosing other products over this.
		 --4) Making it available in all cities at all places.
		 --5) Increasing campaiging effectively Outdoor billboards,Print media and other.
		 --6) Increasing female count by running campaingn on digital media.
		 --7) Ramcharan will be a good one for brand ambassador as he has good following and healthy image.
		 --8) 19-45 should be our target audience because its easy to reach them through personalised digital campaigns 
		 ---throgh demographics and their life styles.(Facebook ads,Twitter ads and more)
		 --9)Caffeine,Vitamins are the preferred ingredients so if we focus on these taste experience may increase as it is 3 now.
		 --10) Concentrating more cities 
		     









   
  





