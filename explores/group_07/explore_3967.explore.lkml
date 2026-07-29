# Explore: explore_3967
# Auto-generated LookML Explore File

include: "/views/domain_02/view_11902.view.lkml"
include: "/views/domain_04/view_11904.view.lkml"
include: "/views/domain_05/view_11905.view.lkml"
include: "/views/domain_06/view_11906.view.lkml"

explore: explore_3967 {
  label: "Explore Explore 3967"
  description: "Comprehensive analytics explore joining base view_11902 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_11902
  
  always_filter: {
    filters: [view_11902.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11902.created_at_date: "7 days"]
    unless: [view_11902.id, view_11902.status]
  }

  join: view_11904 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11902.user_id} = ${view_11904.id} ;;
    required_joins: []
  }

  join: view_11905 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11902.account_id} = ${view_11905.account_id} ;;
    required_joins: [view_11904]
  }

  join: view_11906 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11902.category} = ${view_11906.category} ;;
  }

  access_filter: {
    field: view_11902.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11902.is_deleted} = false ;;
}
