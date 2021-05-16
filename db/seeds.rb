5.times do
    Book.create! title: Forgery::LoremIpsum.sentence, thoughts: Forgery::LoremIpsum.paragraphs(3)
  end