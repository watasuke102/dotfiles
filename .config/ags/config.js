const srcdir = `${App.configDir}/src`;

// Create function in order to avoid error related to using top-level await
async function load_typescript() {
  const outdir = '/tmp/ags/js';
  try {
    await Utils.execAsync([
      'bun',
      'build',
      `${srcdir}/main.ts`,
      '--outdir',
      outdir,
      '--external',
      'resource://*',
      '--external',
      'gi://*',
    ]);
    await import(`file://${outdir}/main.js`);
  } catch (error) {
    console.error(error);
  }
}

// Initialize
load_typescript();

