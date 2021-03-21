window.onload = function() {
    this.initBody();
}

messageDivId = "message"
dateDivId = "date"
dateId = "date-text"
lineId = "line"
messageId = "message-text"
otherContentId = "other-content"


function initBody() {
    /**
     * Function called when the body is loaded.
     * 
     * Do everything like adding an event listener to
     * other things.
     */
    // If running on local, just read the conf
       parseAndCreate();
       return;
    }



function buildMsg() {
    /**
     * Build a nice message for the user.
     */
    date = new Date()
    currentHour = date.getHours()
    currentMinute = date.getMinutes()
    currentTime = currentHour + (0.01 * currentMinute)

    if (inRange(currentTime, 0, 0.59))
        return "It's getting late. Time to wrap up your stuff."
    if (inRange(currentTime, 1, 1.59))
        return "It's too late, you need to sleep now."
    if (inRange(currentTime, 2, 5.59))
        return "Well I hope you know you're dead tomorrow."
    if (inRange(currentTime, 6, 8.29))
        return "Hey, what's going on, you sure are up early."
    if (inRange(currentTime, 8.30, 10.59))
        return "Good Morning, Sunshine!"
    if (inRange(currentTime, 11, 14.59))
        return "Hello. I hope you're having a good day :)"
    if (inRange(currentTime, 15, 17.59))
        return "Good Afternoon!"
    if (inRange(currentTime, 18, 21.59))
        return "Good Evening! Don't forget dinner!"
    if (inRange(currentTime, 22, 24))
        return "Hey, did you do dailies? Post a pic?"
    else
        return "Hello, Laula!"
}

function updateTime() {
    /**
     * Get the current time and date and return it.
     */
    currentDate = new Date()
    options = {
                day: 'numeric',
                month: 'short',
                hour: 'numeric',
                minute: 'numeric',
                hour12: false,
                timeZone: 'Europe/Berlin'
                //locales: 'en-US'
            }
    finalDate = currentDate.toLocaleString("en-US", options)
    document.getElementById(dateId).textContent = finalDate
}

function updateTimeHook() {
    updateTime()
    interval = setInterval(() => {
        updateTime()
    }, 30 * 1000)
}

function updateMessageHook(){
    builtMsg = buildMsg()
    document.getElementById(messageId).textContent = builtMsg
    interval = setInterval(() => {
        builtMsg = buildMsg()
        document.getElementById(messageId).textContent = builtMsg
    }, 30 * 1000)
    
}


function parseAndCreate() {
    // Build a message for the user
    updateMessageHook()
    // Update Time
    updateTimeHook()    
}


// Utility functions
    
function inRange(number, min, max) {
    return (number >= min && number <= max)
}

