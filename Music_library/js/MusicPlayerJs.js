// Get DOM elements
const playButton = document.getElementById('play-btn');
const progressBar = document.getElementById('progress');
const audio = document.getElementById('audio-song');
const songTitle = document.getElementById('song-title');
const songArtist = document.getElementById('song-artist');

// Function to set song info and play the song
function playSong(title, artist, audioSrc) {
    songTitle.innerText = title;
    songArtist.innerText = artist;
    audio.src = audioSrc;
    audio.play();
    playButton.classList.replace('fa-play', 'fa-pause');
}

// Play button toggle and progress update
playButton.addEventListener('click', () => {
    if (audio.paused) {
        audio.play();
        playButton.classList.replace('fa-play', 'fa-pause');
    } else {
        audio.pause();
        playButton.classList.replace('fa-pause', 'fa-play');
    }
});

// Update progress bar as song plays
audio.addEventListener('timeupdate', () => {
    const progress = (audio.currentTime / audio.duration) * 100;
    progressBar.style.width = `${progress}%`;
});

// Reset progress bar when song ends
audio.addEventListener('ended', () => {
    playButton.classList.replace('fa-pause', 'fa-play');
    progressBar.style.width = '0%';
});

// Allow user to click on the progress bar to seek
progressBar.parentElement.addEventListener('click', (e) => {
    const progressBarWidth = progressBar.parentElement.offsetWidth;
    const clickPosition = e.offsetX;
    const newTime = (clickPosition / progressBarWidth) * audio.duration;
    audio.currentTime = newTime;
});

// Handle dragging functionality
let isDragging = false;

progressBar.parentElement.addEventListener('mousedown', (e) => {
    isDragging = true;
    updateProgressBar(e);
});

document.addEventListener('mousemove', (e) => {
    if (isDragging) {
        updateProgressBar(e);
    }
});

document.addEventListener('mouseup', () => {
    isDragging = false;
});

function updateProgressBar(e) {
    const progressBarWidth = progressBar.parentElement.offsetWidth;
    const offsetX = e.offsetX || e.clientX - progressBar.parentElement.getBoundingClientRect().left;
    const newWidth = Math.min(Math.max(offsetX, 0), progressBarWidth);
    const newTime = (newWidth / progressBarWidth) * audio.duration;

    progressBar.style.width = `${(newWidth / progressBarWidth) * 100}%`;
    audio.currentTime = newTime;
}

// Optional: Add mouse events to show a tooltip or pointer on hover over the progress bar
progressBar.parentElement.addEventListener('mousemove', (e) => {
    const progressBarWidth = progressBar.parentElement.offsetWidth;
    const mousePosition = e.offsetX;
    const tooltip = document.querySelector('.tooltip');
    const newTime = (mousePosition / progressBarWidth) * audio.duration;
    const minutes = Math.floor(newTime / 60);
    const seconds = Math.floor(newTime % 60);
    tooltip.style.left = `${mousePosition}px`;
    tooltip.innerText = `${minutes}:${seconds < 10 ? '0' : ''}${seconds}`;
});

progressBar.parentElement.addEventListener('mouseleave', () => {
    const tooltip = document.querySelector('.tooltip');
    tooltip.style.left = `-9999px`;  // Hide tooltip when not hovering
});

// Example function to play a specific song
function loadSong(song) {
    playSong(song.title, song.artist, song.audioSrc);
}

// Example usage
document.getElementById('play-btn').addEventListener('click', () => {
    const song = {
        title: "Old Town Road",
        artist: "Lil Nas X feat. Billy Ray Cyrus",
        audioSrc: "path/to/your/song.mp3" // Update with actual path
    };
    loadSong(song);
});