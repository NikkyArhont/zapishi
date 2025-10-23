const canvas = document.getElementById('gameCanvas');
const ctx = canvas.getContext('2d');
const overlay = document.getElementById('overlay');
const scoreValue = document.getElementById('scoreValue');
const errorsValue = document.getElementById('errorsValue');
const startBtn = document.getElementById('startBtn');
const pauseBtn = document.getElementById('pauseBtn');
const controlButtons = document.querySelectorAll('.control');

let isRunning = false;
let isPaused = false;
let score = 0;
let errors = 0;
let eggs = [];
let lastTimestamp = 0;
let spawnTimer = 0;
let tracks = {};

const MAX_ERRORS = 3;

const wolfPosition = {
  side: 'left',
  level: 'bottom'
};

function overlayMessage(message) {
  if (message) {
    overlay.textContent = message;
    overlay.classList.add('visible');
  } else {
    overlay.classList.remove('visible');
  }
}

overlayMessage('НАЖМИ СТАРТ');

function updateHud() {
  scoreValue.textContent = score;
  errorsValue.textContent = errors;
}

function resetGame() {
  score = 0;
  errors = 0;
  eggs = [];
  spawnTimer = 1.4;
  wolfPosition.side = 'left';
  wolfPosition.level = 'bottom';
  updateHud();
}

function startGame() {
  resetGame();
  isRunning = true;
  isPaused = false;
  startBtn.textContent = 'Заново';
  pauseBtn.disabled = false;
  pauseBtn.textContent = 'Пауза';
  overlayMessage('');
  lastTimestamp = performance.now();
}

function pauseGame() {
  if (!isRunning) return;
  if (isPaused) {
    isPaused = false;
    pauseBtn.textContent = 'Пауза';
    overlayMessage('');
  } else {
    isPaused = true;
    pauseBtn.textContent = 'Продолжить';
    overlayMessage('ПАУЗА');
  }
}

function endGame() {
  isRunning = false;
  isPaused = false;
  eggs = [];
  pauseBtn.disabled = true;
  pauseBtn.textContent = 'Пауза';
  startBtn.textContent = 'Старт';
  overlayMessage('ИГРА ОКОНЧЕНА\nНАЖМИ СТАРТ');
}

startBtn.addEventListener('click', () => {
  startGame();
});

pauseBtn.addEventListener('click', () => {
  pauseGame();
});

function handleDirection(direction) {
  switch (direction) {
    case 'left':
      wolfPosition.side = 'left';
      break;
    case 'right':
      wolfPosition.side = 'right';
      break;
    case 'up':
      wolfPosition.level = 'top';
      break;
    case 'down':
      wolfPosition.level = 'bottom';
      break;
  }
  controlButtons.forEach((button) => button.classList.remove('is-active'));
  const active = document.querySelector(`.control[data-dir="${direction}"]`);
  if (active) {
    active.classList.add('is-active');
    setTimeout(() => active.classList.remove('is-active'), 150);
  }
}

controlButtons.forEach((button) => {
  button.addEventListener('pointerdown', (event) => {
    event.preventDefault();
    handleDirection(button.dataset.dir);
  });
});

window.addEventListener('keydown', (event) => {
  if (event.key === 'ArrowLeft') handleDirection('left');
  if (event.key === 'ArrowRight') handleDirection('right');
  if (event.key === 'ArrowUp') handleDirection('up');
  if (event.key === 'ArrowDown') handleDirection('down');
});

function resizeCanvas() {
  const baseWidth = 360;
  const baseHeight = 640;
  const maxWidth = Math.min(window.innerWidth * 0.92, 420);
  const maxHeight = Math.min(window.innerHeight * 0.8, 720);
  let displayWidth = maxWidth;
  let displayHeight = displayWidth * (baseHeight / baseWidth);

  if (displayHeight > maxHeight) {
    displayHeight = maxHeight;
    displayWidth = displayHeight * (baseWidth / baseHeight);
  }

  canvas.width = baseWidth;
  canvas.height = baseHeight;
  canvas.style.width = `${displayWidth}px`;
  canvas.style.height = `${displayHeight}px`;
  computeTracks();
  drawScene();
}

