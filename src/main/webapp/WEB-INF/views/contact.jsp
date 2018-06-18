			<form action="#" autocomplete="on" method="post">
				<div class="row">
					<div class="col-25">
						<label for="fname">First Name</label>
					</div>
					<div class="col-75">
						<input type="text" id="fname" name="firstname"
							placeholder="Your name.." autofocus required maxlength="50">
					</div>
				</div>
				<div class="row">
					<div class="col-25">
						<label for="lname">Last Name</label>
					</div>
					<div class="col-75">
						<input type="text" id="lname" name="lastname"
							placeholder="Your last name.." required maxlength="50">
					</div>
				</div>
				<div class="row">
					<div class="col-25">
						<label for="country">Country</label>
					</div>
					<div class="col-75">
						<select id="country" name="country">
							<option value="australia">Australia</option>
							<option value="canada">Canada</option>
							<option value="usa">USA</option>
						</select>
					</div>
				</div>
				<div class="row">
					<div class="col-25">
						<label for="pincdoe">Pincode</label>
					</div>
					<div class="col-75">		
  <input type="text" name="pincdoe" pattern="[A-Za-z][0-9][A-Za-z] [0-9][A-Za-z][0-9]">
					</div>
				</div>
				<div class="row">
					<div class="col-25">
						<label for="txtemail">Email</label>
					</div>
					<div class="col-75">		
  						<input type="email" name="txtemail">
					</div>
				</div>
				<div class="row">
					<div class="col-25">
						<label for="subject">Subject</label>
					</div>
					<div class="col-75">
						<textarea id="subject" name="subject"
							placeholder="Write something.." style="height: 200px"></textarea>
					</div>
				</div>
		
				
				<div class="row">
					<input type="submit" value="Submit">
				</div>
				</form>