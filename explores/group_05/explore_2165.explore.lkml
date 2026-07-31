# Update for 500 file diff target
# Explore: explore_2165
# Auto-generated LookML Explore File

include: "/views/domain_46/view_06496.view.lkml"
include: "/views/domain_48/view_06498.view.lkml"
include: "/views/domain_49/view_06499.view.lkml"
include: "/views/domain_50/view_06500.view.lkml"

explore: explore_2165 {
  label: "Explore Explore 2165"
  description: "Comprehensive analytics explore joining base view_06496 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_06496
  
  always_filter: {
    filters: [view_06496.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06496.created_at_date: "7 days"]
    unless: [view_06496.id, view_06496.status]
  }

  join: view_06498 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06496.user_id} = ${view_06498.id} ;;
    required_joins: []
  }

  join: view_06499 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06496.account_id} = ${view_06499.account_id} ;;
    required_joins: [view_06498]
  }

  join: view_06500 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06496.category} = ${view_06500.category} ;;
  }

  access_filter: {
    field: view_06496.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06496.is_deleted} = false ;;
}
