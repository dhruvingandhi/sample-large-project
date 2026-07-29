# Explore: explore_2676
# Auto-generated LookML Explore File

include: "/views/domain_29/view_08029.view.lkml"
include: "/views/domain_31/view_08031.view.lkml"
include: "/views/domain_32/view_08032.view.lkml"
include: "/views/domain_33/view_08033.view.lkml"

explore: explore_2676 {
  label: "Explore Explore 2676"
  description: "Comprehensive analytics explore joining base view_08029 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_08029
  
  always_filter: {
    filters: [view_08029.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08029.created_at_date: "7 days"]
    unless: [view_08029.id, view_08029.status]
  }

  join: view_08031 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08029.user_id} = ${view_08031.id} ;;
    required_joins: []
  }

  join: view_08032 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08029.account_id} = ${view_08032.account_id} ;;
    required_joins: [view_08031]
  }

  join: view_08033 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08029.category} = ${view_08033.category} ;;
  }

  access_filter: {
    field: view_08029.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08029.is_deleted} = false ;;
}
