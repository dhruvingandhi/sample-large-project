# Explore: explore_0543
# Auto-generated LookML Explore File

include: "/views/domain_30/view_01630.view.lkml"
include: "/views/domain_32/view_01632.view.lkml"
include: "/views/domain_33/view_01633.view.lkml"
include: "/views/domain_34/view_01634.view.lkml"

explore: explore_0543 {
  label: "Explore Explore 0543"
  description: "Comprehensive analytics explore joining base view_01630 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_01630
  
  always_filter: {
    filters: [view_01630.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01630.created_at_date: "7 days"]
    unless: [view_01630.id, view_01630.status]
  }

  join: view_01632 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01630.user_id} = ${view_01632.id} ;;
    required_joins: []
  }

  join: view_01633 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01630.account_id} = ${view_01633.account_id} ;;
    required_joins: [view_01632]
  }

  join: view_01634 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01630.category} = ${view_01634.category} ;;
  }

  access_filter: {
    field: view_01630.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01630.is_deleted} = false ;;
}
