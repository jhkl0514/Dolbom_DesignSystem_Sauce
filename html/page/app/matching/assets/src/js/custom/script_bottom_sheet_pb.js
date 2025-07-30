// Select DOM elements
const showModalBtns = document.querySelectorAll(".show-modal");
const bottomSheets = document.querySelectorAll(".bottom-sheet_handle");
const sheetOverlays = document.querySelectorAll(".sheet-overlay");
const closeButtons = document.querySelectorAll(".close_modal");
const dragIcons = document.querySelectorAll(".drag-icon");

// Global variables for tracking drag events
let isDragging = false, startY, startHeight, activeSheet, activeSheetContent;

// Prevent body scroll when modal is open
const preventBodyScroll = (e) => {
    if (!activeSheet) return; // No active sheet, allow default scroll
    e.preventDefault(); // Prevent default scroll behavior
};

// Allow scrolling inside the modal only
const allowScrollWithinModal = (e) => {
    const { scrollTop, scrollHeight, clientHeight } = activeSheetContent;
    const atTop = scrollTop === 0;
    const atBottom = scrollTop + clientHeight === scrollHeight;

    if ((atTop && e.deltaY < 0) || (atBottom && e.deltaY > 0)) {
        e.preventDefault(); // Prevent scrolling beyond the content
    }
};

// Show the bottom sheet and prevent background scrolling
const showBottomSheet = (sheet) => {
    if (activeSheet) hideBottomSheet();
    activeSheet = sheet;
    activeSheetContent = sheet.querySelector(".content");
    activeSheet.classList.add("show");

    // Prevent body scroll on iOS devices
    document.body.style.overflow = "hidden";
    document.body.style.touchAction = "none"; // Prevent background touch scroll
    updateSheetHeight(95, activeSheetContent);

    // Add touchmove listener for background scroll prevention
    //document.addEventListener("touchmove", preventBodyScroll, { passive: false });
    document.addEventListener("wheel", preventBodyScroll, { passive: true });
    activeSheetContent.addEventListener("wheel", allowScrollWithinModal, { passive: true });

    // Add event listeners to internal show-modal buttons
    const internalShowModalBtns = activeSheet.querySelectorAll(".show-modal");
    internalShowModalBtns.forEach(btn => {
        btn.addEventListener("click", handleModalButtonClick);
    });
};

// Hide the bottom sheet and restore body scrolling
const hideBottomSheet = () => {
    if (activeSheet) {
        activeSheet.classList.remove("show");
        document.body.style.overflow = "auto"; // Restore body scroll
        document.body.style.touchAction = "auto"; // Restore normal touch behavior
        activeSheet = null;

        // Remove touchmove listener
        document.removeEventListener("touchmove", preventBodyScroll);
        document.removeEventListener("wheel", preventBodyScroll);
        if (activeSheetContent) {
            activeSheetContent.removeEventListener("wheel", allowScrollWithinModal);
        }
    }
};

// Sets initial drag position, sheetContent height and add dragging class to the bottom sheet
const dragStart = (e) => {
    isDragging = true;
    startY = e.pageY || e.touches?.[0].pageY;
    startHeight = parseInt(activeSheetContent.style.height);
    activeSheet.classList.add("dragging");
};

// Calculates the new height for the sheet content and call the updateSheetHeight function
const dragging = (e) => {
    if (!isDragging) return;
    const delta = startY - (e.pageY || e.touches?.[0].pageY);
    const newHeight = startHeight + delta / window.innerHeight * 100;
    updateSheetHeight(newHeight, activeSheetContent);
};

// Determines whether to hide, set to fullscreen, or set to default height based on the current height of the sheet content
const dragStop = () => {
    if (!isDragging) return;
    isDragging = false;
    activeSheet.classList.remove("dragging");
    const sheetHeight = parseInt(activeSheetContent.style.height);
    sheetHeight < 25 ? hideBottomSheet() : sheetHeight > 75 ? updateSheetHeight(100, activeSheetContent) : updateSheetHeight(50, activeSheetContent);
};

// Update the height of the sheet content and manage fullscreen class toggle
const updateSheetHeight = (height, sheetContent) => {
    sheetContent.style.height = `${height}vh`; // updates the height of the sheet content
    // Toggles the fullscreen class to bottomSheet if the height is equal to 100
    activeSheet.classList.toggle("fullscreen", height === 100);
};

dragIcons.forEach(dragIcon => {
    dragIcon.addEventListener("mousedown", dragStart);
    dragIcon.addEventListener("touchstart", dragStart);
});

document.addEventListener("mousemove", dragging);
document.addEventListener("mouseup", dragStop);

document.addEventListener("touchmove", dragging);
document.addEventListener("touchend", dragStop);

sheetOverlays.forEach(overlay => {
    overlay.addEventListener("click", hideBottomSheet);
});

closeButtons.forEach(closeButton => {
    closeButton.addEventListener("click", hideBottomSheet);
});

// Function to handle modal button click
const handleModalButtonClick = (e) => {
    const btn = e.currentTarget;
    const modalId = btn.classList.contains("region01_btn_evt") ? "#region01_modal" : 
                    btn.classList.contains("region02_btn_evt") ? "#region02_modal" : 
                    btn.classList.contains("region03_btn_evt") ? "#region03_modal" :
                    btn.classList.contains("welInfo") ? "#welInfo_modal" : null;
    if (modalId) {
        const targetSheet = document.querySelector(modalId);
        hideBottomSheet();
        showBottomSheet(targetSheet);
    }
};

// Add event listeners to all show-modal buttons
const addShowModalListeners = () => {
    const allShowModalBtns = document.querySelectorAll(".show-modal");
    allShowModalBtns.forEach(btn => {
        btn.addEventListener("click", handleModalButtonClick);
    });
};

// Initial setup for existing buttons
addShowModalListeners();
