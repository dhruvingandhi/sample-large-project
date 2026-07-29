# Explore: explore_0751
# Auto-generated LookML Explore File

include: "/views/domain_04/view_02254.view.lkml"
include: "/views/domain_06/view_02256.view.lkml"
include: "/views/domain_07/view_02257.view.lkml"
include: "/views/domain_08/view_02258.view.lkml"

explore: explore_0751 {
  label: "Explore Explore 0751"
  description: "Comprehensive analytics explore joining base view_02254 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_02254
  
  always_filter: {
    filters: [view_02254.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02254.created_at_date: "7 days"]
    unless: [view_02254.id, view_02254.status]
  }

  join: view_02256 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02254.user_id} = ${view_02256.id} ;;
    required_joins: []
  }

  join: view_02257 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02254.account_id} = ${view_02257.account_id} ;;
    required_joins: [view_02256]
  }

  join: view_02258 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02254.category} = ${view_02258.category} ;;
  }

  access_filter: {
    field: view_02254.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02254.is_deleted} = false ;;
}
