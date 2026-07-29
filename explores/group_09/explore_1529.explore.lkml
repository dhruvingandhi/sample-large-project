# Explore: explore_1529
# Auto-generated LookML Explore File

include: "/views/domain_38/view_04588.view.lkml"
include: "/views/domain_40/view_04590.view.lkml"
include: "/views/domain_41/view_04591.view.lkml"
include: "/views/domain_42/view_04592.view.lkml"

explore: explore_1529 {
  label: "Explore Explore 1529"
  description: "Comprehensive analytics explore joining base view_04588 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_04588
  
  always_filter: {
    filters: [view_04588.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04588.created_at_date: "7 days"]
    unless: [view_04588.id, view_04588.status]
  }

  join: view_04590 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04588.user_id} = ${view_04590.id} ;;
    required_joins: []
  }

  join: view_04591 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04588.account_id} = ${view_04591.account_id} ;;
    required_joins: [view_04590]
  }

  join: view_04592 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04588.category} = ${view_04592.category} ;;
  }

  access_filter: {
    field: view_04588.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04588.is_deleted} = false ;;
}
