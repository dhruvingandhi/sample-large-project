# Update for 2000 file diff target
# Explore: explore_3519
# Auto-generated LookML Explore File

include: "/views/domain_08/view_10558.view.lkml"
include: "/views/domain_10/view_10560.view.lkml"
include: "/views/domain_11/view_10561.view.lkml"
include: "/views/domain_12/view_10562.view.lkml"

explore: explore_3519 {
  label: "Explore Explore 3519"
  description: "Comprehensive analytics explore joining base view_10558 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_10558
  
  always_filter: {
    filters: [view_10558.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10558.created_at_date: "7 days"]
    unless: [view_10558.id, view_10558.status]
  }

  join: view_10560 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10558.user_id} = ${view_10560.id} ;;
    required_joins: []
  }

  join: view_10561 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10558.account_id} = ${view_10561.account_id} ;;
    required_joins: [view_10560]
  }

  join: view_10562 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10558.category} = ${view_10562.category} ;;
  }

  access_filter: {
    field: view_10558.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10558.is_deleted} = false ;;
}