window.addEventListener('resize', resizeCanvas);
resizeCanvas();

function computeTracks() {
  const w = canvas.width;
  const h = canvas.height;

  tracks = {
    leftTop: {
      p0: { x: w * 0.15, y: h * 0.08 },
      p1: { x: w * 0.18, y: h * 0.45 },
      p2: { x: w * 0.38, y: h * 0.62 }
    },
    leftBottom: {
      p0: { x: w * 0.06, y: h * 0.26 },
      p1: { x: w * 0.14, y: h * 0.6 },
      p2: { x: w * 0.38, y: h * 0.77 }
    },
    rightTop: {
      p0: { x: w * 0.85, y: h * 0.08 },
      p1: { x: w * 0.82, y: h * 0.45 },
      p2: { x: w * 0.62, y: h * 0.62 }
    },
    rightBottom: {
      p0: { x: w * 0.94, y: h * 0.26 },
      p1: { x: w * 0.86, y: h * 0.6 },
      p2: { x: w * 0.62, y: h * 0.77 }
    }
  };
}

function getTrackPoint(track, t) {
  const clamped = Math.max(0, Math.min(1, t));
  const inv = 1 - clamped;
  const { p0, p1, p2 } = track;
  const x = inv * inv * p0.x + 2 * inv * clamped * p1.x + clamped * clamped * p2.x;
  const y = inv * inv * p0.y + 2 * inv * clamped * p1.y + clamped * clamped * p2.y;
  return { x, y };
}

function spawnEgg() {
  const keys = Object.keys(tracks);
  if (!keys.length) return;
  const trackKey = keys[Math.floor(Math.random() * keys.length)];
  eggs.push({
    track: trackKey,
    progress: 0,
    speed: 0.35 + Math.random() * 0.1
  });
}

function getCurrentTrackKey() {
  return `${wolfPosition.side}${wolfPosition.level === 'top' ? 'Top' : 'Bottom'}`;
}

function updateEggs(delta) {
  for (let i = eggs.length - 1; i >= 0; i -= 1) {
    const egg = eggs[i];
    egg.progress += egg.speed * delta;
    const track = tracks[egg.track];
    egg.position = getTrackPoint(track, egg.progress);

    if (egg.progress >= 1) {
      if (getCurrentTrackKey() === egg.track) {
        score += 1;
        updateHud();
      } else {
        errors += 1;
        updateHud();
        if (errors >= MAX_ERRORS) {
          endGame();
        }
      }
      eggs.splice(i, 1);
    }
  }
}

function drawScene() {
  ctx.clearRect(0, 0, canvas.width, canvas.height);
  drawBackground();
  drawTracks();
  drawEggs();
  drawWolf();
}

function drawBackground() {
  const gradient = ctx.createLinearGradient(0, 0, 0, canvas.height);
  gradient.addColorStop(0, '#0b1c2c');
  gradient.addColorStop(0.45, '#14324f');
  gradient.addColorStop(1, '#1f3d61');
  ctx.fillStyle = gradient;
  ctx.fillRect(0, 0, canvas.width, canvas.height);

  ctx.fillStyle = 'rgba(255, 255, 255, 0.05)';
  ctx.fillRect(canvas.width * 0.25, canvas.height * 0.15, canvas.width * 0.5, canvas.height * 0.02);
  ctx.fillRect(canvas.width * 0.28, canvas.height * 0.33, canvas.width * 0.44, canvas.height * 0.018);
}

function drawTracks() {
  ctx.lineCap = 'round';
  ctx.lineWidth = 6;
  Object.values(tracks).forEach((track, index) => {
    const colors = ['#9ad5ff', '#9ad5ff', '#9ad5ff', '#9ad5ff'];
    ctx.strokeStyle = colors[index];
    ctx.beginPath();
    ctx.moveTo(track.p0.x, track.p0.y);
    ctx.quadraticCurveTo(track.p1.x, track.p1.y, track.p2.x, track.p2.y);
    ctx.stroke();
  });
}

