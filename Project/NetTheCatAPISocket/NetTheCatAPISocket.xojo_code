#tag Class
Protected Class NetTheCatAPISocket
Inherits URLConnection
	#tag Event
		Sub ContentReceived(URL As String, HTTPStatus As Integer, content As String)
		  #Pragma Unused URL
		  
		  DIM catImage As Picture
		  
		  // only if the HTTP status was successful and the content isn't empty
		  if (HTTPStatus = 200) AND (not content.IsEmpty) then
		    'DIM temp As MemoryBlock = Content.Data
		    'DIM mb As NEW MemoryBlock(Content.Size)
		    'mb.StringValue(0, mb.Size) = temp.StringValue(0, mb.Size)
		    
		    catImage = Picture.FromData(content)
		  end if
		  
		  RaiseEvent CatReceived catImage
		End Sub
	#tag EndEvent

	#tag Event
		Sub Error(e As RuntimeException)
		  Break
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub GetCat()
		  //http://thecatapi.com/api/images/get?format=xml&results_per_page=20
		  
		  
		  Try
		    me.Send("GET","https://thecatapi.com/api/images/get")
		  Catch t As UnsupportedOperationException
		    Return
		  End Try
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event CatReceived(cat As Picture)
	#tag EndHook


	#tag ViewBehavior
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowCertificateValidation"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="HTTPStatusCode"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
