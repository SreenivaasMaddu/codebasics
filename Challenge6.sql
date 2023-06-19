

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
		 from [PortfolioDB].[dbo].[fact_survey_responses]
		 group by Marketing_channels
		 order by 2 desc;

		 --Online ads and TV commercials are marketing channel can be used to reach more customers




		--------------------------/*5. Brand Penetration*/------------------------------------------------------------------------------
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
		  join [PortfolioDB].[dbo].[dim_cities] b
		  on a.[City_ID]=b.[City_ID]
		  group by City
		  order by 2 desc;


		 ----Chennai,Pune,Kolkata,Ahmedabad,Delhi,Jaipur,Lucknow 






   
  




