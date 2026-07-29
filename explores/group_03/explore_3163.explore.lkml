# Explore: explore_3163
# Auto-generated LookML Explore File

include: "/views/domain_40/view_09490.view.lkml"
include: "/views/domain_42/view_09492.view.lkml"
include: "/views/domain_43/view_09493.view.lkml"
include: "/views/domain_44/view_09494.view.lkml"

explore: explore_3163 {
  label: "Explore Explore 3163"
  description: "Comprehensive analytics explore joining base view_09490 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_09490
  
  always_filter: {
    filters: [view_09490.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09490.created_at_date: "7 days"]
    unless: [view_09490.id, view_09490.status]
  }

  join: view_09492 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09490.user_id} = ${view_09492.id} ;;
    required_joins: []
  }

  join: view_09493 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09490.account_id} = ${view_09493.account_id} ;;
    required_joins: [view_09492]
  }

  join: view_09494 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09490.category} = ${view_09494.category} ;;
  }

  access_filter: {
    field: view_09490.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09490.is_deleted} = false ;;
}
