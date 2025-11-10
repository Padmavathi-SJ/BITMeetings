# Point History Feature Implementation

## Overview
This document describes the implementation of the point history tracking feature for forwarded meeting points. Users can now view the complete history of any discussion point across multiple meetings.

## Features Implemented

### 1. **Backend API Endpoint**
- **File**: `backend/controllers/meetingController.js`
- **Endpoint**: `GET /api/meetings/forwarded-point-history/:pointId`
- **Functionality**: 
  - Traces point history by matching `point_name` across all meetings
  - Returns chronological history with meeting details, assigned members, todos, remarks, and admin approvals
  - Includes authorization checks to ensure only authorized users can access history
  - Shows data from: meeting details, assigned members, todos, remarks, admin status

### 2. **Point History Modal Component**
- **File**: `src/components/PointHistoryModal.jsx`
- **UI**: Material-UI Dialog with Timeline visualization
- **Features**:
  - Timeline-based chronological display
  - Color-coded status indicators (Approved: green, Pending: orange, Disagreed: red, Forwarded: blue)
  - Shows meeting name, date, assigned members, todos, and admin remarks
  - Loading state with skeleton animation
  - Empty state when no history exists
  - Responsive design

### 3. **Integration Points**

#### a. Template Creation Page (`template1.jsx`)
- **Location**: Meeting creation from template with forwarded points
- **Features**:
  - Member assignment to forwarded points before scheduling
  - Clickable point names (Link component) to view history
  - History modal integration
  - Handler: `handleViewPointHistory(pointId, pointName)`

#### b. Meeting In-Progress Page (`MeetingPage.jsx`)
- **Location**: During active meeting
- **Features**:
  - "View History" link beneath each discussion point name
  - History icon with text link
  - Full modal integration
  - Accessible to both admin and assigned members

#### c. Preview Meeting Page (`PreviewMeeting.jsx`)
- **Location**: Before accepting meeting invite
- **Features**:
  - History link for forwarded points
  - Visible in "Forwarded from previous meeting" section
  - Allows users to review point context before accepting invite

## User Flow

### 1. **Before Scheduling (template1.jsx)**
- Admin creates meeting from template
- Forwarded points are displayed with member assignment
- Click on point name → View complete history
- Assign members to forwarded points
- Schedule meeting

### 2. **Before Accepting Invite (PreviewMeeting.jsx)**
- User receives meeting invite
- Views meeting preview
- For forwarded points, sees "Forwarded from previous meeting" message
- Clicks "View History" link → See point's journey across meetings
- Makes informed decision about meeting acceptance

### 3. **During Meeting (MeetingPage.jsx)**
- Meeting is in progress
- Discussion points are displayed
- Each point has "View History" link below the title
- Click to view complete context and past decisions
- Helps in making informed decisions during discussion

## Technical Details

### State Management
```javascript
const [historyModalOpen, setHistoryModalOpen] = useState(false);
const [selectedPointHistory, setSelectedPointHistory] = useState([]);
const [historyLoading, setHistoryLoading] = useState(false);
const [selectedPointName, setSelectedPointName] = useState("");
```

### API Call
```javascript
const handleViewPointHistory = async (pointId, pointName) => {
  setHistoryLoading(true);
  setHistoryModalOpen(true);
  setSelectedPointName(pointName);

  try {
    const token = localStorage.getItem("token");
    const response = await axios.get(
      `http://localhost:3000/api/meetings/forwarded-point-history/${pointId}`,
      { headers: { Authorization: `Bearer ${token}` } }
    );
    setSelectedPointHistory(response.data.history || []);
  } catch (error) {
    console.error("Error fetching point history:", error);
    setSelectedPointHistory([]);
  } finally {
    setHistoryLoading(false);
  }
};
```

### Modal Component Usage
```jsx
<PointHistoryModal
  open={historyModalOpen}
  onClose={handleCloseHistoryModal}
  pointName={selectedPointName}
  history={selectedPointHistory}
  loading={historyLoading}
/>
```

## Database Schema
The feature uses the following database structure:
- **meeting_points**: Stores current and historical discussion points
- **meeting**: Meeting metadata (name, date, status)
- **users**: User information for assigned members
- **meeting_point_future**: Forward tracking (for template forwarded points)

## Security
- JWT token-based authentication required
- Authorization checks ensure users can only view history for:
  - Meetings they created
  - Meetings where they are members
  - Points they are assigned to

## Dependencies
- **Backend**: express, mysql2, jsonwebtoken
- **Frontend**: 
  - @mui/material (Dialog, Link, Chip, Typography, Box)
  - @mui/lab (Timeline components)
  - @mui/icons-material (History, CheckCircle, Cancel, Forward, Schedule)
  - axios
  - date-fns (for date formatting)

## Files Modified

### Backend
1. `backend/controllers/meetingController.js` - Added `getForwardedPointHistory` function
2. `backend/routes/meetingRoutes.js` - Added route for history endpoint

### Frontend
1. `src/components/PointHistoryModal.jsx` - New component created
2. `src/components/template1.jsx` - Added history view capability
3. `src/pages/MeetingPage.jsx` - Added history view during meeting
4. `src/components/PreviewMeeting.jsx` - Added history view before invite acceptance

## Testing Checklist
- [ ] Verify history displays correctly in template1.jsx
- [ ] Test member assignment to forwarded points
- [ ] Verify history in MeetingPage.jsx during active meeting
- [ ] Test history in PreviewMeeting.jsx before acceptance
- [ ] Verify authorization (only authorized users see history)
- [ ] Test with points that have no history
- [ ] Test with points having multiple historical entries
- [ ] Verify Timeline visualization shows correct chronology
- [ ] Test loading states and error handling
- [ ] Verify responsive design on different screen sizes

## Future Enhancements
- Add filtering by date range
- Export history to PDF
- Add search within history
- Show decision statistics (approval rate, etc.)
- Add comments/notes to historical entries
