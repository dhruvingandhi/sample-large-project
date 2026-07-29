# Explore: explore_1846
# Auto-generated LookML Explore File

include: "/views/domain_39/view_05539.view.lkml"
include: "/views/domain_41/view_05541.view.lkml"
include: "/views/domain_42/view_05542.view.lkml"
include: "/views/domain_43/view_05543.view.lkml"

explore: explore_1846 {
  label: "Explore Explore 1846"
  description: "Comprehensive analytics explore joining base view_05539 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_05539
  
  always_filter: {
    filters: [view_05539.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05539.created_at_date: "7 days"]
    unless: [view_05539.id, view_05539.status]
  }

  join: view_05541 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05539.user_id} = ${view_05541.id} ;;
    required_joins: []
  }

  join: view_05542 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05539.account_id} = ${view_05542.account_id} ;;
    required_joins: [view_05541]
  }

  join: view_05543 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05539.category} = ${view_05543.category} ;;
  }

  access_filter: {
    field: view_05539.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05539.is_deleted} = false ;;
}
