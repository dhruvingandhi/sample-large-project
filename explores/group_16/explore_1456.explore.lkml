# Explore: explore_1456
# Auto-generated LookML Explore File

include: "/views/domain_19/view_04369.view.lkml"
include: "/views/domain_21/view_04371.view.lkml"
include: "/views/domain_22/view_04372.view.lkml"
include: "/views/domain_23/view_04373.view.lkml"

explore: explore_1456 {
  label: "Explore Explore 1456"
  description: "Comprehensive analytics explore joining base view_04369 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_04369
  
  always_filter: {
    filters: [view_04369.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04369.created_at_date: "7 days"]
    unless: [view_04369.id, view_04369.status]
  }

  join: view_04371 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04369.user_id} = ${view_04371.id} ;;
    required_joins: []
  }

  join: view_04372 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04369.account_id} = ${view_04372.account_id} ;;
    required_joins: [view_04371]
  }

  join: view_04373 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04369.category} = ${view_04373.category} ;;
  }

  access_filter: {
    field: view_04369.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04369.is_deleted} = false ;;
}