function drawEggs() {
  eggs.forEach((egg) => {
    if (!egg.position) return;
    ctx.save();
    ctx.fillStyle = '#ffe066';
    ctx.beginPath();
    ctx.ellipse(egg.position.x, egg.position.y, 12, 16, Math.PI / 8, 0, Math.PI * 2);
    ctx.fill();
    ctx.strokeStyle = 'rgba(150, 110, 0, 0.55)';
    ctx.lineWidth = 2;
    ctx.stroke();
    ctx.restore();
  });
}

function drawWolf() {
  const baseX = canvas.width / 2;
  const baseY = canvas.height * 0.82;
  ctx.save();

  // Shadow
  ctx.fillStyle = 'rgba(0, 0, 0, 0.35)';
  ctx.beginPath();
  ctx.ellipse(baseX, baseY + 40, 60, 14, 0, 0, Math.PI * 2);
  ctx.fill();

  // Legs
  ctx.fillStyle = '#2f3a56';
  ctx.fillRect(baseX - 32, baseY - 10, 20, 52);
  ctx.fillRect(baseX + 12, baseY - 10, 20, 52);

  // Body
  ctx.fillStyle = '#35486b';
  ctx.beginPath();
  ctx.ellipse(baseX, baseY - 30, 44, 58, 0, 0, Math.PI * 2);
  ctx.fill();

  // Head
  ctx.fillStyle = '#3f567a';
  ctx.beginPath();
  ctx.ellipse(baseX, baseY - 110, 38, 36, 0, 0, Math.PI * 2);
  ctx.fill();

  // Face
  ctx.fillStyle = '#f0dcca';
  ctx.beginPath();
  ctx.ellipse(baseX, baseY - 110, 26, 24, 0, 0, Math.PI * 2);
  ctx.fill();

  ctx.fillStyle = '#1f2d3f';
  ctx.beginPath();
  ctx.ellipse(baseX - 8, baseY - 118, 6, 8, 0, 0, Math.PI * 2);
  ctx.ellipse(baseX + 8, baseY - 118, 6, 8, 0, 0, Math.PI * 2);
  ctx.fill();

  ctx.fillStyle = '#d8572a';
  ctx.beginPath();
  ctx.arc(baseX, baseY - 96, 10, 0, Math.PI, false);
  ctx.fill();

  drawArms(baseX, baseY - 48);
  ctx.restore();
}

function drawArms(shoulderX, shoulderY) {
  const offset = {
    leftTop: { x: -48, y: -12 },
    leftBottom: { x: -48, y: 18 },
    rightTop: { x: 48, y: -12 },
    rightBottom: { x: 48, y: 18 }
  };

  const current = getCurrentTrackKey();

  Object.entries(offset).forEach(([key, value]) => {
    const track = tracks[key];
    if (!track) return;
    const startX = shoulderX + value.x;
    const startY = shoulderY + value.y;
    const endX = track.p2.x;
    const endY = track.p2.y;
    const ctrlX = (startX + endX) / 2;
    const ctrlY = (startY + endY) / 2 + (value.y > 0 ? 18 : -18);

    ctx.strokeStyle = key === current ? '#ffd166' : 'rgba(255, 255, 255, 0.35)';
    ctx.lineWidth = key === current ? 7 : 4;
    ctx.lineCap = 'round';

    ctx.beginPath();
    ctx.moveTo(startX, startY);
    ctx.quadraticCurveTo(ctrlX, ctrlY, endX, endY);
    ctx.stroke();

    ctx.fillStyle = key === current ? '#ffd166' : 'rgba(255, 255, 255, 0.4)';
    ctx.beginPath();
    ctx.ellipse(endX, endY, 12, 12, 0, 0, Math.PI * 2);
    ctx.fill();
  });
}

function gameLoop(timestamp) {
  const delta = (timestamp - lastTimestamp) / 1000 || 0;
  lastTimestamp = timestamp;

  if (isRunning && !isPaused) {
    spawnTimer -= delta;
    if (spawnTimer <= 0) {
      spawnEgg();
      const difficulty = Math.max(0.7, 1.4 - score * 0.03);
      spawnTimer = difficulty + Math.random() * 0.4;
    }

    updateEggs(delta);
  }

  drawScene();
  requestAnimationFrame(gameLoop);
}

requestAnimationFrame((timestamp) => {
  lastTimestamp = timestamp;
  requestAnimationFrame(gameLoop);
});
