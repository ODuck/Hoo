<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<footer id="footer">
	<!--
				     Social Icons
				     
				     Use anything from here: http://fortawesome.github.io/Font-Awesome/cheatsheet/)
	-->
	<!--
	<ul class="actions">
		<li><a href="#" class="fa solo fa-twitter"><span>Twitter</span></a></li>
		<li><a href="#" class="fa solo fa-facebook"><span>Facebook</span></a></li>
		<li><a href="#" class="fa solo fa-google-plus"><span>Google+</span></a></li>
		<li><a href="#" class="fa solo fa-dribbble"><span>Dribbble</span></a></li>
		<li><a href="#" class="fa solo fa-pinterest"><span>Pinterest</span></a></li>
		<li><a href="#" class="fa solo fa-instagram"><span>Instagram</span></a></li>
	</ul>
	-->
	<!-- Menu -->
	
	<!-- effecter1_start -->
		<div class="md-modal md-effect-12" id="mailMd">
			<div class="md-content">
				<!-- Contact -->
								<div class="content container" style="margin-top: 100px;">
									<div>
										<h2 style="text-align: center;">Sending &nbsp;&nbsp;Message</h2>
									</div>
									<div class="box container small" style="width: 100%; padding-bottom: 0;">
										<form action="mail.php" method="post">
											<div class="row half">
												<div class="6u">
													<input type="text" id="fname" name="fname" class="font_GODOM" placeholder="이  름" />
												</div>
												<div class="6u">
													<input type="text" id="fmail" name="fmail" class="font_GODOM" placeholder="이메일" />
												</div>
											</div>
											<div class="row half">
												<div class="12u">
													<textarea id="message" name="message" class="font_GODOM" placeholder="내용"
														rows="6"></textarea>
												</div>
											</div>
											<div class="row half">
												<div class="6u" style="padding: 0 0 0 5%; text-align: center;">
													<ul class="actions" style="padding: 0;">
														<li style="display: block;"><input type="button" class="button addButton font_GODOM"
															value="    전    송    " onclick="_onSendMail(this.form)" /></li>
													</ul>
												</div>
												<div class="6u" style="padding: 0 0 0 5%; text-align: center;">
													<ul class="actions" style="padding: 0;">
														<li style="display: block;"><input type="button" class="button addButton font_GODOM md-close"
															value="    취    소    " /></li>
													</ul>
												</div>
											</div>
										</form>
						
									</div>
								</div>
			</div>
		</div>
	<!-- effecter1_end -->
	<ul class="menu">
		<li>&copy; Copyright Team Chaser</li>
		<li>Design: J, Develop: s, s, y, o</li>
		<li>Support	:<a href="https://www.facebook.com/ihateflyingbugs"
			style="text-decoration: blink;"> I Hate Flying Bugs</a></li>
		<li>Contact: <a class="ui-button md-trigger" data-modal="mailMd">hsuteamchaser@gmail.com</a></li>
	</ul>
	<!-- effecter2_start -->
		<div class="md-overlay" style="background:rgba(0,0,0,0.6);"></div><!-- the overlay element -->
	
		<!-- classie.js by @desandro: https://github.com/desandro/classie -->
		<script src="js/effecter/classie.js"></script>
		<script src="js/effecter/modalEffects.js"></script>
	
		<!-- for the blur effect -->
		<!-- by @derSchepp https://github.com/Schepp/CSS-Filters-Polyfill -->
		<script>
			// this is important for IEs
			var polyfilter_scriptpath = '/js/';
		</script>
		<script src="js/effecter/cssParser.js"></script>
		<script src="js/effecter/css-filters-polyfill.js"></script>
	<!-- effecter2_end -->
</footer>