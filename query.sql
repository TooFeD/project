 
select st.Ident_St, st.SFull_name, t.Ident_Task, t.Deadline from Students st join Solutions s on (st.Ident_St = s.Ident_St) join Tasks t on (s.Ident_Task = t.Ident_Task) join Groups gr on (gr.Ident_Group = st.Ident_Group)
where (select count(Ident_Task) from Tasks where Ident_Group = (select Ident_Group from Students where Ident_St = st.Ident_St)) =  (select count(Ident_Task) from Solutions where Ident_St = (select Ident_St from Students where Ident_St=st.Ident_St))


Select * from Teachers;

Select * from Subjects;
Select tas.* from Tasks tas join Subjects sub on (tas.Ident_Subj=sub.Ident_Subj);/* Вивести завдання на конкретний предмет */
Select sol.* from Solutions sol join Tasks tas on (sol.Ident_Task=tas.Ident_Task);/* Вивести рішення на конкретне завдання */

Select * from Faculites;
Select * from Groups gr join Faculites fac on (gr.Ident_Fac = fac.Ident_Fac); /*групи конкретного факультету */
Select st.* from Students st join Groups gr on (st.Ident_Group = gr.Ident_Group); /* Вивести студентів конкретної групи */

Select * from Solutions;
