//event.preventDefault(0);
// Selecting elements with updated class names
const audio = document.getElementById('audio');
const playPauseBtn = document.querySelector('.common_player-play-btn'); // Updated selector
const progressBarFill = document.querySelector('.common_player-progress-bar-fill'); // Updated selector
const volumeBar = document.querySelector('.common_player-volume-bar'); // Updated selector
const currentTimeEl = document.getElementById('current-time');
const durationEl = document.getElementById('duration');
const playIcon = '<i class="fa fa-play"></i>';
const pauseIcon = '<i class="fa fa-pause"></i>';

// Play/Pause Functionality
let isPlaying = false;
playPauseBtn.addEventListener('click', () => {
  if (isPlaying) {
    audio.pause();
    playPauseBtn.innerHTML = playIcon;
  } else {
    audio.play();
    playPauseBtn.innerHTML = pauseIcon;
  }
  isPlaying = !isPlaying;
});

// Update Progress Bar
audio.addEventListener('timeupdate', () => {
  const currentTime = audio.currentTime;
  const duration = audio.duration;

  const progressPercent = (currentTime / duration) * 100;
  progressBarFill.style.width = `${progressPercent}%`;

  currentTimeEl.textContent = formatTime(currentTime);
  durationEl.textContent = formatTime(duration || 0);
});

// Seek Functionality
document.querySelector('.common_player-progress-container').addEventListener('click', (e) => { // Updated selector
  const width = e.target.clientWidth;
  const clickX = e.offsetX;
  const duration = audio.duration;

  audio.currentTime = (clickX / width) * duration;
});

// Volume Control
volumeBar.addEventListener('input', () => {
  audio.volume = volumeBar.value;
});

// Format Time (MM:SS)
function formatTime(seconds) {
  const minutes = Math.floor(seconds / 60);
  const secs = Math.floor(seconds % 60);
  return `${minutes}:${secs < 10 ? '0' + secs : secs}`;
}
