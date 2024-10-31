local llamacpp = require('model.providers.llamacpp')

require('model').setup({
  prompts = {
    gpt2 = {
      provider = llamacpp,
      options = {
        model = 'ggml-vocab-gpt-2.gguf',
      },
      builder = function(input, context)
        return {
          prompt =
            '<|system|>'
            .. (context.args or 'You are a helpful assistant')
            .. '\n</s>\n<|user|>\n'
            .. input
            .. '</s>\n<|assistant|>',
          stops = { '</s>' }
        }
      end
    }
  }
})

llamacpp.setup({
	binary = '~/.opt/llama.cpp/llama-server',
	models = '~/.opt/llama.cpp/models/'
})
