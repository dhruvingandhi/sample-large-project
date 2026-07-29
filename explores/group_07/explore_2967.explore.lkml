# Explore: explore_2967
# Auto-generated LookML Explore File

include: "/views/domain_02/view_08902.view.lkml"
include: "/views/domain_04/view_08904.view.lkml"
include: "/views/domain_05/view_08905.view.lkml"
include: "/views/domain_06/view_08906.view.lkml"

explore: explore_2967 {
  label: "Explore Explore 2967"
  description: "Comprehensive analytics explore joining base view_08902 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_08902
  
  always_filter: {
    filters: [view_08902.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08902.created_at_date: "7 days"]
    unless: [view_08902.id, view_08902.status]
  }

  join: view_08904 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08902.user_id} = ${view_08904.id} ;;
    required_joins: []
  }

  join: view_08905 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08902.account_id} = ${view_08905.account_id} ;;
    required_joins: [view_08904]
  }

  join: view_08906 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08902.category} = ${view_08906.category} ;;
  }

  access_filter: {
    field: view_08902.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08902.is_deleted} = false ;;
}
