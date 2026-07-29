# Explore: explore_3752
# Auto-generated LookML Explore File

include: "/views/domain_07/view_11257.view.lkml"
include: "/views/domain_09/view_11259.view.lkml"
include: "/views/domain_10/view_11260.view.lkml"
include: "/views/domain_11/view_11261.view.lkml"

explore: explore_3752 {
  label: "Explore Explore 3752"
  description: "Comprehensive analytics explore joining base view_11257 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_11257
  
  always_filter: {
    filters: [view_11257.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11257.created_at_date: "7 days"]
    unless: [view_11257.id, view_11257.status]
  }

  join: view_11259 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11257.user_id} = ${view_11259.id} ;;
    required_joins: []
  }

  join: view_11260 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11257.account_id} = ${view_11260.account_id} ;;
    required_joins: [view_11259]
  }

  join: view_11261 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11257.category} = ${view_11261.category} ;;
  }

  access_filter: {
    field: view_11257.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11257.is_deleted} = false ;;
}
