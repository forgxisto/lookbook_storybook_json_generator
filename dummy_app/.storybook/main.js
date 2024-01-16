/** @type { import('@storybook/server-webpack5').StorybookConfig } */
const config = {
  stories: ["../test/**/*.stories.json"],
  addons: ["@storybook/addon-controls", "@storybook/addon-links", "@storybook/addon-essentials"],
  framework: {
    name: "@storybook/server-webpack5",
    options: {
      builder: {
        useSWC: true,
      },
    },
  },
  docs: {
    autodocs: "tag",
  },
};
export default config;
