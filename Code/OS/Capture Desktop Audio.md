``` python
import pyaudiowpatch as pyaudio
import numpy as np
import wave

CHANNELS = 2
OUTPUT_FILE = "recording.wav"
LOOPBACK_DEVICE_INDEX = 5  # Headphones [Loopback]
CHUNK = 1024


def rms_to_bar(rms):
    db = 20 * np.log10(max(rms, 1e-10))
    bar_len = int(min(max((db + 60) / 60, 0), 1) * 40)
    bar = "█" * bar_len + "░" * (40 - bar_len)
    return f"[{bar}] {db:+.1f} dB"


def record_loopback():
    p = pyaudio.PyAudio()
    frames = []

    dev_info = p.get_device_info_by_index(LOOPBACK_DEVICE_INDEX)
    print(f"Using: {dev_info['name']}")
    print(f"Rate: {int(dev_info['defaultSampleRate'])}  Channels: {int(dev_info['maxInputChannels'])}")

    # Match device's native sample rate
    native_rate = int(dev_info['defaultSampleRate'])

    stream = p.open(
        format=pyaudio.paInt16,
        channels=CHANNELS,
        rate=native_rate,
        input=True,
        input_device_index=LOOPBACK_DEVICE_INDEX,
        frames_per_buffer=CHUNK,
    )

    try:
        while True:
            data = stream.read(CHUNK, exception_on_overflow=False)
            frames.append(data)
            audio_np = np.frombuffer(data, dtype=np.int16)
            rms = np.sqrt(np.mean(audio_np.astype(np.float64) ** 2))
            print(f"\r{rms_to_bar(rms)}", end="", flush=True)
    except KeyboardInterrupt:
        print("\n\nStopped.")
    finally:
        stream.stop_stream()
        stream.close()
        p.terminate()

    with wave.open(OUTPUT_FILE, "wb") as wf:
        wf.setnchannels(CHANNELS)
        wf.setsampwidth(2)
        wf.setframerate(native_rate)
        wf.writeframes(b"".join(frames))
    duration = len(frames) * CHUNK / native_rate
    print(f"Saved {duration:.1f}s of audio to {OUTPUT_FILE}")


if __name__ == "__main__":
    record_loopback()
```
