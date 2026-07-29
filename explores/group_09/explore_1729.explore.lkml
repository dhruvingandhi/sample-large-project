# Explore: explore_1729
# Auto-generated LookML Explore File

include: "/views/domain_38/view_05188.view.lkml"
include: "/views/domain_40/view_05190.view.lkml"
include: "/views/domain_41/view_05191.view.lkml"
include: "/views/domain_42/view_05192.view.lkml"

explore: explore_1729 {
  label: "Explore Explore 1729"
  description: "Comprehensive analytics explore joining base view_05188 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_05188
  
  always_filter: {
    filters: [view_05188.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05188.created_at_date: "7 days"]
    unless: [view_05188.id, view_05188.status]
  }

  join: view_05190 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05188.user_id} = ${view_05190.id} ;;
    required_joins: []
  }

  join: view_05191 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05188.account_id} = ${view_05191.account_id} ;;
    required_joins: [view_05190]
  }

  join: view_05192 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05188.category} = ${view_05192.category} ;;
  }

  access_filter: {
    field: view_05188.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05188.is_deleted} = false ;;
}
