# Explore: explore_3085
# Auto-generated LookML Explore File

include: "/views/domain_06/view_09256.view.lkml"
include: "/views/domain_08/view_09258.view.lkml"
include: "/views/domain_09/view_09259.view.lkml"
include: "/views/domain_10/view_09260.view.lkml"

explore: explore_3085 {
  label: "Explore Explore 3085"
  description: "Comprehensive analytics explore joining base view_09256 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_09256
  
  always_filter: {
    filters: [view_09256.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09256.created_at_date: "7 days"]
    unless: [view_09256.id, view_09256.status]
  }

  join: view_09258 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09256.user_id} = ${view_09258.id} ;;
    required_joins: []
  }

  join: view_09259 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09256.account_id} = ${view_09259.account_id} ;;
    required_joins: [view_09258]
  }

  join: view_09260 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09256.category} = ${view_09260.category} ;;
  }

  access_filter: {
    field: view_09256.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09256.is_deleted} = false ;;
}
