(defrule startup
	=>
	(printout t "|---------------------|" crlf)
	(printout t "| Welcome to Majorly! |" crlf)
	(printout t "|---------------------|" crlf crlf)

	(printout t "A system to help you choose your university major." crlf)
	(printout t "to Start, most questions will be Yes/No questions. to Answer you may use Y for Yes and N for No." crlf)
	(printout t "This quiz may take from 5 to 10 minutes." crlf)

	(printout t "*WARNING THIS SYSTEM IS CASE SENSTIVE, PLEASE USE Y AND N ONLY." crlf)

	(printout t "Start Now?" crlf)

	(assert (start (read)))
)


(defrule q1
   (start Y)
   =>
   (printout t "Let's start easily!" crlf)
   (printout t "Do you enjoy working with a team? (Y | N)" crlf)
   (assert (team (read)))
)

(defrule help
   (start Y)
   (team Y)
   =>
   (printout t "Do you like helping people? (Y | N)" crlf)
   (assert (helpful (read)))
)
   


(defrule team1
   (start Y)
   (team Y)
   (helpful Y)
   =>
   (printout t "Are you comfortable with the idea of working in a high-stress environment? (Y | N)" crlf)
   (assert (stress (read)))
)
   
   
(defrule stress1
   (start Y)
   (team Y)
   (helpful Y)
   (stress Y)
   =>
   (printout t "Do you want to work in a hospital or clinical setting? (Y | N)" crlf)
   (assert (hosp (read)))
)


 (defrule hosp1
   (start Y)
   (team Y)
   (helpful Y)
   (stress Y)
   (hosp Y)
   =>
   (printout t "Are you interested in working directly with patients? (Y | N)" crlf)
   (assert (pat (read)))
)


