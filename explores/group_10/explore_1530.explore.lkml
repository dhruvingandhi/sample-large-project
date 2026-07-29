# Explore: explore_1530
# Auto-generated LookML Explore File

include: "/views/domain_41/view_04591.view.lkml"
include: "/views/domain_43/view_04593.view.lkml"
include: "/views/domain_44/view_04594.view.lkml"
include: "/views/domain_45/view_04595.view.lkml"

explore: explore_1530 {
  label: "Explore Explore 1530"
  description: "Comprehensive analytics explore joining base view_04591 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_04591
  
  always_filter: {
    filters: [view_04591.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04591.created_at_date: "7 days"]
    unless: [view_04591.id, view_04591.status]
  }

  join: view_04593 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04591.user_id} = ${view_04593.id} ;;
    required_joins: []
  }

  join: view_04594 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04591.account_id} = ${view_04594.account_id} ;;
    required_joins: [view_04593]
  }

  join: view_04595 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04591.category} = ${view_04595.category} ;;
  }

  access_filter: {
    field: view_04591.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04591.is_deleted} = false ;;
}
