# Explore: explore_3862
# Auto-generated LookML Explore File

include: "/views/domain_37/view_11587.view.lkml"
include: "/views/domain_39/view_11589.view.lkml"
include: "/views/domain_40/view_11590.view.lkml"
include: "/views/domain_41/view_11591.view.lkml"

explore: explore_3862 {
  label: "Explore Explore 3862"
  description: "Comprehensive analytics explore joining base view_11587 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_11587
  
  always_filter: {
    filters: [view_11587.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11587.created_at_date: "7 days"]
    unless: [view_11587.id, view_11587.status]
  }

  join: view_11589 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11587.user_id} = ${view_11589.id} ;;
    required_joins: []
  }

  join: view_11590 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11587.account_id} = ${view_11590.account_id} ;;
    required_joins: [view_11589]
  }

  join: view_11591 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11587.category} = ${view_11591.category} ;;
  }

  access_filter: {
    field: view_11587.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11587.is_deleted} = false ;;
}
