# Explore: explore_2327
# Auto-generated LookML Explore File

include: "/views/domain_32/view_06982.view.lkml"
include: "/views/domain_34/view_06984.view.lkml"
include: "/views/domain_35/view_06985.view.lkml"
include: "/views/domain_36/view_06986.view.lkml"

explore: explore_2327 {
  label: "Explore Explore 2327"
  description: "Comprehensive analytics explore joining base view_06982 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_06982
  
  always_filter: {
    filters: [view_06982.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06982.created_at_date: "7 days"]
    unless: [view_06982.id, view_06982.status]
  }

  join: view_06984 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06982.user_id} = ${view_06984.id} ;;
    required_joins: []
  }

  join: view_06985 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06982.account_id} = ${view_06985.account_id} ;;
    required_joins: [view_06984]
  }

  join: view_06986 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06982.category} = ${view_06986.category} ;;
  }

  access_filter: {
    field: view_06982.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06982.is_deleted} = false ;;
}
