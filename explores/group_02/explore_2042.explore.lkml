# Update for 500 file diff target
# Explore: explore_2042
# Auto-generated LookML Explore File

include: "/views/domain_27/view_06127.view.lkml"
include: "/views/domain_29/view_06129.view.lkml"
include: "/views/domain_30/view_06130.view.lkml"
include: "/views/domain_31/view_06131.view.lkml"

explore: explore_2042 {
  label: "Explore Explore 2042"
  description: "Comprehensive analytics explore joining base view_06127 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_06127
  
  always_filter: {
    filters: [view_06127.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06127.created_at_date: "7 days"]
    unless: [view_06127.id, view_06127.status]
  }

  join: view_06129 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06127.user_id} = ${view_06129.id} ;;
    required_joins: []
  }

  join: view_06130 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06127.account_id} = ${view_06130.account_id} ;;
    required_joins: [view_06129]
  }

  join: view_06131 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06127.category} = ${view_06131.category} ;;
  }

  access_filter: {
    field: view_06127.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06127.is_deleted} = false ;;
}
