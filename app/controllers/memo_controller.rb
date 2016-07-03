class MemoController < ApplicationController
  def index
    @labels = Label.all
    @memos = Memo.all

#    @json_labels = []
#    @labels.each do |l|
#      @json_labels << {name: l.name, updated_at: l.updated_at.to_s(:db), created_at: l.created_at.to_s(:db), eid: l.id}
#    end

#    @json_memos = []
#    @memos.each do |m|
#      @json_memos << { title: m.title, content: m.content, labels: m.labels, updated_at: m.updated_at.to_s(:db), created_at: m.created_at.to_s(:db), eid: m.id}
#    end

#    if !@memos[0].nil?
#      render template: "memo/index"
#      render json: { labels: @json_labels, memos: @json_memos }
#    else
#      render json: { eid: -1 }
#    end
  end

  def create
    @memo = Memo.new
    @memo.title = params[:title]
    @memo.content = params[:content]

    if @memo.save
      render json: { title: @memo.title, content: @memo.content, updated_at: @memo.updated_at.to_s(:db), created_at: @memo.created_at.to_s(:db), eid: @memo.id}
    else
      render json: { eid: -1 }
    end
  end

  # called by selectLabel()
  def select
#    @json_labels = []
#    @labels = Label.all
#    @labels.each do |l|
#      @json_labels << {name: l.name, updated_at: l.updated_at.to_s(:db), created_at: l.created_at.to_s(:db), eid: l.id}
#    end

    @json_memos = []
    @memos = Label.find(params[:label_id]).memos
    @memos.each do |m|
      @json_memos << { title: m.title, content: m.content, labels: m.labels, updated_at: m.updated_at.to_s(:db), created_at: m.created_at.to_s(:db), eid: m.id}
    end

    if !@memos[0].nil?
      render json: { memos: @json_memos, label_id: params[:label_id] }
    else
      render json: { eid: -1 }
    end
  end

  # select memo
  def show
    m = Memo.find(params[:memo_id])
    render json: { title: m.title, content: m.content, updated_at: m.updated_at.to_s(:db), created_at: m.created_at.to_s(:db), eid: @memo.id }
  end
end
