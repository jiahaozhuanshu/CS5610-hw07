defmodule TimesheetsspaWeb.SheetView do
  use TimesheetsspaWeb, :view
  alias TimesheetsspaWeb.SheetView

  def render("index.json", %{sheets: sheets}) do
    %{data: render_many(sheets, SheetView, "sheet.json")}
  end

  def render("show.json", %{sheet: sheet}) do
    %{data: render_one(sheet, SheetView, "sheet.json")}
  end

  def render("sheet.json", %{sheet: sheet}) do
    %{id: sheet.id,
      date: sheet.date,
      status: sheet.status}
  end
end
