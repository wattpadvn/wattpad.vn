defmodule WP.GenLink do
  import Ecto.Query
  @wp "https://wattpad.vn/"

  def genlink do
    case Genlinks.Repo.query("select seo, name from story s order by views desc limit 100") do
      {:ok, data} ->
        data

        content =
          data.rows
          |> Enum.map(fn [seo, name] ->
            name
            "  - [" <> name <> "](" <> @wp <> seo <> "/)\n"
          end)
          |> Enum.join("")

        genfile("top100.txt", content)

      _ ->
        nil
    end
  end

  defp genfile(linkFile, str) do
    str = str <> "\n"
    {:ok, file} = File.open(linkFile, [:write])
    IO.binwrite(file, str)
    File.close(file)
  end
end
