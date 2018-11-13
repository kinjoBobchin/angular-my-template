const fs = require('fs');

const fileName = 'env.ts';
const envData = JSON.stringify(process.env);

const saveEnvFIle = () => {
  fs.writeFileSync(fileName, envData, 'utf8');
};

const checkGitignoreFile = () => {
  const content = fs.readFileSync('./.gitignore', 'utf8');
  const isEnv = content.includes('env.ts');
  if (!isEnv) {
    fs.appendFile('./.gitignore', 'env.ts', (err) => {
      if (err) {
        console.log('ファイルを書き込めませんでした');
      }
    });
  }
};

saveEnvFIle();
checkGitignoreFile();
