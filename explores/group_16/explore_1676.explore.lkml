# Explore: explore_1676
# Auto-generated LookML Explore File

include: "/views/domain_29/view_05029.view.lkml"
include: "/views/domain_31/view_05031.view.lkml"
include: "/views/domain_32/view_05032.view.lkml"
include: "/views/domain_33/view_05033.view.lkml"

explore: explore_1676 {
  label: "Explore Explore 1676"
  description: "Comprehensive analytics explore joining base view_05029 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_05029
  
  always_filter: {
    filters: [view_05029.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05029.created_at_date: "7 days"]
    unless: [view_05029.id, view_05029.status]
  }

  join: view_05031 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05029.user_id} = ${view_05031.id} ;;
    required_joins: []
  }

  join: view_05032 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05029.account_id} = ${view_05032.account_id} ;;
    required_joins: [view_05031]
  }

  join: view_05033 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05029.category} = ${view_05033.category} ;;
  }

  access_filter: {
    field: view_05029.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05029.is_deleted} = false ;;
}
