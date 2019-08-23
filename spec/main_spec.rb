require "date"

RSpec.describe "Gorg" do

  it "exposes a Plug mapping for opening the index" do
    vim.command 'nmap zz <Plug>GorgOpenIndex'
    vim.feedkeys 'zz'

    filename = vim.command 'echo @%'
    expect(filename).to eq("index.md")
  end

  it "exposes a Plug mapping for moving an item to done" do
    # given
    vim.command 'nmap zz <Plug>GorgMoveDone'
    vim.insert 'Line 1<CR>Line 2'
    vim.normal
    vim.feedkeys 'G'

    # when
    vim.feedkeys 'zz'
    vim.feedkeys 'zz'

    # then
    sleep(1.0/10)
    expect(done_file_contents).to eq("Line 2\nLine 1\n")
  end

  def done_file_contents
    File.read("done/#{Date.today.iso8601}.md")
  end

end