(deffunction print-res(?res)
     (printout t "According to the answers you've provided, " ?res " seems to be a good fit for you!" crlf)

   (printout t "It is always recommended to do further research and speak to professionals in the field 
   to learn more before making a big decision such as choosing a career path." crlf)
   )

 (defrule nursing
   (start Y)
   (team Y)
   (helpful Y)
   (stress Y)
   (hosp Y)
   (pat Y)
   =>
    (printout t crlf crlf crlf)
   	(printout t "|----------------------|" crlf)
	(printout t "|        Nursing!      |" crlf)
	(printout t "|----------------------|" crlf crlf)
 	 (print-res "Nursing")
)


 (defrule onc
   (start Y)
   (team Y)
   (helpful Y)
   (stress Y)
   (or (and (hosp Y)
   			(pat N)) 
   	   (hosp N))
   =>
(printout t "Are you comfortable with the idea of being on call and working long hours? (Y | N)" crlf)
   (assert (oncall (read)))
)

 (defrule procedures
   (start Y)
   (team Y)
   (helpful Y)
   (stress Y)
   (hosp Y)
   (pat N)
   (oncall Y)
   =>
(printout t "Do you have an interest in pursuing a career in surgery or other medical procedures? (Y | N)" crlf)
   (assert (med (read)))
)

 (defrule medicine
   (start Y)
   (team Y)
   (helpful Y)
   (stress Y)
   (hosp Y)
   (pat N)
   (oncall Y)
   (med Y)
   =>
    (printout t crlf crlf crlf)
   	(printout t "|----------------------|" crlf)
	(printout t "|      Pre-Medical!    |" crlf)
	(printout t "|----------------------|" crlf crlf)
     (print-res "Pre-Medical")
)


 (defrule pilotq1
   (start Y)
   (team Y)
   (helpful Y)
   (stress Y)
   (hosp N)
   
   =>
(printout t "Do you enjoy working with complex systems and technology? (Y | N)" crlf)
   (assert (pilot (read)))
)

 (defrule Pilot
   (start Y)
   (team Y)
   (helpful Y)
   (stress Y)
   (hosp N)
   (oncall Y)
   (pilot Y)
   =>
    (printout t crlf crlf crlf)
   	(printout t "|----------------------|" crlf)
	(printout t "|   Airline Piloting!  |" crlf)
	(printout t "|----------------------|" crlf crlf)
	(print-res "Airline Piloting")
)



 (defrule minds
   (start Y)
   (team Y)
   (helpful Y)
   (stress N)
   
   =>
(printout t "Are you fascinated by the workings of the human mind and behavior? (Y | N)" crlf)
   (assert (mind (read)))
)

 (defrule mental
   (start Y)
   (team Y)
   (helpful Y)
   (stress N)
   (mind Y)
   
   =>
(printout t "Do you have a strong desire to understand and help individuals with mental health issues? (Y | N)" crlf)
   (assert (mentalhealth (read)))
)


 (defrule Psych
   (start Y)
   (team Y)
   (helpful Y)
   (stress N)
   (mentalhealth Y)

   =>
    (printout t crlf crlf crlf)
   	(printout t "|----------------------|" crlf)
	(printout t "|      Psychology!     |" crlf)
	(printout t "|----------------------|" crlf crlf)
	(print-res "Psychology")
)

 (defrule neuro
   (start Y)
   (team Y)
   (helpful Y)
   (stress N)
   (mentalhealth N)

   =>
    (printout t crlf crlf crlf)
   	(printout t "|----------------------|" crlf)
	(printout t "|     NeuroScience!    |" crlf)
	(printout t "|----------------------|" crlf crlf)
	(print-res "NeuroScience")
)

 (defrule bus1
   (start Y)
   (team Y)
   (helpful N)   
   =>
(printout t "Are you interested in understanding how businesses operate and make decisions? (Y | N)" crlf)
   (assert (bus (read)))
)

 (defrule bus2
   (start Y)
   (team Y)
   (helpful N)  
   (bus Y) 
   =>
(printout t "Do you enjoy leading and managing teams? (Y | N)" crlf)
   (assert (manage (read)))
)

 (defrule bus3
   (start Y)
   (team Y)
   (helpful N)  
   (bus Y) 
   (manage Y)
   =>
(printout t "Are you comfortable working with numbers and financial data? (Y | N)" crlf)
   (assert (num (read)))
)

 (defrule HospManage
   (start Y)
   (team Y)
   (helpful N)  
   (bus Y) 
   (manage N)
   =>
    (printout t crlf crlf crlf)
   	(printout t "|---------------------------|" crlf)
	(printout t "|  Hospitality Management!  | " crlf)
	(printout t "|---------------------------|" crlf crlf)
	(print-res "Hospitality Management")
)


 (defrule bus4
   (start Y)
   (team Y)
   (helpful N)  
   (bus Y) 
   (manage Y)
   (num Y)
   =>
(printout t "Are you interested in understanding how to create and manage a budget? (Y | N)" crlf)
   (assert (bud (read)))
)

 (defrule BA
   (start Y)
   (team Y)
   (helpful N)  
   (bus Y) 
   (manage Y)
   (num Y)
   (bud Y)

   =>
    (printout t crlf crlf crlf)
   	(printout t "|--------------------------|" crlf)
	(printout t "| Business Administration! |" crlf)
	(printout t "|--------------------------|" crlf crlf)
	(print-res "Business Administration")
)

 (defrule DS
   (start Y)
   (team Y)
   (helpful Y)
   (stress N)
   (mentalhealth N)

   =>
    (printout t crlf crlf crlf)
   	(printout t "|----------------------|" crlf)
	(printout t "|     Data Science!    |" crlf)
	(printout t "|----------------------|" crlf crlf)
	(print-res "Data Science")
)

 (defrule cul1
   (start Y)
   (team Y)
   (helpful N)  
   (or (bus N) (and (bus Y) (manage N)))
   =>
(printout t "Do you have an interest in learning how to cook and prepare different types of food? (Y | N)" crlf)
   (assert (cul1 (read)))
)

 (defrule cul2
   (start Y)
   (team Y)
   (helpful N)  
   (or (bus N) (and (bus Y) (manage N)))
   (cul1 Y)   
   =>
(printout t "Do you have an interest in learning about kitchen management and food safety?(Y | N)" crlf)
   (assert (cul2 (read)))
)

 (defrule CA
   (start Y)
   (team Y)
   (helpful N)  
   (or (bus N) (and (bus Y) (manage N)))
   (cul1 Y) 
   (cul2 Y)

   =>
    (printout t crlf crlf crlf)
   	(printout t "|----------------------|" crlf)
	(printout t "|    Cullinary Arts!   |" crlf)
	(printout t "|----------------------|" crlf crlf)
	(print-res "Cullinary Arts")
)


 (defrule bake
   (start Y)
   (team Y)
   (helpful N)  
   (or (bus N) (and (bus Y) (manage N)))
   (cul1 Y) 
   (cul2 N)

   =>
    (printout t crlf crlf crlf)
   	(printout t "|-------------------------|" crlf)
	(printout t "| Baking and Pastry Arts! |" crlf)
	(printout t "|-------------------------|" crlf crlf)
	(print-res "Baking and Pastry Arts")
)


(defrule env
   (start Y)
   (team N)
   =>
   (printout t "Would you like to work in a classroom setting or a lab? (Y for Classroom | N for Lab)" crlf)
   (assert (clsOlab (read)))
)

(defrule tea1
   (start Y)
   (team N)
   (clsOlab Y)
   =>
   (printout t "Do you have an interest in teaching and working with students? (Y | N)" crlf)
   (assert (teach (read)))
)
   

(defrule tea2
   (start Y)
   (team N)
   (clsOlab Y)
   (teach Y)
   =>
   (printout t "Are you comfortable with the idea of working with students of different ages and abilities? (Y | N)" crlf)
   (assert (teach2 (read)))
)


 (defrule Education
   (start Y)
   (team N)
   (clsOlab Y)
   (teach Y)
   (teach2 Y)

   =>
    (printout t crlf crlf crlf)
   	(printout t "|----------------------|" crlf)
	(printout t "|      Education!      |" crlf)
	(printout t "|----------------------|" crlf crlf)
	(print-res "Education")
)

(defrule Eng
   (start Y)
   (team N)
   (clsOlab Y)
   (or (teach N) (and (teach Y) (teach2 N)))
   =>
   (printout t "Are you passionate about reading and analyzing literature? (Y | N)" crlf)
   (assert (eng1 (read)))
)

 (defrule English
   (start Y)
   (team N)
   (clsOlab Y)
   (or (teach N) (and (teach Y) (teach2 N)))
   (eng1 Y)

   =>
    (printout t crlf crlf crlf)
   	(printout t "|------------------------|" crlf)
	(printout t "|   English Literature!  |" crlf)
	(printout t "|------------------------|" crlf crlf)
	(print-res "English Literature")
)


(defrule engCur
   (start Y)
   (team N)
   (clsOlab Y)
   (or (teach N) (and (teach Y) (teach2 N)))
   (eng1 N)
   =>
   (printout t "Are you interested in understanding how to create lesson plans and curriculum? (Y | N)" crlf)
   (assert (curr (read)))
)


 (defrule Curriculum
   (start Y)
   (team N)
   (clsOlab Y)
   (or (teach N) (and (teach Y) (teach2 N)))
   (eng1 N)
   (curr Y)
   =>
    (printout t crlf crlf crlf)
   	(printout t "|----------------------------|" crlf)
	(printout t "| Curriculum and Instruction!|" crlf)
	(printout t "|----------------------------|" crlf crlf)
	(print-res "Curriculum and Instruction")
)

(defrule alb1
   (start Y)
   (team N)
   (clsOlab N)
   =>
   (printout t "Are you interested in understanding the scientific method and research? (Y | N)" crlf)
   (assert (sci (read)))
)

   (defrule alb2
   (start Y)
   (team N)
   (clsOlab N)
   (sci Y)
   =>
   (printout t "Are you fascinated by living organisms and their functions? (Y | N)" crlf)
   (assert (bi (read)))
)
   
    
    (defrule alb3
   (start Y)
   (team N)
   (clsOlab N)
   (sci Y)
   (bi Y)
   =>
   (printout t "Do you have an interest in understanding the complexity of life and the natural world? (Y | N)" crlf)
   (assert (bio (read)))
)



 (defrule Biology
   (start Y)
   (team N)
   (clsOlab N)
   (sci Y)
   (bi Y)
   (bio Y)
   =>
    (printout t crlf crlf crlf)
   	(printout t "|----------------------|" crlf)
	(printout t "|        Biology!      |" crlf)
	(printout t "|----------------------|" crlf crlf)
	(print-res "Biology")
)
  
      (defrule vet1
   (start Y)
   (team N)
   (clsOlab N)
   (sci Y)
   (bi Y)
   (bio N)
   =>
   (printout t "Are you interested in Animals? (Y | N)" crlf)
   (assert (vett (read)))
)


 (defrule Vet
   (start Y)
   (team N)
   (clsOlab N)
   (sci Y)
   (bi Y)
   (bio N)
   (vett Y)
   =>
    (printout t crlf crlf crlf)
   	(printout t "|-------------------------|" crlf)
	(printout t "|  Veterinarian Medicine! |" crlf)
	(printout t "|-------------------------|" crlf crlf)
	(print-res "Veterinarian Medicine")
)
  

    (defrule phy
   (start Y)
   (team N)
   (clsOlab N)
   (sci Y)
   (bi N)
   =>
   (printout t "Are you interested in understanding the natural laws that govern the universe? (Y | N)" crlf)
   (assert (phys (read)))
)

 (defrule Physics
   (start Y)
   (team N)
   (clsOlab N)
   (sci Y)
   (bi N)
   (phys Y)
   =>
    (printout t crlf crlf crlf)
   	(printout t "|----------------------|" crlf)
	(printout t "|        Physics!      |" crlf)
	(printout t "|----------------------|" crlf crlf)
	(print-res "Physics")
)


   (defrule math1
   (start Y)
   (team N)
   (clsOlab N)
   (sci N)
   =>
   (printout t "Are you comfortable with math and logical reasoning? (Y | N)" crlf)
   (assert (maths (read)))
)

   (defrule comp
   (start Y)
   (team N)
   (clsOlab N)
   (sci N)
   (maths Y)
   =>
   (printout t "Are you interested in understanding how computers work and how to develop software? (Y | N)" crlf)
   (assert (soft (read)))
)

   (defrule comp2
   (start Y)
   (team N)
   (clsOlab N)
   (sci N)
   (maths Y)
   (soft Y)
   =>
   (printout t "Do you enjoy learning about algorithms, data structures and programming languages? (Y | N)" crlf)
   (assert (soft2 (read)))
)


 (defrule CompSci
   (start Y)
   (team N)
   (clsOlab N)
   (sci N)
   (maths Y)
   (soft Y)
   (soft2 Y)
   =>
    (printout t crlf crlf crlf)
   	(printout t "|-----------------------|" crlf)
	(printout t "|   Computer Science!   |" crlf)
	(printout t "|-----------------------|" crlf crlf)
	(print-res "Computer Science")
)



 (defrule Cyber
   (start Y)
   (team N)
   (clsOlab N)
   (sci N)
   (maths Y)
   (soft Y)
   (soft2 N)
   =>
    (printout t crlf crlf crlf)
   	(printout t "|-----------------------|" crlf)
	(printout t "|    Cyber Security!    |" crlf)
	(printout t "|-----------------------|" crlf crlf)
	(print-res "Cyber Security")
)

   (defrule maths1
   (start Y)
   (team N)
   (clsOlab N)
   (sci N)
   (maths Y)
   (soft N)
   =>
    (printout t crlf crlf crlf)
   	(printout t "|-----------------------|" crlf)
	(printout t "|    Mathematics!    |" crlf)
	(printout t "|-----------------------|" crlf crlf)
	(print-res "Mathematics")
)


   (defrule HR1
   (start Y)
   (team N)
   (clsOlab N)
   (sci N)
   =>
    (printout t crlf crlf crlf)
   	(printout t "|-----------------------|" crlf)
	(printout t "|   Human Resources!    |" crlf)
	(printout t "|-----------------------|" crlf crlf)
	(print-res "Human Resources")
)

   (defrule HR2
   (start Y)
   (team N)
   (clsOlab N)
   (sci Y)
   (bi Y)
   (bio N)
   (vett N)
   =>
    (printout t crlf crlf crlf)
   	(printout t "|-----------------------|" crlf)
	(printout t "|   Human Resources!    |" crlf)
	(printout t "|-----------------------|" crlf crlf)
	(print-res "Human Resources")
)


   (defrule HR3
   (start Y)
   (team N)
   (clsOlab Y)
   (or (teach N) (and (teach Y) (teach2 N)))
   (eng1 N)
   (curr N)
   =>
    (printout t crlf crlf crlf)
   	(printout t "|-----------------------|" crlf)
	(printout t "|   Human Resources!    |" crlf)
	(printout t "|-----------------------|" crlf crlf)
	(print-res "Human Resources")
)


   (defrule HR4
   (start Y)
   (team Y)
   (helpful N)  
   (or (bus N) (and (bus Y) (manage N)))
   (cul1 N) 
   =>
    (printout t crlf crlf crlf)
   	(printout t "|-----------------------|" crlf)
	(printout t "|   Human Resources!    |" crlf)
	(printout t "|-----------------------|" crlf crlf)
	(print-res "Human Resources")
)


