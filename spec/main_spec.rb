RSpec.describe "Gorg" do

  it "exposes a Plug mapping for opening the index" do
    vim.command 'nmap zz <Plug>GorgOpenIndex'
    vim.feedkeys 'zz'

    filename = vim.command 'echo @%'
    expect(filename).to eq("index.md")
  end

end
