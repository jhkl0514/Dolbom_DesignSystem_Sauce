<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<header id="page-topbar">
	<div class="layout-width">
		<div class="navbar-header">
			<div class="d-flex">
				<!-- LOGO -->
				<div class="navbar-brand-box horizontal-logo">
					<a href="index.html" class="logo logo-dark"> <span class="logo-sm"> <img src="/assets/images/logo-sm.png" alt="" height="22">
					</span> <span class="logo-lg"> <img src="/assets/images/logo-dark.png" alt="" height="17">
					</span>
					</a> <a href="index.html" class="logo logo-light"> <span class="logo-sm"> <img src="/assets/images/logo-sm.png" alt="" height="22">
					</span> <span class="logo-lg"> <img src="/assets/images/logo-light.png" alt="" height="17">
					</span>
					</a>
				</div>

				<button type="button" class="btn btn-sm px-3 fs-16 header-item vertical-menu-btn topnav-hamburger" id="topnav-hamburger-icon">
					<span class="hamburger-icon"> <span></span> <span></span> <span></span>
					</span>
				</button>

			</div>

			<div class="d-flex align-items-center">

				<div class="ms-1 header-item d-none d-sm-flex">
					<button type="button" class="btn btn-icon btn-topbar btn-ghost-secondary rounded-circle" data-toggle="fullscreen">
						<i class='bx bx-fullscreen fs-22'></i>
					</button>
				</div>

				<div class="ms-1 header-item d-none d-sm-flex">
					<button type="button" class="btn btn-icon btn-topbar btn-ghost-secondary rounded-circle light-dark-mode">
						<i class='bx bx-moon fs-22'></i>
					</button>
				</div>

				<div class="dropdown topbar-head-dropdown ms-1 header-item">
					<button type="button" class="btn btn-icon btn-topbar btn-ghost-secondary rounded-circle" id="page-header-notifications-dropdown" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						<i class='bx bx-bell fs-22'></i> <span class="position-absolute topbar-badge fs-10 translate-middle badge rounded-pill bg-danger">3<span class="visually-hidden">unread messages</span></span>
					</button>
					<div class="dropdown-menu dropdown-menu-lg dropdown-menu-end p-0" aria-labelledby="page-header-notifications-dropdown">

						<div class="dropdown-head bg-primary bg-pattern rounded-top">
							<div class="p-3">
								<div class="row align-items-center">
									<div class="col">
										<h6 class="m-0 fs-16 fw-semibold text-white">Notifications</h6>
									</div>
									<div class="col-auto dropdown-tabs">
										<span class="badge badge-soft-light fs-13"> 4 New</span>
									</div>
								</div>
							</div>

							<div class="px-2 pt-2">
								<ul class="nav nav-tabs dropdown-tabs nav-tabs-custom" data-dropdown-tabs="true" id="notificationItemsTab" role="tablist">
									<li class="nav-item waves-effect waves-light"><a class="nav-link active" data-bs-toggle="tab" href="#all-noti-tab" role="tab" aria-selected="true"> All (4) </a></li>
									<li class="nav-item waves-effect waves-light"><a class="nav-link" data-bs-toggle="tab" href="#messages-tab" role="tab" aria-selected="false"> Messages </a></li>
									<li class="nav-item waves-effect waves-light"><a class="nav-link" data-bs-toggle="tab" href="#alerts-tab" role="tab" aria-selected="false"> Alerts </a></li>
								</ul>
							</div>

						</div>

						<div class="tab-content" id="notificationItemsTabContent">
							<div class="tab-pane fade show active py-2 ps-2" id="all-noti-tab" role="tabpanel">
								<div data-simplebar style="max-height: 300px;" class="pe-2">
									<div class="text-reset notification-item d-block dropdown-item position-relative">
										<div class="d-flex">
											<div class="avatar-xs me-3">
												<span class="avatar-title bg-soft-info text-info rounded-circle fs-16"> <i class="bx bx-badge-check"></i>
												</span>
											</div>
											<div class="flex-1">
												<a href="#!" class="stretched-link">
													<h6 class="mt-0 mb-2 lh-base">
														Your <b>Elite</b> author Graphic Optimization <span class="text-secondary">reward</span> is ready!
													</h6>
												</a>
												<p class="mb-0 fs-11 fw-medium text-uppercase text-muted">
													<span><i class="mdi mdi-clock-outline"></i> Just 30 sec ago</span>
												</p>
											</div>
											<div class="px-2 fs-15">
												<div class="form-check notification-check">
													<input class="form-check-input" type="checkbox" value="" id="all-notification-check01"> <label class="form-check-label" for="all-notification-check01"></label>
												</div>
											</div>
										</div>
									</div>

									<div class="text-reset notification-item d-block dropdown-item position-relative active">
										<div class="d-flex">
											<img src="/assets/images/users/avatar-2.jpg" class="me-3 rounded-circle avatar-xs" alt="user-pic">
											<div class="flex-1">
												<a href="#!" class="stretched-link">
													<h6 class="mt-0 mb-1 fs-13 fw-semibold">Angela Bernier</h6>
												</a>
												<div class="fs-13 text-muted">
													<p class="mb-1">Answered to your comment on the cash flow forecast's graph 🔔.</p>
												</div>
												<p class="mb-0 fs-11 fw-medium text-uppercase text-muted">
													<span><i class="mdi mdi-clock-outline"></i> 48 min ago</span>
												</p>
											</div>
											<div class="px-2 fs-15">
												<div class="form-check notification-check">
													<input class="form-check-input" type="checkbox" value="" id="all-notification-check02" checked> <label class="form-check-label" for="all-notification-check02"></label>
												</div>
											</div>
										</div>
									</div>

									<div class="text-reset notification-item d-block dropdown-item position-relative">
										<div class="d-flex">
											<div class="avatar-xs me-3">
												<span class="avatar-title bg-soft-danger text-danger rounded-circle fs-16"> <i class='bx bx-message-square-dots'></i>
												</span>
											</div>
											<div class="flex-1">
												<a href="#!" class="stretched-link">
													<h6 class="mt-0 mb-2 fs-13 lh-base">
														You have received <b class="text-success">20</b> new messages in the conversation
													</h6>
												</a>
												<p class="mb-0 fs-11 fw-medium text-uppercase text-muted">
													<span><i class="mdi mdi-clock-outline"></i> 2 hrs ago</span>
												</p>
											</div>
											<div class="px-2 fs-15">
												<div class="form-check notification-check">
													<input class="form-check-input" type="checkbox" value="" id="all-notification-check03"> <label class="form-check-label" for="all-notification-check03"></label>
												</div>
											</div>
										</div>
									</div>

									<div class="text-reset notification-item d-block dropdown-item position-relative">
										<div class="d-flex">
											<img src="/assets/images/users/avatar-8.jpg" class="me-3 rounded-circle avatar-xs" alt="user-pic">
											<div class="flex-1">
												<a href="#!" class="stretched-link">
													<h6 class="mt-0 mb-1 fs-13 fw-semibold">Maureen Gibson</h6>
												</a>
												<div class="fs-13 text-muted">
													<p class="mb-1">We talked about a project on linkedin.</p>
												</div>
												<p class="mb-0 fs-11 fw-medium text-uppercase text-muted">
													<span><i class="mdi mdi-clock-outline"></i> 4 hrs ago</span>
												</p>
											</div>
											<div class="px-2 fs-15">
												<div class="form-check notification-check">
													<input class="form-check-input" type="checkbox" value="" id="all-notification-check04"> <label class="form-check-label" for="all-notification-check04"></label>
												</div>
											</div>
										</div>
									</div>

									<div class="my-3 text-center">
										<button type="button" class="btn btn-soft-success waves-effect waves-light">
											View All Notifications <i class="ri-arrow-right-line align-middle"></i>
										</button>
									</div>
								</div>

							</div>

							<div class="tab-pane fade py-2 ps-2" id="messages-tab" role="tabpanel" aria-labelledby="messages-tab">
								<div data-simplebar style="max-height: 300px;" class="pe-2">
									<div class="text-reset notification-item d-block dropdown-item">
										<div class="d-flex">
											<img src="/assets/images/users/avatar-3.jpg" class="me-3 rounded-circle avatar-xs" alt="user-pic">
											<div class="flex-1">
												<a href="#!" class="stretched-link">
													<h6 class="mt-0 mb-1 fs-13 fw-semibold">James Lemire</h6>
												</a>
												<div class="fs-13 text-muted">
													<p class="mb-1">We talked about a project on linkedin.</p>
												</div>
												<p class="mb-0 fs-11 fw-medium text-uppercase text-muted">
													<span><i class="mdi mdi-clock-outline"></i> 30 min ago</span>
												</p>
											</div>
											<div class="px-2 fs-15">
												<div class="form-check notification-check">
													<input class="form-check-input" type="checkbox" value="" id="messages-notification-check01"> <label class="form-check-label" for="messages-notification-check01"></label>
												</div>
											</div>
										</div>
									</div>

									<div class="text-reset notification-item d-block dropdown-item">
										<div class="d-flex">
											<img src="/assets/images/users/avatar-2.jpg" class="me-3 rounded-circle avatar-xs" alt="user-pic">
											<div class="flex-1">
												<a href="#!" class="stretched-link">
													<h6 class="mt-0 mb-1 fs-13 fw-semibold">Angela Bernier</h6>
												</a>
												<div class="fs-13 text-muted">
													<p class="mb-1">Answered to your comment on the cash flow forecast's graph 🔔.</p>
												</div>
												<p class="mb-0 fs-11 fw-medium text-uppercase text-muted">
													<span><i class="mdi mdi-clock-outline"></i> 2 hrs ago</span>
												</p>
											</div>
											<div class="px-2 fs-15">
												<div class="form-check notification-check">
													<input class="form-check-input" type="checkbox" value="" id="messages-notification-check02"> <label class="form-check-label" for="messages-notification-check02"></label>
												</div>
											</div>
										</div>
									</div>

									<div class="text-reset notification-item d-block dropdown-item">
										<div class="d-flex">
											<img src="/assets/images/users/avatar-6.jpg" class="me-3 rounded-circle avatar-xs" alt="user-pic">
											<div class="flex-1">
												<a href="#!" class="stretched-link">
													<h6 class="mt-0 mb-1 fs-13 fw-semibold">Kenneth Brown</h6>
												</a>
												<div class="fs-13 text-muted">
													<p class="mb-1">Mentionned you in his comment on 📃 invoice #12501.</p>
												</div>
												<p class="mb-0 fs-11 fw-medium text-uppercase text-muted">
													<span><i class="mdi mdi-clock-outline"></i> 10 hrs ago</span>
												</p>
											</div>
											<div class="px-2 fs-15">
												<div class="form-check notification-check">
													<input class="form-check-input" type="checkbox" value="" id="messages-notification-check03"> <label class="form-check-label" for="messages-notification-check03"></label>
												</div>
											</div>
										</div>
									</div>

									<div class="text-reset notification-item d-block dropdown-item">
										<div class="d-flex">
											<img src="/assets/images/users/avatar-8.jpg" class="me-3 rounded-circle avatar-xs" alt="user-pic">
											<div class="flex-1">
												<a href="#!" class="stretched-link">
													<h6 class="mt-0 mb-1 fs-13 fw-semibold">Maureen Gibson</h6>
												</a>
												<div class="fs-13 text-muted">
													<p class="mb-1">We talked about a project on linkedin.</p>
												</div>
												<p class="mb-0 fs-11 fw-medium text-uppercase text-muted">
													<span><i class="mdi mdi-clock-outline"></i> 3 days ago</span>
												</p>
											</div>
											<div class="px-2 fs-15">
												<div class="form-check notification-check">
													<input class="form-check-input" type="checkbox" value="" id="messages-notification-check04"> <label class="form-check-label" for="messages-notification-check04"></label>
												</div>
											</div>
										</div>
									</div>

									<div class="my-3 text-center">
										<button type="button" class="btn btn-soft-success waves-effect waves-light">
											View All Messages <i class="ri-arrow-right-line align-middle"></i>
										</button>
									</div>
								</div>
							</div>
							<div class="tab-pane fade p-4" id="alerts-tab" role="tabpanel" aria-labelledby="alerts-tab">
								<div class="w-25 w-sm-50 pt-3 mx-auto">
									<img src="/assets/images/svg/bell.svg" class="img-fluid" alt="user-pic">
								</div>
								<div class="text-center pb-5 mt-2">
									<h6 class="fs-18 fw-semibold lh-base">Hey! You have no any notifications</h6>
								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="dropdown ms-sm-3 header-item topbar-user">
					<button type="button" class="btn" id="page-header-user-dropdown" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						<span class="d-flex align-items-center"> <img class="rounded-circle header-profile-user" src="https://avatars.dicebear.com/api/adventurer/testtest.svg" alt="Header Avatar"> <span class="text-start ms-xl-2"> <span class="d-none d-xl-inline-block ms-1 fw-medium user-name-text">홍길동</span> <span class="d-none d-xl-block ms-1 fs-12 text-muted user-name-sub-text">개발</span>
						</span>
						</span>
					</button>
					<div class="dropdown-menu dropdown-menu-end">
						<!-- item-->
						<h6 class="dropdown-header">목록</h6>
						<a class="dropdown-item" href="/profile/edit?id=${param.id}"><i class="mdi mdi-account-circle text-muted fs-16 align-middle me-1"></i> <span class="align-middle">프로필</span></a> <a class="dropdown-item" href=""><i class="mdi mdi-message-text-outline text-muted fs-16 align-middle me-1"></i> <span class="align-middle">Messages</span></a> <a class="dropdown-item" href="apps-tasks-kanban.html"><i class="mdi mdi-calendar-check-outline text-muted fs-16 align-middle me-1"></i> <span class="align-middle">Taskboard</span></a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="pages-profile-settings.html"><span class="badge bg-soft-success text-success mt-1 float-end">New</span><i class="mdi mdi-cog-outline text-muted fs-16 align-middle me-1"></i> <span class="align-middle">Settings</span></a> <a class="dropdown-item" href="auth-lockscreen-basic.html"><i class="mdi mdi-lock text-muted fs-16 align-middle me-1"></i> <span class="align-middle">Lock screen</span></a> <a class="dropdown-item" href="/login/logout"><i class="mdi mdi-logout text-muted fs-16 align-middle me-1"></i> <span class="align-middle" data-key="t-logout">로그아웃</span></a>
					</div>
				</div>
			</div>
		</div>
	</div>
</header>

