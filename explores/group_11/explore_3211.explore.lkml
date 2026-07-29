# Explore: explore_3211
# Auto-generated LookML Explore File

include: "/views/domain_34/view_09634.view.lkml"
include: "/views/domain_36/view_09636.view.lkml"
include: "/views/domain_37/view_09637.view.lkml"
include: "/views/domain_38/view_09638.view.lkml"

explore: explore_3211 {
  label: "Explore Explore 3211"
  description: "Comprehensive analytics explore joining base view_09634 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_09634
  
  always_filter: {
    filters: [view_09634.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09634.created_at_date: "7 days"]
    unless: [view_09634.id, view_09634.status]
  }

  join: view_09636 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09634.user_id} = ${view_09636.id} ;;
    required_joins: []
  }

  join: view_09637 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09634.account_id} = ${view_09637.account_id} ;;
    required_joins: [view_09636]
  }

  join: view_09638 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09634.category} = ${view_09638.category} ;;
  }

  access_filter: {
    field: view_09634.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09634.is_deleted} = false ;;
}
