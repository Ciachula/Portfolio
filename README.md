# Portfolio projects
## All of my projects in SQL, PowerBI, Excel+VBA, Tableau below:

<details>
<summary>SQL</summary>
<br>
</details>

<details>
<summary>Power BI</summary>
<br>

- Making visualization by using various datasets [[Power BI visualization here.]](https://github.com/Ciachula/Portfolio/tree/main/power_bi)
<img width="1000" alt="userform+offset1" src="https://user-images.githubusercontent.com/31890259/190378506-3f2988b4-ba31-4572-b002-b7ae527cc8ae.png">
<hr>
- Private message for Power BI visualization
<img width="1000" alt="userform+offset1" src="https://user-images.githubusercontent.com/31890259/190377586-9e346bb7-735a-44e8-9d99-1b58c82794a3.png">
<hr>
<img width="1000" alt="userform+offset1" src="https://user-images.githubusercontent.com/31890259/190377737-3d0e4e79-4def-49b9-bb51-60a8259f1a4d.png">
<hr>
<img width="1000" alt="userform+offset1" src="https://user-images.githubusercontent.com/31890259/190377847-c7128d9d-dbf1-4ad0-bb8d-4f3dc891153d.png">
<hr>
<img width="1000" alt="userform+offset1" src="https://user-images.githubusercontent.com/31890259/190377913-b213e41b-2629-4a21-aaea-2b5cfaf14c17.png">
</details>

<details>
<summary>Excel + VBA</summary>
<br>

- Userform (login+password - VBA) and offset function [[Excel file here.]](https://github.com/Ciachula/Portfolio/tree/main/excel)
<img width="854" alt="userform+offset1" src="https://user-images.githubusercontent.com/31890259/187172384-016f4a0f-179d-4783-bdf5-b6e602626db0.PNG">
<br>

````
Private Sub cmdCancel_Click()
Unload Me
End Sub

Private Sub cmdClear_Click()

Me.txtUserID.Value = ""
Me.txtPassword.Value = ""
Me.txtUserID.SetFocus
End Sub

Private Sub cmdLogin_Click()

Dim user As String
Dim password As String

user = Me.txtUserID.Value
password = Me.txtPassword.Value

If (user = "admin" And password = "admin") Then
Unload Me
Application.Visible = True
Application.ScreenUpdating = False
Worksheets("Sheet1").Visible = True
Worksheets("Sheet2").Visible = True
Else
MsgBox "Invalid login credentials, Please try again", vbOKOnly + vbCritical, "Error during login phase"
End If

Private Sub Workbook_BeforeClose(Cancel As Boolean)
Application.ScreenUpdating = False
Worksheets("Sheet1").Visible = xlVeryHidden
Worksheets("Sheet2").Visible = xlVeryHidden
ThisWorkbook.Save  
End Sub
````
<hr>
<img width="892" alt="userform+offset2" src="https://user-images.githubusercontent.com/31890259/187172490-61cdf02c-84a8-4167-afb4-63fd7e17d8d3.PNG">
<br>
<hr>

- LOOKUP, INDEX + MATCH, SUMIFS [[Excel file here.]](https://github.com/Ciachula/Portfolio/tree/main/excel)
<img width="850" alt="Customer_Quote" src="https://user-images.githubusercontent.com/31890259/188129364-01ea1faf-f8df-4b7c-868b-69d3c483da30.PNG">
<img width="850" alt="Discount_Matrix" src="https://user-images.githubusercontent.com/31890259/188139323-b5c57b1c-0be9-4be2-b168-ea8aa5a3635d.PNG">
<br>
<hr>
  
- Data modeling using Solver [[Excel file here.]](https://github.com/Ciachula/Portfolio/tree/main/excel)
<img width="850" alt="Solver" src="https://user-images.githubusercontent.com/31890259/188129477-32cce196-0609-4f29-b829-57603ad15a5c.PNG">
<hr>
</details>

<details>
<summary>Tableau</summary>
<br>

- Making visualization by using various datasets [[Tableau profile here.]](https://public.tableau.com/app/profile/goodgrenade)

<img width="1050" alt="Solver" src="https://user-images.githubusercontent.com/31890259/190346432-6aa219dd-629b-4fa9-9388-047490ef4e07.png">
<hr>
<img width="1050" alt="Solver" src="https://user-images.githubusercontent.com/31890259/190346655-2b54ec57-9e02-4be4-839e-d7ef87f6e865.png">

</details>




