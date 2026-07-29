# Explore: explore_2211
# Auto-generated LookML Explore File

include: "/views/domain_34/view_06634.view.lkml"
include: "/views/domain_36/view_06636.view.lkml"
include: "/views/domain_37/view_06637.view.lkml"
include: "/views/domain_38/view_06638.view.lkml"

explore: explore_2211 {
  label: "Explore Explore 2211"
  description: "Comprehensive analytics explore joining base view_06634 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_06634
  
  always_filter: {
    filters: [view_06634.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06634.created_at_date: "7 days"]
    unless: [view_06634.id, view_06634.status]
  }

  join: view_06636 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06634.user_id} = ${view_06636.id} ;;
    required_joins: []
  }

  join: view_06637 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06634.account_id} = ${view_06637.account_id} ;;
    required_joins: [view_06636]
  }

  join: view_06638 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06634.category} = ${view_06638.category} ;;
  }

  access_filter: {
    field: view_06634.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06634.is_deleted} = false ;;
}
