# Explore: explore_3063
# Auto-generated LookML Explore File

include: "/views/domain_40/view_09190.view.lkml"
include: "/views/domain_42/view_09192.view.lkml"
include: "/views/domain_43/view_09193.view.lkml"
include: "/views/domain_44/view_09194.view.lkml"

explore: explore_3063 {
  label: "Explore Explore 3063"
  description: "Comprehensive analytics explore joining base view_09190 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_09190
  
  always_filter: {
    filters: [view_09190.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09190.created_at_date: "7 days"]
    unless: [view_09190.id, view_09190.status]
  }

  join: view_09192 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09190.user_id} = ${view_09192.id} ;;
    required_joins: []
  }

  join: view_09193 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09190.account_id} = ${view_09193.account_id} ;;
    required_joins: [view_09192]
  }

  join: view_09194 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09190.category} = ${view_09194.category} ;;
  }

  access_filter: {
    field: view_09190.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09190.is_deleted} = false ;;
}
