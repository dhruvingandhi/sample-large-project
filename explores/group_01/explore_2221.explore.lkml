# Explore: explore_2221
# Auto-generated LookML Explore File

include: "/views/domain_14/view_06664.view.lkml"
include: "/views/domain_16/view_06666.view.lkml"
include: "/views/domain_17/view_06667.view.lkml"
include: "/views/domain_18/view_06668.view.lkml"

explore: explore_2221 {
  label: "Explore Explore 2221"
  description: "Comprehensive analytics explore joining base view_06664 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_06664
  
  always_filter: {
    filters: [view_06664.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06664.created_at_date: "7 days"]
    unless: [view_06664.id, view_06664.status]
  }

  join: view_06666 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06664.user_id} = ${view_06666.id} ;;
    required_joins: []
  }

  join: view_06667 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06664.account_id} = ${view_06667.account_id} ;;
    required_joins: [view_06666]
  }

  join: view_06668 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06664.category} = ${view_06668.category} ;;
  }

  access_filter: {
    field: view_06664.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06664.is_deleted} = false ;;
}
