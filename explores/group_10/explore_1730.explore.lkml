# Explore: explore_1730
# Auto-generated LookML Explore File

include: "/views/domain_41/view_05191.view.lkml"
include: "/views/domain_43/view_05193.view.lkml"
include: "/views/domain_44/view_05194.view.lkml"
include: "/views/domain_45/view_05195.view.lkml"

explore: explore_1730 {
  label: "Explore Explore 1730"
  description: "Comprehensive analytics explore joining base view_05191 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_05191
  
  always_filter: {
    filters: [view_05191.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05191.created_at_date: "7 days"]
    unless: [view_05191.id, view_05191.status]
  }

  join: view_05193 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05191.user_id} = ${view_05193.id} ;;
    required_joins: []
  }

  join: view_05194 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05191.account_id} = ${view_05194.account_id} ;;
    required_joins: [view_05193]
  }

  join: view_05195 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05191.category} = ${view_05195.category} ;;
  }

  access_filter: {
    field: view_05191.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05191.is_deleted} = false ;;
}
