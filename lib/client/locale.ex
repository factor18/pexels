defmodule Pexels.Client.Locale do
  @behaviour Construct.Type

  @locales [
    "en-US", "pt-BR", "es-ES", "ca-ES", "de-DE", "it-IT", "fr-FR", "sv-SE", "id-ID",
    "pl-PL", "ja-JP", "zh-TW", "zh-CN", "ko-KR", "th-TH", "nl-NL", "hu-HU", "vi-VN",
    "cs-CZ", "da-DK", "fi-FI", "uk-UA", "el-GR", "ro-RO", "nb-NO", "sk-SK", "tr-TR",
    "ru-RU"
  ]

  @locales |> Enum.each(fn (locale) ->
    def unquote(:"#{locale |> String.replace("-", "")}")(), do: unquote(locale)
  end)

  def cast(locale) when locale in @locales do
    {:ok, locale}
  end

  def cast(_), do: :error
end
