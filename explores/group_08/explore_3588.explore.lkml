# Explore: explore_3588
# Auto-generated LookML Explore File

include: "/views/domain_15/view_10765.view.lkml"
include: "/views/domain_17/view_10767.view.lkml"
include: "/views/domain_18/view_10768.view.lkml"
include: "/views/domain_19/view_10769.view.lkml"

explore: explore_3588 {
  label: "Explore Explore 3588"
  description: "Comprehensive analytics explore joining base view_10765 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_10765
  
  always_filter: {
    filters: [view_10765.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10765.created_at_date: "7 days"]
    unless: [view_10765.id, view_10765.status]
  }

  join: view_10767 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10765.user_id} = ${view_10767.id} ;;
    required_joins: []
  }

  join: view_10768 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10765.account_id} = ${view_10768.account_id} ;;
    required_joins: [view_10767]
  }

  join: view_10769 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10765.category} = ${view_10769.category} ;;
  }

  access_filter: {
    field: view_10765.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10765.is_deleted} = false ;;
}
