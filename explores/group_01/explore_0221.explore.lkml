# Explore: explore_0221
# Auto-generated LookML Explore File

include: "/views/domain_14/view_00664.view.lkml"
include: "/views/domain_16/view_00666.view.lkml"
include: "/views/domain_17/view_00667.view.lkml"
include: "/views/domain_18/view_00668.view.lkml"

explore: explore_0221 {
  label: "Explore Explore 0221"
  description: "Comprehensive analytics explore joining base view_00664 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_00664
  
  always_filter: {
    filters: [view_00664.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00664.created_at_date: "7 days"]
    unless: [view_00664.id, view_00664.status]
  }

  join: view_00666 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00664.user_id} = ${view_00666.id} ;;
    required_joins: []
  }

  join: view_00667 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00664.account_id} = ${view_00667.account_id} ;;
    required_joins: [view_00666]
  }

  join: view_00668 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00664.category} = ${view_00668.category} ;;
  }

  access_filter: {
    field: view_00664.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00664.is_deleted} = false ;;
}
