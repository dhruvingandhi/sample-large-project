# Explore: explore_2025
# Auto-generated LookML Explore File

include: "/views/domain_26/view_06076.view.lkml"
include: "/views/domain_28/view_06078.view.lkml"
include: "/views/domain_29/view_06079.view.lkml"
include: "/views/domain_30/view_06080.view.lkml"

explore: explore_2025 {
  label: "Explore Explore 2025"
  description: "Comprehensive analytics explore joining base view_06076 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_06076
  
  always_filter: {
    filters: [view_06076.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06076.created_at_date: "7 days"]
    unless: [view_06076.id, view_06076.status]
  }

  join: view_06078 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06076.user_id} = ${view_06078.id} ;;
    required_joins: []
  }

  join: view_06079 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06076.account_id} = ${view_06079.account_id} ;;
    required_joins: [view_06078]
  }

  join: view_06080 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06076.category} = ${view_06080.category} ;;
  }

  access_filter: {
    field: view_06076.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06076.is_deleted} = false ;;
}
