import esbuild from 'rollup-plugin-esbuild';

export default {
  input: 'src/index.js',
  output: [
    {
      file: 'dist/index.cjs',
      format: 'cjs'
    },
    {
      file: 'dist/index.mjs',
      format: 'esm'
    }
  ],
  external: ['cross-fetch'],
  plugins: [
    esbuild({
      minify: true,  // 开启压缩
      target: 'esnext' // 目标 ES 版本
    })
  ]
};
