# Amplitude normalization
# Alec Shaw <alecshaw@hi.is>
# Version 1.0.0

# This script normalizes amplitude of a selection of sound files

target_dir$ = chooseDirectory$ ("Choose the directory with your sound files")

destination_dir$ = chooseDirectory$ ("Choose where to put the files")

Create Strings as file list... list 'target_dir$'/*.wav
number_files = Get number of strings

for ifile to number_files
  select Strings list
  filename$ = Get string... ifile
  Read from file... 'target_dir$'/'filename$'

  filename$ = replace$("'filename$'", ".wav", "", 0)

  Convert to mono

  # Scaling average intensity to 70dB
  Scale intensity... 70

  Save as WAV file... 'destination_dir$'/'filename$'.wav

  selectObject: "Sound 'filename$'"
  plusObject: "Sound 'filename$'_mono"
  Remove
endfor

select Strings list
Remove
