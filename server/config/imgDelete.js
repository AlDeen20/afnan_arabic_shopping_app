import path from 'path'
import fs from 'fs';

function deleteImageFromSlider(foldername,imageFilename) {
  const __dirname = path.resolve();
  const sliderFolderPath = path.join(__dirname, 'uploads/' + foldername);
  const imagePath = path.join(sliderFolderPath, imageFilename);

  fs.access(imagePath, fs.constants.F_OK, (err) => {
    if (err) {
      // console.error('File not found:', imageFilename);
      return;
    }

    // Delete the file
    fs.unlink(imagePath, (err) => {
      if (err) {
        // console.error('Error deleting file:', err);
      } else {
        // console.log('File deleted successfully:', imageFilename);
      }
    });
  });
}

export default deleteImageFromSlider
