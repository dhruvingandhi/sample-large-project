# Explore: explore_3751
# Auto-generated LookML Explore File

include: "/views/domain_04/view_11254.view.lkml"
include: "/views/domain_06/view_11256.view.lkml"
include: "/views/domain_07/view_11257.view.lkml"
include: "/views/domain_08/view_11258.view.lkml"

explore: explore_3751 {
  label: "Explore Explore 3751"
  description: "Comprehensive analytics explore joining base view_11254 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_11254
  
  always_filter: {
    filters: [view_11254.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11254.created_at_date: "7 days"]
    unless: [view_11254.id, view_11254.status]
  }

  join: view_11256 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11254.user_id} = ${view_11256.id} ;;
    required_joins: []
  }

  join: view_11257 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11254.account_id} = ${view_11257.account_id} ;;
    required_joins: [view_11256]
  }

  join: view_11258 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11254.category} = ${view_11258.category} ;;
  }

  access_filter: {
    field: view_11254.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11254.is_deleted} = false ;;
}
