# Explore: explore_3810
# Auto-generated LookML Explore File

include: "/views/domain_31/view_11431.view.lkml"
include: "/views/domain_33/view_11433.view.lkml"
include: "/views/domain_34/view_11434.view.lkml"
include: "/views/domain_35/view_11435.view.lkml"

explore: explore_3810 {
  label: "Explore Explore 3810"
  description: "Comprehensive analytics explore joining base view_11431 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_11431
  
  always_filter: {
    filters: [view_11431.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11431.created_at_date: "7 days"]
    unless: [view_11431.id, view_11431.status]
  }

  join: view_11433 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11431.user_id} = ${view_11433.id} ;;
    required_joins: []
  }

  join: view_11434 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11431.account_id} = ${view_11434.account_id} ;;
    required_joins: [view_11433]
  }

  join: view_11435 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11431.category} = ${view_11435.category} ;;
  }

  access_filter: {
    field: view_11431.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11431.is_deleted} = false ;;
}
