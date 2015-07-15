local fieldList = "performance,performance_date,performance_time,call_time,location,leader_name,phone_number,notes"
local editingExistingFlag

command makeFieldsNonEditable
   put null into editingProps["dropShadow"]
   put true into editingProps["lockText"]
   put false into editingProps["showFocusBorder"]
   put false into editingProps["showBorder"]
   put false into editingProps["traversalOn"]

   lock screen
   repeat for each item fieldname in fieldList do
      set the properties of field fieldname to editingProps
   end repeat
   unlock screen
end makeFieldsNonEditable

command makeFieldsEditable
   put 5 into shadowProps["distance"]
   put 21 into shadowProps["size"]
   put shadowProps into editingProps["dropShadow"]
   put true into editingProps["traversalOn"]
   put false into editingProps["lockText"]
   put true into editingProps["showFocusBorder"]
   put true into editingProps["showBorder"]

   lock screen
   repeat for each item fieldname in fieldList do
      set the properties of field fieldname to editingProps
   end repeat
   unlock screen
end makeFieldsEditable

command new_Performance
   setEditingExisting false
   lock screen
   set the label of button "edit_performance" to "Submit"
   show button "cancel_edit"
   repeat for each item field_name in fieldList do
      put "" into field field_name
   end repeat
   makeFieldsEditable
   unlock screen
end new_Performance


--Save fields on a card
local fieldList = "username, password, phone_number, email"
