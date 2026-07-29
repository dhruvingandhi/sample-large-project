# Explore: explore_2186
# Auto-generated LookML Explore File

include: "/views/domain_09/view_06559.view.lkml"
include: "/views/domain_11/view_06561.view.lkml"
include: "/views/domain_12/view_06562.view.lkml"
include: "/views/domain_13/view_06563.view.lkml"

explore: explore_2186 {
  label: "Explore Explore 2186"
  description: "Comprehensive analytics explore joining base view_06559 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_06559
  
  always_filter: {
    filters: [view_06559.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06559.created_at_date: "7 days"]
    unless: [view_06559.id, view_06559.status]
  }

  join: view_06561 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06559.user_id} = ${view_06561.id} ;;
    required_joins: []
  }

  join: view_06562 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06559.account_id} = ${view_06562.account_id} ;;
    required_joins: [view_06561]
  }

  join: view_06563 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06559.category} = ${view_06563.category} ;;
  }

  access_filter: {
    field: view_06559.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06559.is_deleted} = false ;;
}
