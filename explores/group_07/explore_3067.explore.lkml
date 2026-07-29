# Explore: explore_3067
# Auto-generated LookML Explore File

include: "/views/domain_02/view_09202.view.lkml"
include: "/views/domain_04/view_09204.view.lkml"
include: "/views/domain_05/view_09205.view.lkml"
include: "/views/domain_06/view_09206.view.lkml"

explore: explore_3067 {
  label: "Explore Explore 3067"
  description: "Comprehensive analytics explore joining base view_09202 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_09202
  
  always_filter: {
    filters: [view_09202.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09202.created_at_date: "7 days"]
    unless: [view_09202.id, view_09202.status]
  }

  join: view_09204 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09202.user_id} = ${view_09204.id} ;;
    required_joins: []
  }

  join: view_09205 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09202.account_id} = ${view_09205.account_id} ;;
    required_joins: [view_09204]
  }

  join: view_09206 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09202.category} = ${view_09206.category} ;;
  }

  access_filter: {
    field: view_09202.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09202.is_deleted} = false ;;
}
