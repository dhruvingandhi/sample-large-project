# Explore: explore_1063
# Auto-generated LookML Explore File

include: "/views/domain_40/view_03190.view.lkml"
include: "/views/domain_42/view_03192.view.lkml"
include: "/views/domain_43/view_03193.view.lkml"
include: "/views/domain_44/view_03194.view.lkml"

explore: explore_1063 {
  label: "Explore Explore 1063"
  description: "Comprehensive analytics explore joining base view_03190 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_03190
  
  always_filter: {
    filters: [view_03190.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03190.created_at_date: "7 days"]
    unless: [view_03190.id, view_03190.status]
  }

  join: view_03192 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03190.user_id} = ${view_03192.id} ;;
    required_joins: []
  }

  join: view_03193 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03190.account_id} = ${view_03193.account_id} ;;
    required_joins: [view_03192]
  }

  join: view_03194 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03190.category} = ${view_03194.category} ;;
  }

  access_filter: {
    field: view_03190.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03190.is_deleted} = false ;;
}
